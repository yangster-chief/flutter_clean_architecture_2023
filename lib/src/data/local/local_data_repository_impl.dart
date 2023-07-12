import 'package:flutter_clean_architecture_2023/core/app_error.dart';
import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_clean_architecture_2023/datasource/local/local_data_source.dart';
import 'package:flutter_clean_architecture_2023/src/data/models.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: local_data_repository_impl
/// Created by sujangmac on 2023/07/12
///
/// Description:
///
@LazySingleton(as: LocalDataRepository)
class LocalDataRepositoryImpl implements LocalDataRepository {
  const LocalDataRepositoryImpl(this._localDataSource);

  final LocalDataSource _localDataSource;

  @override
  Future<Result<List<DogImage>>> getDogImages() => _handleResult(
        _localDataSource.getDogImages(),
        (data) => data.map((e) => e.toEntity()).toList(),
      );

  @override
  Future<void> saveDogImages(List<DogImage> dogImages) => _handleResult(
        _localDataSource.saveDogImages(
          dogImages.map((e) => e.toModel()).toList(),
        ),
        (data) => data,
      );

  Future<Result<T>> _handleResult<T, R>(
      Future<R> request, T Function(R data) mapper) async {
    try {
      final response = await request;
      return Success(mapper(response));
    } catch (e) {
      if (e is HiveError) {
        return Failure(AppError(
          type: AppErrorType.local,
          error: e,
        ));
      } else {
        return Failure(AppError(error: e));
      }
    }
  }
}
