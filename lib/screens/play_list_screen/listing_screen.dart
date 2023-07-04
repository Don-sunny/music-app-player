import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/playllist_functions.dart';
import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../mini_player/mini_player.dart';

import '../splash_screen/functions/fetch_song_details.dart';

// ignore: must_be_immutable
class ListingScreen extends StatefulWidget {
  ListingScreen({super.key, required this.playlistName, required this.idx});

  String playlistName;

  int idx;

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
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
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Text(
                  widget.playlistName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () => showModalBottomSheet(
                          context: ctx,
                          builder: (context) => PlaylistBottomSheet(
                              playlistName: widget.playlistName,
                              idx: widget.idx),
                        ),
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
                child: InkWell(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                ),
                child: ValueListenableBuilder(
                  valueListenable: playListNotifier,
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey[300],
                              child: InkWell(
                                onTap: () {
                                  playAudio(value[widget.idx].container, index);
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) => miniLast(
                                        songsList: value[widget.idx].container,
                                        index: index),
                                  );
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipOval(
                                      child: QueryArtworkWidget(
                                        id: value[widget.idx]
                                            .container[index]
                                            .id,
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
                                    value[widget.idx].container[index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  subtitle: Text(value[widget.idx]
                                      .container[index]
                                      .artist!),
                                  trailing: IconButton(
                                    onPressed: () {
                                      playlistRemoveDB(
                                          value[widget.idx].container[index],
                                          widget.playlistName);
                                      playListNotifier
                                          .value[widget.idx].container
                                          .remove(value[widget.idx]
                                              .container[index]);
                                    },
                                    icon: const Icon(
                                      Icons.playlist_remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(height: 20),
                          itemCount: value[widget.idx].container.length),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class PlaylistBottomSheet extends StatelessWidget {
  PlaylistBottomSheet(
      {super.key, required this.playlistName, required this.idx});

  String playlistName;

  int idx;

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Add to play list',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                          color: Colors.grey[300],
                          child: InkWell(
                            onTap: () {
                              playlistAddDB(songs[index], playlistName);
                              playListNotifier.value[idx].container
                                  .add(songs[index]);
                              Navigator.pop(context);
                            },
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
                              title: Text(
                                songs[index].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              subtitle: Text(songs[index].artist!),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(height: 20),
                    itemCount: songs.length)),
          ),
        ),
      ],
    );
  }
}
