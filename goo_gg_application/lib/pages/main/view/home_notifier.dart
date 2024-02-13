import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/service/firebase/firestore_service.dart';
import 'package:goo_gg_application/widget/dialog/app_bottom_sheet.dart';
import 'package:goo_gg_application/widget/dialog/app_dialog.dart';
import 'package:goo_gg_model/model/riot/match/match_info_model.dart';
import 'package:goo_gg_model/model/riot/match/match_model.dart';
import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final SummonerModel? summonerModel;
  final List<String>? matchIds;
  final List<MatchHistoryModel>? matches;
  final List<SummonerEntryModel>? entries;

  HomeViewModel({
    this.summonerModel,
    this.matchIds,
    this.matches,
    this.entries,
  });

  String? get id => summonerModel?.id;
  String? get puuid => summonerModel?.puuid;

  HomeViewModel copyWith({
    SummonerModel? summonerModel,
    List<String>? matchIds,
    List<SummonerEntryModel>? entries,
    List<MatchHistoryModel>? matches,
  }) => HomeViewModel(
    summonerModel: summonerModel ?? this.summonerModel,
    matchIds: matchIds ?? this.matchIds,
    matches: matches ?? this.matches,
    entries: entries ?? this.entries,
  );
}

class HomeNotifier extends RiverNotifier<HomeViewModel>
    with AppStreamSubscription {
  HomeNotifier(super.state, this.repository);

  final SummonerRepository repository;

  final scrollController = ScrollController();

  int startMatchId = 0;
  String summonerName = '';
  List<String> imagePaths = [
    'bgImg/aatrox',
    'bgImg/ahri',
    'bgImg/akshan',
    'bgImg/azir',
    'bgImg/draven',
    'bgImg/drmundo',
    'bgImg/ezreal',
    'bgImg/gragas',
    'bgImg/gwen',
    'bgImg/irelia',
    'bgImg/jarvaniv',
    'bgImg/kalista',
    'bgImg/katarina',
    'bgImg/kayn',
    'bgImg/kennen',
    'bgImg/lissandra',
    'bgImg/malzahar',
    'bgImg/masteryi',
    'bgImg/nidalee',
    'bgImg/pantheon',
  ];

  @override
  void onInit() {

  }
  
  void test() async {
    final query = await FirestoreService.instance
        .collection(StoreCollection.summoners)
        .where('name', isEqualTo: '석춧가루')
        .get();
    final model = SummonerModel.fromJson(query.docs.first.data());
    print('KBG model : ${model.toJson()}');
    // final matchIds = [
    //   "KR_6930313169",
    //   "KR_6930274134",
    // ];
    // final data = await FirebaseFirestore.instance
    //     .collection('summoners')
    //     .doc('HB2IT8tczz5EjIWV0yEbjVVkuyImTtOoFU0dMSUJPgYb5g')
    //     .collection('matches')
    //     .where('matchId', whereIn: matchIds)
    //     .get();
    // print('KBG docs : ${data.docs.length}');
    // for (final doc in data.docs) {
    //   print('KBG doc : ${doc.data()['metadata']}');
    // }
  }

  String _getBgImage() {
    final random = Random();
    final randomIndex = random.nextInt(imagePaths.length);
    return imagePaths[randomIndex];
  }
  
  void refreshSummoner() {

  }

  void requestInGame() {
    final context = buildContext;
    if (context == null) return;
    showAppBottomSheet(
        context: context,
        content: (context) => const Padding(
          padding: EdgeInsetsApp(horizontal: 16, vertical: 24),
          child: Text('개발중인 기능입니다.'),
        )
    );
  }

  void getSummonerDataBySearchTxt(String name) {
    final context = buildContext;
    if (context == null) return;
    streamSubscription(
      stream: Stream.fromFuture(repository.getSummonerByName(name)),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) async {
        summonerName = _getBgImage();
        state = state.copyWith(
          summonerModel: _?.$1,
          entries: _?.$2,
        );
        getMatchHistories();
      },
      onError: (e) {
        showExceptionBuilder(context, e);
        return;
      });
  }
  
  void getMatchHistories() async {
    final context = buildContext;
    if (context == null) return;

    final puuid = state.puuid;
    final id = state.id;
    if (puuid == null || id == null) return;

    streamSubscription<List<MatchHistoryModel>?>(
      stream: Stream.fromFuture(repository.initMatchIdProcess(id, puuid, startMatchId))
        .flatMap((value) {
          if (value == null) {
            return const Stream.empty();
          } else {
            state = state.copyWith(matchIds: value);
            return Stream.fromFuture(repository.initMatchesProcess(id, value))
                .flatMap((value) => Stream.fromFuture(getShortMatches(value, puuid)));
          }
      }),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) async {
        _?.sort((a, b) {
          final aUpdatedAt = a.summarizedMatch.gameInfo.finishedAt;
          final bUpdatedAt = b.summarizedMatch.gameInfo.finishedAt;
          if (aUpdatedAt == null && bUpdatedAt == null) {
            return 0;
          } else if (aUpdatedAt == null) {
            return 1;
          } else if (bUpdatedAt == null) {
            return -1;
          } else {
            return bUpdatedAt.compareTo(aUpdatedAt);
          }
        });
        state = state.copyWith(matches: _);
      }
    );
  }

  // void changeMatchExpansion(int index, bool isExpanded) {
  //   List<MatchHistoryModel>? list = state.matches;
  //   if (list == null || list.isEmpty) return;
  //
  //   list[index] = list[index].copyWith(expanded: isExpanded);
  //   state = state.copyWith(matches: list);
  // }

  Future<void> searchSummoner(String name) async {
    final context = buildContext;
    if (context == null) return;
    /// todo: 타이머로 한번 누르고 3분뒤에 다시 누를수 있게
    getSummonerDataBySearchTxt(name);
  }

  Future<List<MatchHistoryModel>> getShortMatches(
    List<MatchModel>? matches,
    String? puuid
  ) async {
    if (matches == null || matches.isEmpty || puuid == null) return [];
    List<MatchHistoryModel> list = [];
    List<MatchInfoModel?> infoList = matches.map((e) => e.info).toList();

    for (final info in infoList) {
      if (info == null) continue;

      List<ui.Image?> images = [];
      for (final urlStr in info.champUrls) {
        if (urlStr == null) continue;
        final url = DataCdnUrl.getChampionIconUrl(urlStr);
        final imgList = await repository.getImageData(url);
        if (imgList == null) {
          images.add(null);
        } else {
          images.add(await decodeImageFromList(imgList));
        }
      }
      list.add(MatchHistoryModel(
        summarizedMatch: SummarizedMatchModel(
          gameInfo: info.getGameInfo(puuid),
          summonerRecord: info.getSummonerInfo(puuid),
        ),
        gameDetailInfo: info.gameDetailInfo(),
        gameAnalysis: info.getGameAnalysis(images),
        expanded: false,
      ));
    }
    return list;
  }

  Future<void> loadMoreMatches() async {
    final context = buildContext;
    if (context == null) return;

    final id = state.id;
    final puuid = state.puuid;
    if (puuid == null || id == null) return;
    List<String>? currentMatchIds = state.matchIds;
    if (currentMatchIds == null || currentMatchIds.isEmpty) return;

    startMatchId += currentMatchIds.length;

    streamSubscription<List<MatchHistoryModel>>(
      stream: Stream.fromFuture(repository.getMatchIds(id, puuid, startMatchId))
        .flatMap((value) => Stream.fromFuture(repository.initMatchesProcess(id, value))
          .flatMap((value) => Stream.fromFuture(getShortMatches(value, puuid)))),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) {
        summonerName = _getBgImage();

        var matches = state.matches ?? [];
        matches.addAll(_);
        matches.toSet().toList();
        matches.sort((a, b) {
          final aUpdatedAt = a.summarizedMatch.gameInfo.finishedAt;
          final bUpdatedAt = b.summarizedMatch.gameInfo.finishedAt;
          if (aUpdatedAt == null && bUpdatedAt == null) {
            return 0;
          } else if (aUpdatedAt == null) {
            return 1;
          } else if (bUpdatedAt == null) {
            return -1;
          } else {
            return bUpdatedAt.compareTo(aUpdatedAt);
          }
        });
        state = state.copyWith(matches: matches);
      }
    );
  }
}