import 'package:hive_flutter/adapters.dart';
part 'play_list_model.g.dart';

@HiveType(typeId: 3)
class PlaylistClass extends HiveObject {
  @HiveField(0)
  String playlistName;

  @HiveField(1)
  List<int> listSongs = [];

  PlaylistClass({required this.playlistName});
}
