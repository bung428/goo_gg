import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/data/riot_repository.dart';
import 'package:goo_gg_application/data/summoner/enum/riot_api_type.dart';
import 'package:goo_gg_application/data/summoner/enum/summoner_rest.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/model/api_resp_model.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/service/dio_service.dart';
import 'package:goo_gg_model/model/match/match_model.dart';
import 'package:goo_gg_model/model/summoner/account_model.dart';
import 'package:goo_gg_model/model/summoner/enum/queue_type.dart';
import 'package:goo_gg_model/model/summoner/summoner_entry_model.dart';
import 'package:rxdart/rxdart.dart';

const krBaseUrl = 'https://kr.api.riotgames.com';
const asiaBaseUrl = 'https://asia.api.riotgames.com';

class SummonerRepository extends RiotRepository {
  final accountApiUrl = '$asiaBaseUrl${RiotApiType.account.api}';
  final summonerApiUrl = '$krBaseUrl${RiotApiType.summoner.api}';
  final matchApiUrl = '$asiaBaseUrl${RiotApiType.match.api}';
  final leagueApiUrl = '$krBaseUrl${RiotApiType.league.api}';

  @override
  RiverRepository createRiverRepo() => SummonerRepository();

  Future<(SummonerModel?, List<SummonerEntryModel>?)?> getSummonerByName(String name) async {
    try {
      final response = await dio.post(
        '$baseUrl/summonerInfo', data: {'name': name});
      List list = response.data['entries'];
      final summoner = SummonerModel.fromJson(response.data['data']);
      final entries = list.map((e) => SummonerEntryModel.fromJson(e)).toList();
      await AuthService.instance.setSummonerInfo(summoner);
      await AuthService.instance.setSummonerEntries(entries);
      return (summoner, entries);
    } catch (_) {
      return null;
    }
  }

  Future<List<String>?> getMatchIds(String puuid, int start) async {
    try {
      final data = {
        'puuid': puuid,
        'start': start,
      };
      final response = await dio.post('$baseUrl/matchIds', data: data);
      final List list = response.data;
      return list.map((e) => e.toString()).toList();
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<MatchModel>?> getMatchesByIds(String id, List<String> ids) async {
    if (ids.isEmpty) return null;
    try {
      final data = {
        'id': id,
        'matchIds': ids
      };
      final response = await dio.post('$baseUrl/matches', data: data);
      final List list = response.data;
      return list.map((e) => MatchModel.fromJson(e)).toList();
    } on DioException catch (e) {
      return null;
    }
  }
  
  Future<Uint8List?> getImageData(String url) async {
    try {
      // final response = await dio.get(url);
      final response = await Dio().get<Uint8List>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: dio.options.headers
        )
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }
}