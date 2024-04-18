import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/data/riot_repository.dart';
import 'package:goo_gg_application/data/summoner/model/summoner_model.dart';
import 'package:goo_gg_application/service/auth_service.dart';
import 'package:goo_gg_application/service/firebase/firestore_service.dart';
import 'package:goo_gg_application/util/datetime_util.dart';

class SummonerRepository extends RiotRepository {
  @override
  RiverRepository createRiverRepo() => SummonerRepository();

  Future<SummonerModel?> initSummonerProcess(
    String name
  ) async {
    try {
      final query = await FirestoreService.instance
          .collection(StoreCollection.summoners)
          .where('name', isEqualTo: name)
          .orderBy('updatedAt', descending: true)
          .get();
      if (query.size > 0) {
        /// todo: firstore에 저장된 정보라면 하루차이 확인 후 업데이트 할지 말지 프로세스.
        final model = SummonerModel.fromJson(query.docs.first.data());
        final isUpdate = DateTimeUtil().calculateDayDifference(model.updatedAt);
        if (isUpdate) {
          return await getSummonerByName(name);
        } else {
          await AuthService.instance.setSummonerInfo(model);
          return model;
        }
      } else {
        return await getSummonerByName(name);
      }
    } catch (_) {
      debugPrint('KBG summoner error : $_');
      return null;
    }
  }

  Future<SummonerModel?> getSummonerByName(String name) async {
    try {
      final response = await dio.post(
          '$baseUrl/summonerInfo', data: {'name': name});
      SummonerModel summoner = SummonerModel.fromJson(response.data['data']);
      await AuthService.instance.setSummonerInfo(summoner);
      return summoner;
    } catch (_) {
      debugPrint('KBG getSummonerByName : error : $_');
      return null;
    }
  }
  
  Future<Uint8List?> getImageData(String url) async {
    try {
      final response = await Dio().get<Uint8List>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: dio.options.headers
        )
      );
      return response.data;
    } catch (e) {
      debugPrint('KBG getImageData error : ${e.toString()}');
      return null;
    }
  }
}