import 'package:flutter_clean_architecture_2023/core/app_error.dart';

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
