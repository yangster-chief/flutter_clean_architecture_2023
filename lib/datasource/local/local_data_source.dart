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
    final dogImages = box.values.toList()..shuffle();
    return Future.value(dogImages.take(10).toList());
  }

  Future<void> saveDogsImage(DogImageModel dogImageModel) {
    final box = _hive.dogImage;

    box.put(dogImageModel.id, dogImageModel);
    return Future.value();
  }

  Future<void> saveDogImages(List<DogImageModel> dogImages) {
    final box = _hive.dogImage;
    box.addAll(dogImages);
    return Future.value();
  }

  Future<void> deleteDogImage(String id) {
    final box = _hive.dogImage;
    box.delete(id);
    return Future.value();
  }

  Future<void> clearDogImages() {
    final box = _hive.dogImage;
    box.clear();
    return Future.value();
  }

  @disposeMethod
  void dispose() async {
    _hive.close();
  }
}
