// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedModelAdapter extends TypeAdapter<BreedModel> {
  @override
  final int typeId = 1;

  @override
  BreedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreedModel(
      weight: (fields[0] as Map).cast<String, String>(),
      height: (fields[1] as Map).cast<String, String>(),
      id: fields[2] as int,
      name: fields[3] as String,
      bredFor: fields[4] as String,
      breedGroup: fields[5] as String,
      lifeSpan: fields[6] as String,
      temperament: fields[7] as String,
      origin: fields[8] as String,
      referenceImageId: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BreedModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.bredFor)
      ..writeByte(5)
      ..write(obj.breedGroup)
      ..writeByte(6)
      ..write(obj.lifeSpan)
      ..writeByte(7)
      ..write(obj.temperament)
      ..writeByte(8)
      ..write(obj.origin)
      ..writeByte(9)
      ..write(obj.referenceImageId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
