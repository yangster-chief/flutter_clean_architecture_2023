import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/dto.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart';
import 'package:flutter_clean_architecture_2023/src/domain/remote_data_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: get_dog_images_usecase
/// Created by sujangmac on 2023/07/14
///
/// Description:
///
@injectable
class GetDogImagesUseCase implements UseCase<List<DogImage>, GetDogDto> {
  final RemoteDataRepository _remote;
  final LocalDataRepository _local;

  const GetDogImagesUseCase(this._remote, this._local);

  @override
  Future<void> call({
    required GetDogDto params,
    required Future<void> Function(List<DogImage> data) onSuccess,
    required Future<void> Function(AppError error) onFailure,
  }) =>
      params.isRemote
          ? _remote
              .getDogImages(10)
              .when(success: (data) => onSuccess(data), failure: onFailure)
          : _local
              .getDogImages()
              .when(success: (data) => onSuccess(data), failure: onFailure);
}
