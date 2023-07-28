import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/local_data_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: clear_dog_images_usecase
/// Created by sujangmac on 2023/07/29
///
/// Description:
///
@injectable
class ClearDogImagesUseCase implements UseCase<void, void> {
  const ClearDogImagesUseCase(this._local);

  final LocalDataRepository _local;

  @override
  Future<void> call({
    required void params,
    required Future<void> Function(void data) onSuccess,
    required Future<void> Function(AppError error) onFailure,
  }) =>
      _local.clearDogImages().when(
            success: onSuccess,
            failure: onFailure,
          );
}
