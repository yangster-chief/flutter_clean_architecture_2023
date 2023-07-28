import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/constants.dart';
import 'package:flutter_clean_architecture_2023/datasource/remote/remote_data_source.dart';
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
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              options.headers['x-api-key'] = Constants.apiKey;
              return handler.next(options);
            },
          ),
        );
      remoteDataSource = RemoteDataSource(dio);
    },
  );

  test('get Dog', () async {
    final res = await remoteDataSource.getDogImages(null);
    logDebug('res: ${res.first.breeds.first.name}');
    // expect(res.data!.message, 'https://images.dog.ceo/breeds/terrier-norwich/n02094258_100.jpg');
  });
}
// void main() {
//   test('getDogImages returns a list of dog images', () async {
//     // Mock the remote data source to return a predetermined response.
//     final mockRemoteDataSource = MockRemoteDataSource();
//     when(mockRemoteDataSource.getDogImages(any, any, any, any, any, any, any))
//         .thenAnswer((_) async => [DogImage(url: 'https://example.com/dog.jpg')]);
//
//     // Create the object to test.
//     final myObject = MyObject(mockRemoteDataSource);
//
//     // Call the function to test.
//     final result = await myObject.getDogImages();
//
//     // Check that the result is as expected.
//     expect(result, isInstanceOf<Success<List<DogImage>>>());
//     final successResult = result as Success<List<DogImage>>;
//     expect(successResult.data, hasLength(1));
//     expect(successResult.data[0].url, equals('https://example.com/dog.jpg'));
//   });
// }
