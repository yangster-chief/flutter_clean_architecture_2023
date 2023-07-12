import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/datasource/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture_2023/middleware/remote_interceptor.dart';
import 'package:flutter_clean_architecture_2023/module/hive/hive_service.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

///
/// flutter_clean_architecture_2023
/// File Name: app_module
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
@module
abstract class AppModule {
  @preResolve
  Future<HiveService> get hiveService => HiveService.init();

  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      LoggyDioInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        requestLevel: LogLevel.all,
        responseLevel: LogLevel.all,
        errorLevel: LogLevel.all,
      ),
      RemoteInterceptor(),
    ]);
  @lazySingleton
  RemoteDataSource get remoteDataSource => RemoteDataSource(dio);
}
