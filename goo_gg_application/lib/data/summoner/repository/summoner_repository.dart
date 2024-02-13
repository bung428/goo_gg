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
import 'package:goo_gg_application/service/firebase/firestore_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_model/model/firestore/matchId_model.dart';
import 'package:goo_gg_model/model/riot/match/match_model.dart';
import 'package:goo_gg_model/model/riot/summoner/summoner_entry_model.dart';
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
      final entries = list.map((e) => SummonerEntryModel.fromJson(e))
          .toList();
      await AuthService.instance.setSummonerInfo(summoner);
      await AuthService.instance.setSummonerEntries(entries);
      return (summoner, entries);
    } catch (_) {
      print('KBG error : $_');
      return null;
    }
    // final query = await FirestoreService.instance
    //     .collection(StoreCollection.summoners)
    //     .where('name', isEqualTo: name)
    //     .get();
    // if (query.size > 0) {
    //   /// todo: firstore에 저장된 정보라면 하루차이 확인 후 업데이트 할지 말지 프로세스.
    //   // final model = SummonerModel
    // } else {
    //   try {
    //     final response = await dio.post(
    //         '$baseUrl/summonerInfo', data: {'name': name});
    //     List list = response.data['entries'];
    //     final summoner = SummonerModel.fromJson(response.data['data']);
    //     final entries = list.map((e) => SummonerEntryModel.fromJson(e))
    //         .toList();
    //     await AuthService.instance.setSummonerInfo(summoner);
    //     await AuthService.instance.setSummonerEntries(entries);
    //     return (summoner, entries);
    //   } catch (_) {
    //     return null;
    //   }
    // }
  }

  Future<List<String>?> initMatchIdProcess(
    String id,
    String puuid,
    int start
  ) async {
    MatchIdModel? matchIdModel = await getMatchIdFromFirestore(id);
    if (matchIdModel == null) {
      return await getMatchIds(id, puuid, start);
    } else {
      final isUpdate = DateTimeUtil().calculateDayDifference(matchIdModel.updatedAt);
      if (isUpdate) {
        final matchIds = await getMatchIds(id, puuid, start);
        if (matchIds == null) return null;
        List<String> saved = matchIdModel.matchIds;
        saved.addAll(matchIds);
        saved = saved.toSet().toList();
        matchIdModel = matchIdModel.copyWith(
          matchIds: saved
        );
        await FirestoreService.instance.writeInDoc(
          id,
          StoreCollection.matchIds,
          matchIdModel.toJson()
        );
        return saved;
      } else {
        return matchIdModel.matchIds;
      }
    }
  }

  Future<MatchIdModel?> getMatchIdFromFirestore(String id) async {
    final doc = await FirestoreService.instance
        .doc(StoreCollection.matchIds, id)
        .get();
    if (doc.exists) {
      if (doc.data() == null) return null;
      return MatchIdModel.fromJson(doc.data()!);
    }
    return null;
  }

  Future<void> addMatchIdsInFirestore(List<String>? matchIds, String id) async {
    if (matchIds == null || matchIds.isEmpty) return;
    try {
      final doc = FirestoreService.instance
          .collection(StoreCollection.matchIds)
          .doc(id);
      final snapshot = await doc.get();
      final oldData = snapshot.data();
      if (snapshot.exists && oldData != null) {
        final model = MatchIdModel.fromJson(oldData);
        var list = [...model.matchIds, ...matchIds];
        list = list.toSet().toList();
        await doc.update({
          'matchIds': list.toSet().toList(),
          'updatedAt': DateTime.now()
        });
      } else {
        await doc.set({
          'matchIds': matchIds,
          'updatedAt': DateTime.now()
        });
      }
    } catch (e) {
      print('KBG error : $e');
    }
  }

  Future<List<String>?> getMatchIds(String id, String puuid, int start) async {
    try {
      final data = {
        'puuid': puuid,
        'start': start,
      };
      final response = await dio.post('$baseUrl/matchIds', data: data);
      final List list = response.data;
      final result = list.map((e) => e.toString()).toList();
      await addMatchIdsInFirestore(result, id);
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<List<MatchModel>?> initMatchesProcess(String id, List<String>? ids) async {
    if (ids == null || ids.isEmpty) return null;
    final saved = await getMatchIdsByFirestore(id);
    if (saved != null) {
      final nonOverlapIds = ids.where((id) => !saved.contains(id)).toList();
      final overlapsIds = ids.where((id) => saved.contains(id)).toList();
      final matchesByRiot = nonOverlapIds.isNotEmpty
          ? await getMatchesByIds(id, nonOverlapIds)
          : [];
      final matchesByFirestore = await getMatchesByIdsInFirestore(id, overlapsIds);
      return [...matchesByFirestore ?? [], ...?matchesByRiot];
    }
    return await getMatchesByIds(id, ids);
  }

  Future<List<String>?> getMatchIdsByFirestore(String id) async {
    final query = await FirestoreService.instance
        .doc(StoreCollection.summoners,id)
        .collection(StoreCollection.matches.path)
        .get();
    if (query.size > 0) {
      return query.docs.map((e) => e.data()['matchId'].toString()).toList();
    }
    return null;
  }

  Future<List<MatchModel>?> getMatchesByIdsInFirestore(String id, List<String> ids) async {
    final query = await FirestoreService.instance
        .doc(StoreCollection.summoners,id)
        .collection(StoreCollection.matches.path)
        .get();
    if (query.size > 0) {
      final result = query.docs.where((e) => ids.contains(e['matchId'])).toList();
      return result.map((e) => MatchModel.fromJson(e.data())).toList();
    }
    return null;
  }

  Future<List<MatchModel>?> getMatchesByIds(String id, List<String>? ids) async {
    if (ids == null || ids.isEmpty) return null;
    try {
      final data = {
        'id': id,
        'matchIds': ids,
      };
      final response = await dio.post('$baseUrl/matches', data: data);
      final List list = response.data;
      return list.map((e) => MatchModel.fromJson(e)).toList();
    } catch (e) {
      print('KBG matches error : ${e.toString()}');
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