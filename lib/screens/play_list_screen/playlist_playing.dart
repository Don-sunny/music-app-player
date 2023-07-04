import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/playllist_functions.dart';
import 'package:music_app_player/screens/playing_screen/app_bar_widget_.dart';
import 'package:music_app_player/screens/playing_screen/buttons_playing.dart';
import 'package:music_app_player/screens/playing_screen/player_progress.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../../db/functions/play_audio_function/playing_function.dart';

AssetsAudioPlayer player = AssetsAudioPlayer();

// ignore: must_be_immutable
class PlaylistPlaying extends StatefulWidget {
  PlaylistPlaying({super.key, required this.index});

  int index;

  @override
  State<PlaylistPlaying> createState() => _PlaylistPlayingState();
}

class _PlaylistPlayingState extends State<PlaylistPlaying> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: playListNotifier,
          builder: (context, value, child) {
            return assetsAudioPlayer.builderCurrent(
              builder: (context, playing) {
                return Column(
                  children: [
                    AppBarWidgetPlayingScreen(index: widget.index),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: QueryArtworkWidget(
                          id: int.parse(playing.audio.audio.metas.id!),
                          type: ArtworkType.AUDIO,
                          artworkFit: BoxFit.cover,
                          artworkBorder: const BorderRadius.all(Radius.zero),
                          nullArtworkWidget: Image.asset(
                            'assets/images/cover_image.png',
                            fit: BoxFit.cover,
                            // Add the package name if necessary
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .75,
                                  child: Text(
                                    assetsAudioPlayer.getCurrentAudioTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Text(
                                  assetsAudioPlayer.getCurrentAudioArtist,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Progress(),
                    const SizedBox(
                      height: 20,
                    ),
                    PlayingButtons(index: widget.index)
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
