import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_model/model/match/match_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:rxdart/rxdart.dart';

class MainNotifier extends RiverNotifier<MainViewModel>
    with AppStreamSubscription{
  MainNotifier(super.state, this.repository);

  final SummonerRepository repository;

  @override
  void onInit() async {
    // final model = await AuthService.instance.summonerFuture;
    // print('KBG model : $model');
    // if (model != null) {
    //   state = state.copyWith(summonerModel: model);
    // }
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
    streamSubscription(
      stream: getSummonerInfo(name),
      onData: (_) async {
        if (state.summonerModel != null) {
          final matchIds = await repository.getMatchListByPuuid(
            state.summonerModel!.puuid
          );
          if (matchIds != null) {
            List<MatchModel?> matches = [];
            for (final id in matchIds) {
              final result = await repository.getMatchesByMatchId(id);
              matches.add(result);
            }
            state = state.copyWith(matches: matches);
          }
        }
      }
    );
  }

  Stream<void> getSummonerInfo(String name) => Rx.fromCallable(() async {
    final summoner = await repository.getSummonersByName(name);
    final summonerModel = summoner.model;
    if (summonerModel != null) {
      final entries = await repository
          .getSummonerEntriesById(summonerModel.id);
      state = state.copyWith(
        summonerModel: summonerModel,
        entries: entries,
      );
    }
  });
}

class MainViewModel {
  final SummonerModel? summonerModel;
  final List<SummonerEntryModel>? entries;
  final List<MatchModel?>? matches;

  MainViewModel({
    this.summonerModel,
    this.entries,
    this.matches,
  });

  MainViewModel copyWith({
    SummonerModel? summonerModel,
    List<SummonerEntryModel>? entries,
    List<MatchModel?>? matches,
  }) => MainViewModel(
    summonerModel: summonerModel ?? this.summonerModel,
    entries: entries ?? this.entries,
    matches: matches ?? this.matches,
  );
}