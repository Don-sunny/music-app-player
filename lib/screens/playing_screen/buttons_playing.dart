import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app_player/screens/play_list_screen/play_list_screen.dart';

import '../../db/functions/play_audio_function/playing_function.dart';

// ignore: must_be_immutable
class PlayingButtons extends StatefulWidget {
  PlayingButtons({super.key, required this.index});

  int index;

  @override
  State<PlayingButtons> createState() => _RowButtonState();
}

bool click = false;

class _RowButtonState extends State<PlayingButtons> {
  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      height: 50,
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayerBuilder.isPlaying(
            player: assetsAudioPlayer,
            builder: (context, isPlaying) {
              return IconButton(
                  onPressed: () {
                    setState(() {
                      assetsAudioPlayer.shuffle;
                      if (click == false) {
                        click = true;
                      } else {
                        click = false;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.shuffle,
                    color: click ? Colors.black : Colors.grey,
                    size: 35,
                  ));
            },
          ),
          PlayerBuilder.isPlaying(
            player: assetsAudioPlayer,
            builder: (context, isPlaying) {
              return IconButton(
                onPressed: () => assetsAudioPlayer.previous(),
                icon: const Icon(Icons.skip_previous),
                iconSize: 35,
                color: Colors.grey,
              );
            },
          ),
          PlayerBuilder.isPlaying(
            player: assetsAudioPlayer,
            builder: (context, isPlaying) {
              return IconButton(
                onPressed: () => assetsAudioPlayer.playOrPause(),
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 40,
                color: Colors.black,
              );
            },
          ),
          PlayerBuilder.isPlaying(
            player: assetsAudioPlayer,
            builder: (context, isPlaying) {
              return IconButton(
                onPressed: () => assetsAudioPlayer.next(),
                icon: const Icon(Icons.skip_next),
                iconSize: 35,
                color: Colors.grey,
              );
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyList(idx: widget.index),
                    ));
              },
              icon: const Icon(
                Icons.playlist_add,
                color: Colors.grey,
                size: 35,
              )),
        ],
      ),
    );
  }
}
