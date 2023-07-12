import 'package:flutter_clean_architecture_2023/src/data/local/model/breed_model.dart';
import 'package:flutter_clean_architecture_2023/src/domain/entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog_image_model
/// Created by sujangmac on 2023/07/12
///
/// Description:
///
part 'dog_image_model.g.dart';

@HiveType(typeId: 0)
class DogImageModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final int width;
  @HiveField(3)
  final int height;
  @HiveField(4)
  final List<BreedModel> breeds;

  const DogImageModel({
    this.id = '',
    this.url = '',
    this.width = 0,
    this.height = 0,
    this.breeds = const [],
  });
}

extension DogImageModelExtension on DogImageModel {
  DogImage toEntity() => DogImage(
        id: id,
        url: url,
        width: width,
        height: height,
        breeds: breeds.map((e) => e.toEntity()).toList(),
      );
}

extension DogImageExtension on DogImage {
  DogImageModel toModel() => DogImageModel(
        id: id,
        url: url,
        width: width,
        height: height,
        breeds: breeds.map((e) => e.toModel()).toList(),
      );
}
