import 'package:flutter_clean_architecture_2023/core.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';

///
/// flutter_clean_architecture_2023
/// File Name: local_data_repository
/// Created by sujangmac on 2023/07/12
///
/// Description:
///
abstract class LocalDataRepository {
  Future<Result<List<DogImage>>> getDogImages();
  Future<Result<void>> saveDogImage(DogImage dogImage);
  Future<Result<void>> saveDogImages(List<DogImage> dogImages);
  Future<Result<void>> deleteDogImage(String id);
  Future<Result<void>> clearDogImages();
}
