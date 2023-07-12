import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/core/app_error.dart';
import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggy/loggy.dart';

///
/// flutter_clean_architecture_2023
/// File Name: unit_test
/// Created by sujangmac on 2023/07/10
///
/// Description:
///

void main() {
  setUp(() {
    Loggy.initLoggy();
  });

  test('test', () {
    Result<String> result = const Success('success');
    expect(result.isSuccess, true);
    expect(result.data, 'success');
    Result<String> result2 = Failure(AppError(error: 'error'));
    expect(result2.isSuccess, false);
  });

  test('_handleResult handles success correctly', () async {
    // Create a successful request to pass to _handleResult.
    final successfulRequest = Future.value('Success!');

    // Call _handleResult with the successful request.
    final result = await _handleResult(successfulRequest, (data) => data);

    // Check that the result is a success and has the correct data.
    expect(result, isInstanceOf<Success<String>>());
    final successResult = result as Success<String>;
    expect(successResult.data, equals('Success!'));
  });

  test('_handleResult handles failure correctly', () async {
    // Create a failing request to pass to _handleResult.
    final failingRequest = Future<dynamic>.error(
        DioException(requestOptions: RequestOptions(path: '')));

    // Call _handleResult with the failing request.
    final result = await _handleResult(failingRequest, (data) => data);
    // Check that the result is a failure and has the correct error.
    expect(result, isInstanceOf<Failure<dynamic>>());
    final failureResult = result as Failure;
    expect(failureResult.error, isInstanceOf<AppError>());
  });
}

Future<Result<T>> _handleResult<T, R>(
    Future<R> request, T Function(R data) mapper) async {
  try {
    final response = await request;
    return Success(mapper(response));
  } catch (e) {
    if (e is DioException) {
      return Failure(AppError(
        type: AppErrorType.network,
        error: e,
      ));
    } else {
      return Failure(AppError(error: e));
    }
  }
}
