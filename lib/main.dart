import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:music_app_player/db/model/all_songs_model.dart';
import 'package:music_app_player/db/model/favorite_song_model.dart';
import 'package:music_app_player/db/model/mostly_played.dart';
import 'package:music_app_player/db/model/playlist/play_list_model.dart';
import 'package:music_app_player/db/model/recent_model.dart';
import 'package:music_app_player/screens/splash_screen/splashscreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter(directory.path);
  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<AllSongs>('all_songs');
  Hive.registerAdapter(FavsongsAdapter());
  await Hive.openBox<Favsongs>('fav_songs');
  Hive.registerAdapter(RecentlyPlayedAdapter());
  Hive.registerAdapter(PlaylistClassAdapter());
  Hive.registerAdapter(MostlyPlayedAdapter());
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: const MaterialColor(
        0xFF000000,
        <int, Color>{
          50: Color(0xFFE0E0E0),
          100: Color(0xFFB3B3B3),
          200: Color(0xFF808080),
          300: Color(0xFF4D4D4D),
          400: Color(0xFF262626),
          500: Color(0xFF000000),
          600: Color(0xFF000000),
          700: Color(0xFF000000),
          800: Color(0xFF000000),
          900: Color(0xFF000000),
        },
      )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
