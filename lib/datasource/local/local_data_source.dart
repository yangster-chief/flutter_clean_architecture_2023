import 'package:flutter_clean_architecture_2023/module/hive/hive_service.dart';
import 'package:flutter_clean_architecture_2023/src/data/models.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: local_data_source
/// Created by sujangmac on 2023/07/12
///
/// Description:
///
@singleton
class LocalDataSource {
  const LocalDataSource(this._hive);
  //TODO: add test code
  final HiveService _hive;

  Future<List<DogImageModel>> getDogImages() {
    final box = _hive.dogImage;
    final dogImages = box.values.toList();
    return Future.value(dogImages);
  }

  Future<void> saveDogImages(List<DogImageModel> dogImages) {
    final box = _hive.dogImage;
    box.addAll(dogImages);
    return Future.value();
  }

  @disposeMethod
  void dispose() async {
    _hive.close();
  }
}
