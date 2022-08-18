import 'dart:io';

import 'package:dio/dio.dart';

import '../../../common/di/injector.dart';
import '../../../common/networking/rest_client.dart';

class BaseApiService {
  Dio dio = sl.get<RestClient>(instanceName: 'base').dio;

  handlerError(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return 'Timeout';
        default:
          return error.error is SocketException
              ? 'Please check the network connection'
              : 'An error occurred, please try again';
      }
    } else {
      return 'An error occurred, please try again';
    }
  }
}
