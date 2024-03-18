// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeStorageAdapter extends TypeAdapter<JokeStorage> {
  @override
  final int typeId = 1;

  @override
  JokeStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeStorage(
      jokeStored: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JokeStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jokeStored);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
