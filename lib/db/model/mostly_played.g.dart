// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mostly_played.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostlyPlayedAdapter extends TypeAdapter<MostlyPlayed> {
  @override
  final int typeId = 4;

  @override
  MostlyPlayed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostlyPlayed(
      title: fields[0] as String?,
      artist: fields[1] as String?,
      duration: fields[2] as int?,
      id: fields[4] as int?,
      uri: fields[3] as String?,
    )..count = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, MostlyPlayed obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.uri)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostlyPlayedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
