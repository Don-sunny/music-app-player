import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_app_player/db/model/favorite_song_model.dart';

ValueNotifier<List<Favsongs>> favsongsNotifier = ValueNotifier([]);
final favSongDb = Hive.box<Favsongs>('fav_songs');
addToFunction(int id, Favsongs value) {
  final favdb = Hive.box<Favsongs>('fav_songs');
  favdb.put(id, value);
  favsongsNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favsongsNotifier.notifyListeners();
}

removeFunction(int id) {
  final favdb = Hive.box<Favsongs>('fav_songs');
  favdb.delete(id);
  getFavValues();
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favsongsNotifier.notifyListeners();
}

getFavValues() {
  final favdb = Hive.box<Favsongs>('fav_songs');
  favsongsNotifier.value.clear();
  favsongsNotifier.value.addAll(favdb.values);
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  favsongsNotifier.notifyListeners();
}
