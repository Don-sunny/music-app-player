import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../db/functions/db_functions/playllist_functions.dart';
import '../../../db/model/all_songs_model.dart';
// import '../../../db/model/favorite_song_model.dart';
import '../../../db/model/playlist/each_play_list.dart';
import '../../../db/model/playlist/play_list_model.dart';

final audioQuery = OnAudioQuery();

List<SongModel> songs = [];

final box = SongBox.getInstance();

List<SongModel> favSongsList = [];

fetchSongs() async {
  bool permissionGranted = await audioQuery.permissionsRequest();

  if (permissionGranted) {
    List<SongModel> fetchSongs = await audioQuery.querySongs();

    songs = fetchSongs;
    for (final song in fetchSongs) {
      box.add(
        AllSongs(
            songname: song.title,
            artist: song.artist,
            duration: song.duration,
            id: song.id,
            songurl: song.uri),
      );
    }
  }
}

void playlistFetch() async {
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  for (PlaylistClass element in playlistdb.values) {
    String playlistName = element.playlistName;
    EachPlaylist playlistFetch = EachPlaylist(name: playlistName);
    for (int id in element.listSongs) {
      for (SongModel song in songs) {
        if (id == song.id) {
          playlistFetch.container.add(song);
          break;
        }
      }
    }
    playListNotifier.value.add(playlistFetch);
  }
}
