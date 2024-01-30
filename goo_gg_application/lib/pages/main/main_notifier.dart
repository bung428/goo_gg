import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:goo_gg_application/data/model/match/match_history_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
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
  final scrollController = ScrollController();

  int startMatchId = 0;
  List<String> matchIds = [];

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
          matches: _.$3,
        );
      },
      onError: (e) {
        showExceptionBuilder(context, e);
        return;
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
      matchIds = await repository
          .getMatchListByPuuid(summonerModel.puuid, startMatchId) ?? [];
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
    List<MatchInfoModel> infoList = [];
    for (final id in matchIds) {
      final result = await repository.getMatchesByMatchId(id);
      if (result != null) {
        infoList.add(result.info);
        // final infoModel = result.info;
        // // final image = await repository.getImageData(infoModel.c)
        // list.add(MatchHistoryModel(
        //   summarizedMatch: SummarizedMatchModel(
        //     gameInfo: infoModel.getGameInfo(puuid),
        //     summonerRecord: infoModel.getSummonerInfo(puuid),
        //   ),
        //   gameDetailInfo: infoModel.gameDetailInfo(),
        //   gameAnalysis: infoModel.getGameAnalysis(),
        //   expanded: false,
        // ));
      }
    }

    for (final info in infoList) {
      List<ui.Image?> images = [];
      for (final urlStr in info.champUrls) {
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

  void changeMatchExpansion(int index, bool isExpanded) {
    List<MatchHistoryModel>? list = state.matches;
    if (list == null || list.isEmpty) return;

    list[index] = list[index].copyWith(expanded: isExpanded);
    state = state.copyWith(matches: list);
  }

  Future<void> loadMoreMatches() async {
    final context = buildContext;
    if (context == null) return;
    if (matchIds.isEmpty) return;

    final puuid = state.puuid;
    if (puuid == null) return;

    streamSubscription<List<MatchHistoryModel>>(
      stream: Rx.fromCallable(() async {
        startMatchId += matchIds.length;
        List<String> currentMatchIds = await repository
            .getMatchListByPuuid(puuid, startMatchId) ?? [];
        matchIds = [...matchIds, ...currentMatchIds];
        return await getShortMatches(currentMatchIds, puuid);
      }),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) {
        var matches = state.matches;
        state = state.copyWith(matches: [...matches ?? [], ..._]);
      }
    );
  }
}

class MainViewModel {
  final SummonerModel? summonerModel;
  final List<SummonerEntryModel>? entries;
  final List<MatchHistoryModel>? matches;

  MainViewModel({
    this.summonerModel,
    this.matches,
    this.entries,
  });

  String? get puuid => summonerModel?.puuid;

  MainViewModel copyWith({
    SummonerModel? summonerModel,
    List<SummonerEntryModel>? entries,
    List<MatchHistoryModel>? matches,
  }) => MainViewModel(
    summonerModel: summonerModel ?? this.summonerModel,
    matches: matches ?? this.matches,
    entries: entries ?? this.entries,
  );
}