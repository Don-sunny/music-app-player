import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/mostly_function.dart.dart';
import 'package:music_app_player/db/functions/db_functions/recent_function.dart';

import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:music_app_player/db/model/mostly_played.dart';
import 'package:music_app_player/db/model/recent_model.dart';
// import 'package:music_app_player/db/model/recent_model.dart';
import 'package:music_app_player/mini_player/mini_player.dart';

import 'package:music_app_player/screens/splash_screen/functions/fetch_song_details.dart';
import 'package:music_app_player/widgets/popup_menu_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongsList extends StatefulWidget {
  const AllSongsList({super.key});

  @override
  State<AllSongsList> createState() => _AllSongsListState();
}

class _AllSongsListState extends State<AllSongsList> {
  @override
  Widget build(BuildContext ctx) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: ListView.separated(
            itemBuilder: (BuildContext ctx, int index) {
              return InkWell(
                onTap: () {
                  playAudio(songs, index);
                  showBottomSheet(
                    context: context,
                    builder: (context) =>
                        miniLast(songsList: songs, index: index),
                  );
                  addMostlyPlayedSong(MostlyPlayed(
                    title: songs[index].title,
                    artist: songs[index].artist,
                    duration: songs[index].duration,
                    id: songs[index].id,
                    uri: songs[index].uri,
                  ));
                  updatedRecentlyPlayed(RecentlyPlayed(
                    id: songs[index].id,
                    artist: songs[index].artist,
                    title: songs[index].title,
                    duration: songs[index].duration,
                    uri: songs[index].uri,
                  ));
                  print('recents');
                },
                child: Card(
                  color: Colors.grey[200],
                  child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: QueryArtworkWidget(
                            id: songs[index].id,
                            type: ArtworkType.AUDIO,
                            artworkFit: BoxFit.cover,
                            nullArtworkWidget: Image.asset(
                              'assets/images/cover_image.png',
                              fit: BoxFit.cover,
                              // Add the package name if necessary
                            ),
                          ),
                        ),
                      ),

                      // ),
                      title: Text(
                        songs[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: Text(
                        songs[index].artist!,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      trailing: PoupMenuButtonWidget(
                        index: index,
                        id: songs[index].id,
                        favSohgs: songs,
                      )),
                ),
              );
            },
            separatorBuilder: (BuildContext ctx, int index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: songs.length),
      ),
    );
  }
}
