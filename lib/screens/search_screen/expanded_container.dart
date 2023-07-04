import 'package:flutter/material.dart';
import 'package:music_app_player/screens/splash_screen/functions/fetch_song_details.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../widgets/popup_menu_button.dart';

// ignore: must_be_immutable
class ExpandedWidgetSearchScreen extends StatefulWidget {
  ExpandedWidgetSearchScreen({
    super.key,
  });
  ExpandedWidgetSearchScreen.constructor({super.key, required this.value});
  var value;

  @override
  State<ExpandedWidgetSearchScreen> createState() =>
      _ExpandedWidgetSearchScreenState();
}

class _ExpandedWidgetSearchScreenState
    extends State<ExpandedWidgetSearchScreen> {
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
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(blurRadius: 5)],
        ),
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.separated(
              itemCount: foundSongs.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {},
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
                          title: Text(
                            foundSongs[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis),
                          ),
                          subtitle: Text(
                            foundSongs[index].artist!,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                          trailing: PoupMenuButtonWidget(
                            index: index,
                            id: foundSongs[index].id,
                            favSohgs: foundSongs,
                          )),
                    ));
              },
            )),
      ),
    );
  }
}
