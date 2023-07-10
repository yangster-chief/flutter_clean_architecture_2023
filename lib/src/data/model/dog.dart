import 'package:json_annotation/json_annotation.dart';

///
/// flutter_clean_architecture_2023
/// File Name: dog
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
part 'dog.g.dart';

@JsonSerializable()
class Dog {
  final List<Breed> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  const Dog({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
}

@JsonSerializable()
class Breed {
  final SystemOfMeasurement weight;
  final SystemOfMeasurement height;
  final int id;
  final String name;
  @JsonKey(name: 'bred_for')
  final String? bredFor;
  @JsonKey(name: 'breed_group')
  final String? breedGroup;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  const Breed({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
}

@JsonSerializable()
class SystemOfMeasurement {
  final String imperial;
  final String metric;

  const SystemOfMeasurement({
    required this.imperial,
    required this.metric,
  });

  factory SystemOfMeasurement.fromJson(Map<String, dynamic> json) =>
      _$SystemOfMeasurementFromJson(json);
}
