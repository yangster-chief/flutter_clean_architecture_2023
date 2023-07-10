import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/constants.dart';

///
/// flutter_clean_architecture_2023
/// File Name: remote_interceptor
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
class RemoteInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) =>
      handler.next(err);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = Constants.apiKey;
    return handler.next(options);
  }

  @override
  void onResponse(
          Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
