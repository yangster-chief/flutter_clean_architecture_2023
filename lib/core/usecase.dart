import 'package:flutter_clean_architecture_2023/core/app_error.dart';

///
/// flutter_clean_architecture_2023
/// File Name: usecase
/// Created by sujangmac on 2023/07/14
///
/// Description:
///
abstract class UseCase<T, P> {
  Future<void> call({
    required P params,
    required Future<void> Function(T data) onSuccess,
    required Future<void> Function(AppError error) onFailure,
  });
}
