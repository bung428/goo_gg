import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';
import 'package:goo_gg_application/data/riot_data_cdn_url.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_application/widget/dialog/app_bottom_sheet.dart';
import 'package:goo_gg_application/widget/dialog/app_dialog.dart';
import 'package:goo_gg_model/model/match/match_info_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final SummonerModel? summonerModel;
  final List<SummonerEntryModel>? entries;
  final List<MatchHistoryModel>? matches;

  HomeViewModel({
    this.summonerModel,
    this.matches,
    this.entries,
  });

  String? get puuid => summonerModel?.puuid;

  HomeViewModel copyWith({
    SummonerModel? summonerModel,
    List<SummonerEntryModel>? entries,
    List<MatchHistoryModel>? matches,
  }) => HomeViewModel(
    summonerModel: summonerModel ?? this.summonerModel,
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
  List<String> matchIds = [];

  @override
  void onInit() {
    // TODO: implement onInit
  }

  void refreshSummoner() {
    print('KBG summonerName : $summonerName');
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

  void changeMatchExpansion(int index, bool isExpanded) {
    List<MatchHistoryModel>? list = state.matches;
    if (list == null || list.isEmpty) return;

    list[index] = list[index].copyWith(expanded: isExpanded);
    state = state.copyWith(matches: list);
  }

  Future<void> searchSummoner(String name) async {
    final context = buildContext;
    if (context == null) return;

    final model = await AuthService.instance.summonerFuture;
    if (model != null) {
      /// todo: 내 db에 저장해서 updateAt 관리해야함....
      final isTenMinOver = DateTimeUtil().compareDateByMinutes(model.revisionDate, 10);

      if (isTenMinOver.$1) {
        fetchSummonerDataBySearchTxt(name);
      } else {
        // ignore: use_build_context_synchronously
        showAppBottomSheet(
            context: context,
            content: (context) =>
                Padding(
                  padding: const EdgeInsetsApp(horizontal: 16, vertical: 24),
                  child: Text('${isTenMinOver.$2}분 뒤에 다시 갱신 가능합니다.'),
                )
        );
      }
    } else  {
      fetchSummonerDataBySearchTxt(name);
    }

    summonerName = name;
  }

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

  Stream<(SummonerModel?, List<SummonerEntryModel>?, List<MatchHistoryModel>)>
  getSummonerInfo(String name) => Rx.fromCallable(() async {
    final summoner = await repository.getSummonersByName(name);
    final summonerModel = summoner.model;

    List<SummonerEntryModel>? entries;
    List<MatchHistoryModel> shortMatches = [];
    if (summonerModel != null) {
      entries =
      await repository.getSummonerEntriesById(summonerModel.id);

      matchIds = await repository.getMatchListByPuuid(
          summonerModel.puuid, startMatchId) ??
          [];
      shortMatches =
      await getShortMatches(matchIds, summonerModel.puuid);
    }
    return (summonerModel, entries, shortMatches);
  });
}