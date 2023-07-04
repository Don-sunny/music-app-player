import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:music_app_player/screens/playing_screen/playing_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: camel_case_types, must_be_immutable
class miniLast extends StatefulWidget {
  miniLast({super.key, required this.songsList, required this.index});

  int index;

  var songsList;

  @override
  State<miniLast> createState() => _miniLastState();
}

// ignore: camel_case_types
class _miniLastState extends State<miniLast> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          // playAudio(widget.songs, widget.index);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayingScreen(index: widget.index),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 3,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.18,
            // height: 67,
            width: MediaQuery.of(context).size.width * 1,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: Colors.accents,
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight),
              ),
              child: assetsAudioPlayer.builderCurrent(
                builder: (context, playing) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * .15,
                          width: MediaQuery.of(context).size.width * .15,
                          child: ClipOval(
                            child: QueryArtworkWidget(
                              id: int.parse(playing.audio.audio.metas.id!),
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: Image.asset(
                                'assets/images/cover_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                assetsAudioPlayer.getCurrentAudioTitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                assetsAudioPlayer.getCurrentAudioArtist,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () {
                          assetsAudioPlayer.previous();
                        },
                      ),
                      InkWell(
                        onTap: () {
                          assetsAudioPlayer.playOrPause();
                        },
                        child: PlayerBuilder.isPlaying(
                          player: assetsAudioPlayer,
                          builder: (context, isPlaying) {
                            if (isPlaying) {
                              return const Icon(Icons.pause);
                            } else {
                              return Icon(Icons.play_arrow);
                            }
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: () {
                          assetsAudioPlayer.next();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
