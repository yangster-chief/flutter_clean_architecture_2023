import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: save_dog_image_usecase
/// Created by sujangmac on 2023/07/14
///
/// Description:
///
@injectable
class SaveDogImageUseCase implements UseCase<void, DogImage> {
  final LocalDataRepository _local;

  const SaveDogImageUseCase(this._local);

  @override
  Future<void> call({
    required DogImage params,
    required Future<void> Function(void data) onSuccess,
    required Future<void> Function(AppError error) onFailure,
  }) =>
      _local.saveDogImage(params).when(
            success: onSuccess,
            failure: onFailure,
          );
}
