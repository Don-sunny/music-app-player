import 'package:hive_flutter/adapters.dart';
part 'mostly_played.g.dart';

@HiveType(typeId: 4)
class MostlyPlayed {
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
  @HiveField(5)
  int? count;

  MostlyPlayed({
    required this.title,
    required this.artist,
    required this.duration,
    required this.id,
    required this.uri,
  });
}
