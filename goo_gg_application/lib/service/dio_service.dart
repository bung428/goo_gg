import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final dioServiceProvider = Provider((ref) => DioService.instance);

class DioService {
  static final DioService instance = DioService._();

  final dio = Dio(BaseOptions());

  DioService._() {
    dio.interceptors.add(logInterceptorsWrapper);
  }

  void setHeader(Map<String, dynamic> headers) {
    dio.options.headers = headers;
  }

  static InterceptorsWrapper get logInterceptorsWrapper =>
      InterceptorsWrapper(onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
          ) {
        final sb = StringBuffer();
        sb.writeln('DioService REQ ${options.method} ${options.path}');
        sb.writeln('header : ${options.headers}');
        if (options.queryParameters.isNotEmpty) {
          sb.writeln('queryParameters : ${options.queryParameters}');
        }
        if (options.data != null) {
          sb.write('data : ${options.data}');
        }
        if (kDebugMode) {
          print(sb);
        }
        handler.next(options);
      }, onResponse: (Response e, ResponseInterceptorHandler handler) {
        if (kDebugMode) {
          print(
              'DioService RES ${e.requestOptions.method} ${e.requestOptions.path}');
          print('DioService RES data : ${e.data}');
        }
        handler.next(e);
      }, onError: (DioException e, ErrorInterceptorHandler handler) {
        if (kDebugMode) {
          print(
              'DioService ERROR ${e.requestOptions.method} ${e.requestOptions.path} ${e.error} ${e.message}');
        }
        handler.next(e);
      });
}

extension DioExceptionTypeX on DioExceptionType {
  int toDioException() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return 80001;
      case DioExceptionType.sendTimeout:
        return 80002;
      case DioExceptionType.receiveTimeout:
        return 80003;
      case DioExceptionType.badCertificate:
        return 80004;
      case DioExceptionType.badResponse:
        return 80005;
      case DioExceptionType.cancel:
        return 80006;
      case DioExceptionType.connectionError:
        return 80007;
      case DioExceptionType.unknown:
        return 80008;
    }
  }
}