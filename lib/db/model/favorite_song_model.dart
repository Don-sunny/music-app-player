import 'package:hive_flutter/adapters.dart';
part 'favorite_song_model.g.dart';

@HiveType(typeId: 1)
class Favsongs {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? artist;
  @HiveField(2)
  int? duration;
  @HiveField(3)
  String? uri;
  @HiveField(4)
  int? id;
  Favsongs(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.uri,
      required this.id});
}
