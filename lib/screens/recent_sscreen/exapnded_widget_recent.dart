import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:music_app_player/db/functions/db_functions/recent_function.dart';
import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:music_app_player/db/model/recent_model.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../../mini_player/mini_player.dart';
import '../../widgets/popup_menu_button.dart';
import '../splash_screen/functions/fetch_song_details.dart';

class RecentExpandedWidget extends StatelessWidget {
  const RecentExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: recentlyPlayedDB.listenable(),
        builder: (BuildContext context, Box<RecentlyPlayed> list, Widget? _) {
          List recentSongs = list.values.toList().reversed.toList();
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(blurRadius: 5)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: recentSongs.isNotEmpty
                  ? ListView.separated(
                      itemCount: recentSongs.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (BuildContext context, int index) {
                        bool isContains = songs
                            .where((element) =>
                                element.id == recentSongs[index].id)
                            .isNotEmpty;
                        return isContains
                            ? InkWell(
                                onTap: () {
                                  playAudio(recentSongs, index);
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) => miniLast(
                                        songsList: songs, index: index),
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
                                          id: recentSongs[index].id,
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
                                      recentSongs[index].title!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: Text(recentSongs[index].artist!),
                                    trailing: PoupMenuButtonWidget(
                                      id: recentSongs[index].id!,
                                      index: index,
                                      favSohgs: recentSongs,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    )
                  : const Center(
                      child: Text(
                        'Recents is empty',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
