import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/fav_function.dart';

import '../db/model/favorite_song_model.dart';
import '../screens/splash_screen/functions/fetch_song_details.dart';

// ignore: must_be_immutable
class PoupMenuButtonWidget extends StatefulWidget {
  PoupMenuButtonWidget(
      {Key? key, required this.index, required this.id, required this.favSohgs})
      : super(key: key);

  final int index;
  final int id;

  var favSohgs;

  @override
  _PoupMenuButtonWidgetState createState() => _PoupMenuButtonWidgetState();
}

class _PoupMenuButtonWidgetState extends State<PoupMenuButtonWidget> {
  @override
  Widget build(BuildContext ctx) {
    return ValueListenableBuilder<List<Favsongs>>(
      valueListenable: favsongsNotifier,
      builder: (BuildContext ctx, List<Favsongs> value, _) {
        bool isContains = value.any((element) => element.id == widget.id);
        return PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  Icon(
                    isContains ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(isContains ? 'Remove favorite' : 'Add to Favorite')
                ],
              ),
            ),
          ],
          onSelected: (int value) {
            if (isContains == false) {
              addToFunction(
                songs[widget.index].id,
                Favsongs(
                  title: songs[widget.index].title,
                  artist: songs[widget.index].artist,
                  duration: songs[widget.index].duration,
                  uri: songs[widget.index].uri,
                  id: songs[widget.index].id,
                ),
              );
            } else {
              removeFunction(widget.id);
            }
          },
        );
      },
    );
  }
}
