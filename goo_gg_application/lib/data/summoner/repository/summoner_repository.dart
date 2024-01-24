import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/data/summoner/enum/riot_api_type.dart';
import 'package:goo_gg_application/data/summoner/enum/summoner_rest.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/model/api_resp_model.dart';
import 'package:goo_gg_application/model/enum/api_state.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/service/dio_service.dart';
import 'package:goo_gg_model/model/match/match_model.dart';
import 'package:goo_gg_model/model/summoner/account_model.dart';
import 'package:goo_gg_model/model/summoner/enum/queue_type.dart';
import 'package:goo_gg_model/model/summoner/summoner_account_model.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';

/// todo: 24시간만 유효한 devApi key
const riotApiKey = 'RGAPI-b12ca12c-d37f-4cf4-9f20-4ffae2b6f82a';

const krBaseUrl = 'https://kr.api.riotgames.com';
const asiaBaseUrl = 'https://asia.api.riotgames.com';

class SummonerRepository extends RiverRepository {
  final dio = DioService.instance.dio;
  final accountApiUrl = '$asiaBaseUrl${RiotApiType.account.api}';
  final summonerApiUrl = '$krBaseUrl${RiotApiType.summoner.api}';
  final matchApiUrl = '$asiaBaseUrl${RiotApiType.match.api}';
  final leagueApiUrl = '$krBaseUrl${RiotApiType.league.api}';

  @override
  RiverRepository createRiverRepo() => SummonerRepository();

  @override
  void init() {
    final headers = {
      'X-Riot-Token': riotApiKey,
    };
    DioService.instance.setHeader(headers);
  }

  Future<ApiRespModel<SummonerModel?>> getSummonersByName(String name) async {
    try {
      final response = await dio.get(
          '$summonerApiUrl${SummonerRest.byName.rest}/$name'
      );
      final model = SummonerAccountModel.fromJson(response.data);
      final accountModel = await getAccountByPuuid(model.puuid);
      if (accountModel == null) {
        return ApiRespModel.fail(Exception('Account Model is null'));
      }
      final result = await AuthService.instance.setSummonerInfo(
        model, accountModel
      );

      return ApiRespModel(model: result, state: ApiState.success);
    } on DioException catch (e) {
      return ApiRespModel.fail(e);
    }
  }

  Future<AccountModel?> getAccountByPuuid(String id) async {
    try {
      final response = await dio.get(
        '$accountApiUrl${SummonerRest.byPuuid.rest}/$id'
      );
      return AccountModel.fromJson(response.data);
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<SummonerEntryModel>?> getSummonerEntriesById(String id) async {
    try {
      final response = await dio.get(
        '$leagueApiUrl${SummonerRest.bySummoner.rest}/$id'
      );
      List list = response.data;
      List<SummonerEntryModel> result = list
          .map((e) => SummonerEntryModel.fromJson(e)).toList();
      if (result.first.type == QueueType.free) {
        result = result.reversed.toList();
      }
      await AuthService.instance.setSummonerEntries(result);
      return result;
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<String>?> getMatchListByPuuid(String id) async {
    try {
      final response = await dio.get(
        '$matchApiUrl${SummonerRest.byPuuid.rest}/$id/ids'
      );
      List list = response.data;
      return list.map((e) => e.toString()).toList();
    } on DioException catch (e) {
      return null;
    }
  }

  Future<MatchModel?> getMatchesByMatchId(String id) async {
    try {
      final response = await dio.get(
        '$matchApiUrl/$id'
      );
      return MatchModel.fromJson(response.data);
    } on DioException catch (e) {
      return null;
    }
  }
}