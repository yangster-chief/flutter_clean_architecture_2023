import 'package:flutter_clean_architecture_2023/core/result.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';

///
/// flutter_clean_architecture_2023
/// File Name: remote_data_repository
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
abstract class RemoteDataRepository {
  Future<Result<List<DogImage>>> getDogImages();
}
