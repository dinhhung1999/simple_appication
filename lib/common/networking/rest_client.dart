import 'dart:io';

import 'package:dio/dio.dart';

class RestClient {
  late Dio _dio;

  String get baseUrl => _dio.options.baseUrl;

  BaseOptions get options => _dio.options;

  Interceptors get interceptors => _dio.interceptors;

  Dio get dio => _dio;

  RestClient(String baseUrl,
      {required List<Interceptor> interceptors,
      HttpClientAdapter? httpClientAdapter,
      Duration timeout = const Duration(seconds: 30)}) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      connectTimeout: timeout.inMilliseconds,
      receiveTimeout: timeout.inMilliseconds,
    );

    _dio = Dio(options);

    if (httpClientAdapter != null) {
      _dio.httpClientAdapter = httpClientAdapter;
    }

    _dio.interceptors.addAll(interceptors);
  }
}
