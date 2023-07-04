import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/play_audio_function/playing_function.dart';
import 'package:music_app_player/mini_player/mini_player.dart';
import 'package:music_app_player/screens/search_screen/app_bar_widget.dart';
import 'package:music_app_player/widgets/popup_menu_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../splash_screen/functions/fetch_song_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SongModel> foundSongs = [];

  @override
  void initState() {
    foundSongs = songs;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<SongModel> result = [];

    if (enteredKeyword.isEmpty) {
      result = songs;
    } else {
      result = songs
          .where((element) => element.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundSongs = result;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            // AppBarWidgetSearchScreen(),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.grey[300],
                  ),
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
                  width: 50,
                ),
                SizedBox(
                  width: 270,
                  child: TextField(
                    onChanged: (value) => runFilter(value),
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Serach here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            // ExpandedWidgetSearchScreen()
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: foundSongs.isEmpty
                        ? const Center(
                            child: Text(
                              'Song Not Found',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.separated(
                            itemCount: foundSongs.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  playAudio(foundSongs, index);
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) => miniLast(
                                        songsList: foundSongs, index: index),
                                  );
                                },
                                child: Card(
                                  color: Colors.grey[300],
                                  child: ListTile(
                                    leading: ClipOval(
                                      child: QueryArtworkWidget(
                                        id: foundSongs[index].id,
                                        type: ArtworkType.AUDIO,
                                        artworkFit: BoxFit.cover,
                                        nullArtworkWidget: Image.asset(
                                          'assets/images/cover_image.png',
                                          fit: BoxFit.cover,
                                          // Add the package name if necessary
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      foundSongs[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    subtitle: Text(foundSongs[index].artist!),
                                    trailing: PoupMenuButtonWidget(
                                        index: index,
                                        id: foundSongs[index].id,
                                        favSohgs: foundSongs),
                                  ),
                                ),
                              );
                            },
                          )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
