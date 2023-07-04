import 'package:hive/hive.dart';
part 'all_songs_model.g.dart';

@HiveType(typeId: 0)
class AllSongs {
  @HiveField(0)
  String? songname;
  @HiveField(1)
  String? artist;
  @HiveField(2)
  int? duration;
  @HiveField(3)
  String? songurl;
  @HiveField(4)
  int? id;

  AllSongs(
      {required this.songname,
      required this.artist,
      required this.duration,
      required this.id,
      required this.songurl});
}

String boxname = 'all_songs';

class SongBox {
  static Box<AllSongs>? _box;
  static Box<AllSongs> getInstance() {
    return _box ??= Hive.box(boxname);
  }
}

final List allvalues = SongBox.getInstance().values.toList();
