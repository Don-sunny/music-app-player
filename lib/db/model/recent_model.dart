import 'package:hive/hive.dart';
part 'recent_model.g.dart';

@HiveType(typeId: 2)
class RecentlyPlayed extends HiveObject {
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

  RecentlyPlayed({
    this.title,
    this.artist,
    this.duration,
    this.uri,
    required this.id,
  });

  static fromMap(RecentlyPlayed song) {}
}
