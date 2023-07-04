// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_app_player/db/model/playlist/each_play_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../model/playlist/play_list_model.dart';

ValueNotifier<List<EachPlaylist>> playListNotifier = ValueNotifier([]);

Future<void> addPlayList(String name) async {
  playListNotifier.value.add(EachPlaylist(name: name));
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  playlistdb.add(PlaylistClass(playlistName: name));
  playlistdb.close();
  // ignore: invalid_use_of_protected_member
  playListNotifier.notifyListeners();
}

Future<void> playlistDelete(int index) async {
  String playlistName = playListNotifier.value[index].name;
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  for (var element in playlistdb.values) {
    if (element.playlistName == playlistName) {
      var key = element.key;
      playlistdb.delete(key);
      break;
    }
  }
  playListNotifier.value.removeAt(index);
  // ignore: invalid_use_of_protected_member
  playListNotifier.notifyListeners();
}

Future<void> playlistAddDB(SongModel addingSong, String playlistName) async {
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  for (var element in playlistdb.values) {
    if (element.playlistName == playlistName) {
      var key = element.key;
      PlaylistClass updatePlaylist = PlaylistClass(playlistName: playlistName);
      updatePlaylist.listSongs.addAll(element.listSongs);
      updatePlaylist.listSongs.add(addingSong.id);
      playlistdb.put(key, updatePlaylist);
      break;
    }
  }
  // ignore: invalid_use_of_protected_member
  playListNotifier.notifyListeners();
}

Future<void> playlistRemoveDB(
    SongModel removingSong, String playlistName) async {
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  for (var element in playlistdb.values) {
    if (element.playlistName == playlistName) {
      var key = element.key;
      PlaylistClass updatePlaylist = PlaylistClass(playlistName: playlistName);
      for (var item in element.listSongs) {
        if (item == removingSong.id) {
          continue;
        }
        updatePlaylist.listSongs.add(item);
      }
      playlistdb.put(key, updatePlaylist);
      break;
    }
  }
  // ignore: invalid_use_of_protected_member
  playListNotifier.notifyListeners();
}

Future<void> playlistRename(int index, String newName) async {
  String playlistName = playListNotifier.value[index].name;
  Box<PlaylistClass> playlistdb = await Hive.openBox<PlaylistClass>('PlayList');
  for (var element in playlistdb.values) {
    if (element.playlistName == playlistName) {
      var key = element.key;
      element.playlistName = newName;
      playlistdb.put(key, element);
      break;
    }
  }
  playListNotifier.value[index].name = newName;
  // ignore: invalid_use_of_protected_member
  playListNotifier.notifyListeners();
}
