import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/data/riot_repository.dart';
import 'package:goo_gg_application/service/firebase/firestore_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';
import 'package:goo_gg_model/model/firestore/matchId_model.dart';
import 'package:goo_gg_model/model/riot/match/match_model.dart';

class MatchRepository extends RiotRepository {
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
        final saved = await addMatchIdsInFirestore(matchIds, id);
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

  Future<List<String>?> addMatchIdsInFirestore(List<String>? matchIds, String id) async {
    if (matchIds == null || matchIds.isEmpty) return null;
    try {
      List<String>? result = matchIds;
      final doc = FirestoreService.instance
          .collection(StoreCollection.matchIds)
          .doc(id);
      final snapshot = await doc.get();
      final oldData = snapshot.data();
      if (snapshot.exists && oldData != null) {
        final model = MatchIdModel.fromJson(oldData);
        result = [...model.matchIds, ...matchIds];
        result = result.toSet().toList();
        await doc.update({
          'matchIds': result,
          'updatedAt': DateTime.now()
        });
      } else {
        await doc.set({
          'matchIds': matchIds,
          'updatedAt': DateTime.now()
        });
      }
      return result;
    } catch (e) {
      debugPrint('KBG addMatchIdsInFirestore : error : $e');
      return null;
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
      final resultIds = await addMatchIdsInFirestore(result, id);
      return resultIds;
    } catch (e) {
      debugPrint('KBG getMatchIds : error : $e');
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

  Future<MatchModel?> getMatchesById(String id, String matchId) async {
    try {
      final data = {
        'id': id,
        'matchId': matchId,
      };
      final response = await dio.post('$baseUrl/match', data: data);
      return MatchModel.fromJson(response.data);
    } catch (e) {
      debugPrint('KBG getMatchesById error : ${e.toString()}');
      return null;
    }
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
      debugPrint('KBG getMatchesByIds error : ${e.toString()}');
      return null;
    }
  }

  @override
  RiverRepository createRiverRepo() => MatchRepository();
}