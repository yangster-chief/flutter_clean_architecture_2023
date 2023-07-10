import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/core/app_error.dart';
import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_clean_architecture_2023/datasource/remote_data_source.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity/dog_image.dart';
import 'package:flutter_clean_architecture_2023/src/domain/remote_data_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: remote_data_repository_impl
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
@Singleton(as: RemoteDataRepository)
class RemoteDataRepositoryImpl implements RemoteDataRepository {
  const RemoteDataRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<DogImage>>> getDogImages() =>
      _handleResult(() => _remoteDataSource.getDogImages(null, null, null, null, null, null, null), (p0) => null, () => {
        return Failure(AppError(AppErrorType.network, p0.toString()));
      });

  Future<Result<R>> _handleResult<T, R>(
    Future<T> Function() apiCall,
    R Function(T) mapper,
  ) =>
      apiCall().then((value) => Success(mapper(value))).catchError((dynamic error) {
        if (error is DioException) {
          return Failure(AppError(type: AppErrorType.network, error: error));
        } else {
          return Failure(AppError(type: AppErrorType.unknown, error: error));
        }
      });
}
