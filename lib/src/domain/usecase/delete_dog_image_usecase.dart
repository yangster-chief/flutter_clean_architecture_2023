import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: delete_dog_image_usecase
/// Created by sujangmac on 2023/07/29
///
/// Description:
///
@injectable
class DeleteDogImageUseCase implements UseCase<void, String> {
  final LocalDataRepository _local;

  const DeleteDogImageUseCase(this._local);

  @override
  Future<void> call({
    required String params,
    required Future<void> Function(void data) onSuccess,
    required Future<void> Function(AppError error) onFailure,
  }) =>
      _local.deleteDogImage(params).when(
            success: onSuccess,
            failure: onFailure,
          );
}
