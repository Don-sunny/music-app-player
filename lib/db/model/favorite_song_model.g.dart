// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_song_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavsongsAdapter extends TypeAdapter<Favsongs> {
  @override
  final int typeId = 1;

  @override
  Favsongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favsongs(
      title: fields[0] as String?,
      artist: fields[1] as String?,
      duration: fields[2] as int?,
      uri: fields[3] as String?,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Favsongs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.uri)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavsongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
