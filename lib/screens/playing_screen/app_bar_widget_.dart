import 'package:flutter/material.dart';
import 'package:music_app_player/db/model/favorite_song_model.dart';

import '../../db/functions/db_functions/fav_function.dart';
import '../splash_screen/functions/fetch_song_details.dart';

// ignore: must_be_immutable
class AppBarWidgetPlayingScreen extends StatefulWidget {
  AppBarWidgetPlayingScreen({super.key, required this.index});
  int index;

  @override
  State<AppBarWidgetPlayingScreen> createState() =>
      _AppBarWidgetPlayingScreenState();
}

class _AppBarWidgetPlayingScreenState extends State<AppBarWidgetPlayingScreen> {
  @override
  Widget build(BuildContext ctx) {
    bool isContains = favSongDb.values
        .where((element) => element.id == songs[widget.index].id)
        .isNotEmpty;
    return ValueListenableBuilder(
      valueListenable: favsongsNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.grey[300]),
                  width: 50,
                  height: 50,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      icon: const Icon(Icons.arrow_back_ios))),
              const SizedBox(
                width: 100,
              ),
              const Text(
                'Playing',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              ),
              const SizedBox(
                width: 90,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isContains) {
                      removeFunction(songs[widget.index].id);
                    } else {
                      addToFunction(
                          songs[widget.index].id,
                          Favsongs(
                              title: songs[widget.index].title,
                              artist: songs[widget.index].artist,
                              duration: songs[widget.index].duration,
                              uri: songs[widget.index].uri,
                              id: songs[widget.index].id));
                    }
                  });
                },
                icon: Icon(isContains ? Icons.favorite : Icons.favorite_border),
              ),
            ],
          ),
        );
      },
    );
  }
}
