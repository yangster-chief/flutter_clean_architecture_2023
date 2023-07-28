import 'package:flutter_clean_architecture_2023/core.dart';

///
/// flutter_clean_architecture_2023
/// File Name: result
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
sealed class Result<T> {
  final T? data;
  final AppError? error;

  const Result._({this.data, this.error});

  bool get isSuccess => this is Success<T> && data != null;

  @override
  String toString() {
    String msg = 'Result is ';
    if (this is Success) {
      msg += 'Success [${data.runtimeType} : ${data.toString()}]';
    }
    if (this is Failure) {
      msg += error.toString();
    }

    return msg;
  }
}

class Success<T> extends Result<T> {
  const Success(T data) : super._(data: data);
}

class Failure<T> extends Result<T> {
  const Failure(AppError? error) : super._(data: null, error: error);
}

extension FutureResultWhen<T> on Future<Result<T>> {
  Future<void> when({
    required Future<void> Function(T data) success,
    required Future<void> Function(AppError error) failure,
  }) async {
    final result = await this;
    if (result is Success) {
      return success(result.data as T);
    } else {
      return failure(result.error!);
    }
  }
}
