// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dog _$DogFromJson(Map<String, dynamic> json) => Dog(
      breeds: (json['breeds'] as List<dynamic>)
          .map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$DogToJson(Dog instance) => <String, dynamic>{
      'breeds': instance.breeds,
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      weight:
          SystemOfMeasurement.fromJson(json['weight'] as Map<String, dynamic>),
      height:
          SystemOfMeasurement.fromJson(json['height'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      bredFor: json['bred_for'] as String?,
      breedGroup: json['breed_group'] as String?,
      lifeSpan: json['life_span'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'bred_for': instance.bredFor,
      'breed_group': instance.breedGroup,
      'life_span': instance.lifeSpan,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'reference_image_id': instance.referenceImageId,
    };

SystemOfMeasurement _$SystemOfMeasurementFromJson(Map<String, dynamic> json) =>
    SystemOfMeasurement(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$SystemOfMeasurementToJson(
        SystemOfMeasurement instance) =>
    <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
