// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogImageModelAdapter extends TypeAdapter<DogImageModel> {
  @override
  final int typeId = 0;

  @override
  DogImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogImageModel(
      id: fields[0] as String,
      url: fields[1] as String,
      width: fields[2] as int,
      height: fields[3] as int,
      breeds: (fields[4] as List).cast<BreedModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DogImageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.breeds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
