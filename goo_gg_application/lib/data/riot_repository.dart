import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:goo_gg_application/service/dio_service.dart';

abstract class RiotRepository extends RiverRepository {
  final dio = DioService.instance.dio;
  final baseUrl = 'https://us-central1-goo-gg-dev.cloudfunctions.net';

  @override
  void init() {
    dio.options.headers = {
      'Access-Control-Allow-Origin': '*',
    };
  }
}