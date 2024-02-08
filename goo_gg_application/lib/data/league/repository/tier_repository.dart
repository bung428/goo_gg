import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/service/dio_service.dart';

class TierRepository extends RiverRepository {
  final dio = DioService.instance.dio;
  final baseUrl = 'https://us-central1-goo-gg-dev.cloudfunctions.net';

  @override
  RiverRepository createRiverRepo() => TierRepository();

  @override
  void init() {
    dio.options.headers = {
      'Access-Control-Allow-Origin': '*',
    };
  }

  Future<dynamic> functionsTest() async {
    try {
      final response = await dio.post(
        '$baseUrl/summonerInfo',
        data: {'name': '석춧가루'}
      );
      return response.data;
    } catch (_) {
      return null;
    }
  }
}