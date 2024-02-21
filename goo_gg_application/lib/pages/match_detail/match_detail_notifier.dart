import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:flutter_base_template/widget/dialog/app_bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/data/match/model/game_info_model.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';
import 'package:goo_gg_application/data/match/repository/match_repository.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/model/detail_tab_model.dart';
import 'package:goo_gg_application/pages/match_detail/enum/detail_tab.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/service/firebase/firestore_service.dart';
import 'package:goo_gg_model/model/riot/match/match_info_model.dart';
import 'package:goo_gg_model/model/riot/match/match_model.dart';

class MatchDetailViewModel {
  final GameInfoModel? gameInfo;
  final List<PlayerInfoModel>? players;
  final List<GameAnalysisModel>? analysis;
  final List<DetailTabModel>? tabs;

  MatchDetailViewModel({
    this.tabs,
    this.gameInfo,
    this.players,
    this.analysis,
  });

  MatchDetailViewModel copyWith({
    GameInfoModel? gameInfo,
    List<PlayerInfoModel>? players,
    List<GameAnalysisModel>? analysis,
    List<DetailTabModel>? tabs,
  }) => MatchDetailViewModel(
      gameInfo: gameInfo ?? this.gameInfo,
      players: players ?? this.players,
      analysis: analysis ?? this.analysis,
      tabs: tabs ?? this.tabs
  );
}

class MatchDetailNotifier extends RiverNotifier<MatchDetailViewModel>
    with AppStreamSubscription {
  SummonerModel? summoner;

  final String matchId;
  final MatchRepository match;

  MatchDetailNotifier(super.state, this.matchId, this.match);

  @override
  void onInit() async {
    await _setSummoner();
    getMatchesAnalysis();
    state = state.copyWith(
        tabs: DetailTab.values
            .map((e) => DetailTabModel(
            tab: e, selected: e == DetailTab.values.first ? true : false))
            .toList()
    );
  }

  Future<void> _setSummoner() async {
    final summoner = await AuthService.instance.summonerFuture;
    if (summoner == null) return;
    this.summoner = summoner;
  }

  void changeTab(DetailTab tab) {
    final tabs = state.tabs;
    if (tabs == null || tabs.isEmpty) return;
    for (var tabModel in tabs) {
      tabModel.selected = (tabModel.tab == tab);
    }

    state = state.copyWith(tabs: tabs);
  }

  void getMatchesAnalysis() async {
    final context = buildContext;
    if (context == null) return;

    if (summoner == null) {
      // ignore: use_build_context_synchronously
      final result = await showAppBottomSheet(
        context: context,
        isDismissible: false,
        content: (context) => const Text('소환사 경기 정보를 불러오는데 알 수 없는 에러가 발생했습니다.'),
        action: (context) => Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent
            ),
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text('확인', style: TextStyle(color: Colors.white),)
              )
            )
          ),
        )
      );
      if (result == true) {
        // ignore: use_build_context_synchronously
        context.pop();
      }
      return;
    }
    final query = await FirestoreService.instance
        .collection(StoreCollection.summoners)
        .doc(summoner!.id)
        .collection('matches')
        .where('matchId', isEqualTo: matchId)
        .get();
    /// todo: matchDetail 화면에서 쓸 정보로 모델 만들기.
    if (query.docs.isNotEmpty) {
      /// todo: firestore 정보로 모델로 받아서 뷰 그려주기
      final info = MatchInfoModel.fromJson(query.docs.first.data()['info']);
      state = state.copyWith(
        gameInfo: info.getGameInfo(summoner!.puuid),
        analysis: info.getGameAnalysis(),
        players: info.getPlayersRecords(),
      );
    } else {
      /// todo: 서버로 부터 match 정보 받아오기
      streamSubscription<MatchModel?>(
        stream: Stream.fromFuture(match.getMatchesById(summoner!.id, matchId)),
        onData: (_) {
          if (_ != null) {
            state = state.copyWith(
              gameInfo: _.info?.getGameInfo(summoner!.puuid),
              analysis: _.info?.getGameAnalysis(),
              players: _.info?.getPlayersRecords(),
            );
          }
        }
      );
    }
  }
}