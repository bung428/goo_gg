import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:goo_gg_application/data/model/match/match_history_model.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_application/widget/dialog/app_dialog.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:rxdart/rxdart.dart';

class MainNotifier extends RiverNotifier<MainViewModel>
    with AppStreamSubscription{
  MainNotifier(super.state, this.repository);

  final SummonerRepository repository;

  @override
  void onInit() async {
    final model = await AuthService.instance.summonerFuture;
    print('KBG model : $model');
  }

  Future<void> searchSummoners(String name) async {
    final model = await AuthService.instance.summonerFuture;
    if (model != null) {
      if (DateTimeUtil().compareDateByMinutes(model.revisionDate, 10)) {
        fetchSummonerDataBySearchTxt(name);
      } else {
        state = state.copyWith(summonerModel: model);
      }
    } else  {
      fetchSummonerDataBySearchTxt(name);
    }
  }

  void fetchSummonerDataBySearchTxt(String name) {
    final context = buildContext;
    if (context == null) return;
    streamSubscription<(SummonerModel?, List<SummonerEntryModel>?, List<MatchHistoryModel>)>(
      stream: getSummonerInfo(name),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) {
        state = state.copyWith(
          summonerModel: _.$1,
          entries: _.$2,
          shortMatches: _.$3,
        );
      }
    );
  }

  Stream<(SummonerModel?, List<SummonerEntryModel>?, List<MatchHistoryModel>)>
      getSummonerInfo(String name) => Rx.fromCallable(() async {
    final summoner = await repository.getSummonersByName(name);
    final summonerModel = summoner.model;
    List<SummonerEntryModel>? entries;
    List<MatchHistoryModel> shortMatches = [];
    if (summonerModel != null) {
      entries = await repository.getSummonerEntriesById(summonerModel.id);
      final matchIds = await repository.getMatchListByPuuid(summonerModel.puuid, 0);
      shortMatches = await getShortMatches(matchIds, summonerModel.puuid);
    }

    return (summonerModel, entries, shortMatches);
  });

  Future<List<MatchHistoryModel>> getShortMatches(
    List<String>? matchIds,
    String puuid
  ) async {
    if (matchIds == null || matchIds.isEmpty) return [];
    List<MatchHistoryModel> list = [];
    for (final id in matchIds) {
      final result = await repository.getMatchesByMatchId(id);
      if (result != null) {
        final infoModel = result.info;
        list.add(MatchHistoryModel(
          gameInfo: infoModel.getGameInfoModel(puuid),
          summonerRecord: infoModel.getSummonerInfoModel(puuid),
          blueTeam: infoModel.blueTeam,
          redTeam: infoModel.redTeam,
          expanded: false,
        ));
      }
    }
    return list;
  }

  void test() async {
    final result = await repository.getMatchesByMatchId('KR_6917338399');
    print('KBG result : $result');
  }

  void changeMatchExpansion(int index, bool isExpanded) {
    print('KBG index : $index : isExpanded : $isExpanded');
    List<MatchHistoryModel>? list = state.shortMatches;
    if (list == null || list.isEmpty) return;

    list[index] = list[index].copyWith(expanded: isExpanded);
    state = state.copyWith(shortMatches: list);
  }
}

class TestModel {
  final String title;
  final String body;
  bool expanded;

  TestModel({
    required this.title,
    required this.body,
    this.expanded = false
  });
}

class MainViewModel {
  final SummonerModel? summonerModel;
  final List<SummonerEntryModel>? entries;
  final List<MatchHistoryModel>? shortMatches;

  MainViewModel({
    this.summonerModel,
    this.shortMatches,
    this.entries,
  });

  MainViewModel copyWith({
    SummonerModel? summonerModel,
    List<SummonerEntryModel>? entries,
    List<MatchHistoryModel>? shortMatches,
  }) => MainViewModel(
    summonerModel: summonerModel ?? this.summonerModel,
    shortMatches: shortMatches ?? this.shortMatches,
    entries: entries ?? this.entries,
  );
}