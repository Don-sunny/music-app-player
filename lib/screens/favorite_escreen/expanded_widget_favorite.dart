import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/fav_function.dart';
import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:music_app_player/db/model/favorite_song_model.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../../mini_player/mini_player.dart';

class FavoriteExpandedWidget extends StatelessWidget {
  const FavoriteExpandedWidget({super.key});

  @override
  Widget build(BuildContext ctx) {
    getFavValues();
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: favsongsNotifier,
        builder: (BuildContext context, List<Favsongs> favSongs, Widget? _) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [BoxShadow(blurRadius: 5)],
            ),
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: favSongs.isNotEmpty
                    ? ListView.separated(
                        itemCount: favSongDb.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var songsList = favSongs.toList();

                          // // for (int i = 0; i < favSongs.length; i++) {
                          // //   for (int j = 0; j < songs.length; j++) {
                          // //     if (val[i].id == songs[index].id) {}
                          // //   }
                          // // }
                          // bool isContains = val
                          //     .where((element) => element.id == songs[index].id)
                          //     .isNotEmpty;
                          return InkWell(
                              onTap: () {
                                playAudio(songsList, index);
                                showBottomSheet(
                                  context: context,
                                  builder: (context) => miniLast(
                                      songsList: songsList, index: index),
                                );
                              },
                              child: Card(
                                color: Colors.grey[300],
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipOval(
                                      child: QueryArtworkWidget(
                                        id: favSongs[index].id!,
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
                                  title: Text(
                                    songsList[index].title!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  subtitle: Text(
                                    songsList[index].artist!,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      removeFunction(songsList[index].id!);
                                    },
                                    icon: Icon(
                                      favsongsNotifier.value.isNotEmpty
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ));
                        },
                      )
                    : const Center(
                        child: Text(
                          'Favorite is empty',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),
          );
        },
      ),
    );
  }
}
