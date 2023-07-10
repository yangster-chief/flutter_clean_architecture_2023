// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      breeds: (json['breeds'] as List<dynamic>)
          .map((e) => BreedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'breeds': instance.breeds,
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

BreedResponse _$BreedResponseFromJson(Map<String, dynamic> json) =>
    BreedResponse(
      weight: SystemOfMeasurementResponse.fromJson(
          json['weight'] as Map<String, dynamic>),
      height: SystemOfMeasurementResponse.fromJson(
          json['height'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      bredFor: json['bred_for'] as String?,
      breedGroup: json['breed_group'] as String?,
      lifeSpan: json['life_span'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$BreedResponseToJson(BreedResponse instance) =>
    <String, dynamic>{
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

SystemOfMeasurementResponse _$SystemOfMeasurementResponseFromJson(
        Map<String, dynamic> json) =>
    SystemOfMeasurementResponse(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$SystemOfMeasurementResponseToJson(
        SystemOfMeasurementResponse instance) =>
    <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
