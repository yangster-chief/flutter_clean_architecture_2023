import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/constants.dart';
import 'package:flutter_clean_architecture_2023/datasource/remote_data_source.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggy/loggy.dart';

///
/// flutter_clean_architecture_2023
/// File Name: api_test
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
void main() {
  late Dio dio;
  late RemoteDataSource remoteDataSource;
  setUp(
    () {
      Loggy.initLoggy(
        logPrinter: const PrettyPrinter(showColors: true),
      );
      dio = Dio()
        ..interceptors.add(
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
        );
      remoteDataSource = RemoteDataSource(dio);
    },
  );

  test('get Dog', () async {
    final res = await remoteDataSource.getDogImages(
      Constants.apiKey,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    logDebug('res: ${res.first.breeds.first.name}');
    // expect(res.data!.message, 'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg');
  });
}
