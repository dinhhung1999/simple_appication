import 'package:dio/dio.dart';


class AuthInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    /// todo check 401
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

   return handler.next(response);
  }
}
