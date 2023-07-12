import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_2023/core/app_error.dart';
import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_clean_architecture_2023/datasource/remote_data_source.dart';
import 'package:flutter_clean_architecture_2023/src/data/model/image_response.dart';
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
  Future<Result<List<DogImage>>> getDogImages() => _handleResult(
        _remoteDataSource.getDogImages(
            null, null, null, null, null, null, null),
        (data) => data.map((e) => e.toEntity()).toList(),
      );

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
}
