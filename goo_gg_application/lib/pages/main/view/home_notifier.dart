import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:goo_gg_model/model/match/match_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final SummonerModel? summonerModel;
  final List<MatchHistoryModel>? matches;
  final List<SummonerEntryModel>? entries;

  HomeViewModel({
    this.summonerModel,
    this.matches,
    this.entries,
  });

  String? get id => summonerModel?.id;
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
    final matchIds = [
      "KR_6930313169",
      "KR_6930274134",
    ];
    final data = await FirebaseFirestore.instance
        .collection('summoners')
        .doc('HB2IT8tczz5EjIWV0yEbjVVkuyImTtOoFU0dMSUJPgYb5g')
        .collection('matches')
        .where('matchId', whereIn: matchIds)
        .get();
    print('KBG docs : ${data.docs.length}');
    for (final doc in data.docs) {
      print('KBG doc : ${doc.data()['metadata']}');
    }
  }

  String getBgImage() {
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
  
  void getMatchHistories() {
    final context = buildContext;
    if (context == null) return;
    
    final puuid = state.puuid;
    final id = state.id;
    if (puuid == null || id == null) return;
    
    streamSubscription<List<MatchModel>?>(
      stream: Stream.fromFuture(repository.getMatchIds(puuid, startMatchId))
        .flatMap((value) {
          print('KBG value : $value');
          if (value == null) {
            return const Stream.empty();
          } else {
            /// todo: firestore에서 matchId 저장된것들 비교해서 없는 id list 추출.
            /// 있는 id들은 firestore에서 받아오고 없는 id들은 서버에서 가져오고 저장하기.
            return Stream.fromFuture(repository.getMatchesByIds(id, value));
          }
      }),
      onShowLoading: () => showLoadingDialog(context),
      onHideLoading: () => hideLoadingDialog(context),
      onData: (_) async {
        final matches = await getShortMatches(_, puuid);
        state = state.copyWith(matches: matches);
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
    /// todo: 타이머로 한번 누르고 3분뒤에 다시 누를수 있게
    getSummonerDataBySearchTxt(name);
    //   final isTenMinOver = DateTimeUtil().compareDateByMinutes(model.updatedAt, 10);
    //     // ignore: use_build_context_synchronously
    //     showAppBottomSheet(
    //         context: context,
    //         content: (context) =>
    //             Padding(
    //               padding: const EdgeInsetsApp(horizontal: 16, vertical: 24),
    //               child: Text('${isTenMinOver.$2}분 뒤에 다시 갱신 가능합니다.'),
    //             )
    //     );
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
    // final context = buildContext;
    // if (context == null) return;
    // if (matchIds.isEmpty) return;
    //
    // final puuid = state.puuid;
    // if (puuid == null) return;

    // streamSubscription<List<MatchHistoryModel>>(
    //     stream: Rx.fromCallable(() async {
    //       startMatchId += matchIds.length;
    //       List<String> currentMatchIds = await repository
    //           .getMatchListByPuuid(puuid, startMatchId) ?? [];
    //       matchIds = [...matchIds, ...currentMatchIds];
    //       return await getShortMatches(currentMatchIds, puuid);
    //     }),
    //     onShowLoading: () => showLoadingDialog(context),
    //     onHideLoading: () => hideLoadingDialog(context),
    //     onData: (_) {
    //       var matches = state.matches;
    //       state = state.copyWith(matches: [...matches ?? [], ..._]);
    //     }
    // );
  }

  // Stream<(SummonerModel?, List<SummonerEntryModel>?, List<MatchHistoryModel>)>
  // getSummonerInfo(String name) => Rx.fromCallable(() async {
  //   final summoner = await repository.getSummonersByName(name);
  //   final summonerModel = summoner.model;
  //
  //   List<SummonerEntryModel>? entries;
  //   List<MatchHistoryModel> shortMatches = [];
  //   if (summonerModel != null) {
  //     entries = await repository.getSummonerEntriesById(summonerModel.id);
  //
  //     matchIds = await repository
  //         .getMatchListByPuuid(summonerModel.puuid, startMatchId) ?? [];
  //     shortMatches = await getShortMatches(matchIds, summonerModel.puuid);
  //   }
  //   return (summonerModel, entries, shortMatches);
  // });
}