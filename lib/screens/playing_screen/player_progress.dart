import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:flutter/material.dart';

import '../../db/functions/play_audio_function/playing_function.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      height: 50,
      width: 300,
      child: Stack(children: [
        assetsAudioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) => ProgressBar(
            timeLabelTextStyle: const TextStyle(color: Colors.grey),
            baseBarColor: Colors.grey,
            progressBarColor: Colors.black,
            thumbColor: Colors.black,
            progress: realtimePlayingInfos.currentPosition,
            timeLabelPadding: 10,
            total: realtimePlayingInfos.duration,
            onSeek: (duration) async {
              assetsAudioPlayer.seek(duration);
            },
          ),
        ),
      ]),
    );
  }
}
