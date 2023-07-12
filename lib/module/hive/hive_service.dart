import 'package:flutter_clean_architecture_2023/src/data/local/model/breed_model.dart';
import 'package:flutter_clean_architecture_2023/src/data/local/model/dog_image_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// flutter_clean_architecture_2023
/// File Name: hive_service
/// Created by sujangmac on 2023/07/12
///
/// Description:
///
class HiveService {
  static const String _dogImageBox = 'dog_image';
  static const String _breedBox = 'breed';
  static Future<HiveService> init() async {
    await Hive.initFlutter();
    //register adapter here
    Hive
      ..registerAdapter(DogImageModelAdapter()) // typeId = 0
      ..registerAdapter(BreedModelAdapter()); // typeId = 1
    //
    Hive
      ..openBox<DogImageModel>(_dogImageBox)
      ..openBox<BreedModel>(_breedBox);
    return HiveService();
  }

  Box<DogImageModel> get dogImage => Hive.box<DogImageModel>(_dogImageBox);
  Box<BreedModel> get breed => Hive.box<BreedModel>(_breedBox);

  void close() {
    Hive.close();
  }
}
