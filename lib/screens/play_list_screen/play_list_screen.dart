import 'package:flutter/material.dart';

import 'package:music_app_player/db/functions/db_functions/playllist_functions.dart';
import 'package:music_app_player/screens/home_screen/homescreen.dart';
import 'package:music_app_player/screens/play_list_screen/listing_screen.dart';
import 'package:music_app_player/screens/splash_screen/functions/fetch_song_details.dart';

// ignore: must_be_immutable
class MyList extends StatefulWidget {
  MyList({super.key, this.idx});

  int? idx;

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int count = 0;

  String empty = 'empty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        icon: const Icon(Icons.arrow_back_ios))),
                const SizedBox(
                  width: 270,
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                      onPressed: () {
                        showAddPlaylistDialog(context);
                      },
                      icon: Icon(
                        Icons.playlist_add,
                        color: Colors.grey[800],
                      )),
                )
              ],
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(15),
              // child: textWidget(
              //     name: 'My List', fontWeight: FontWeight.bold, size: 40),
              child: Text(
                'My List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: playListNotifier,
              builder: (context, value, child) {
                return playListNotifier.value.isNotEmpty
                    ? Expanded(
                        child: SizedBox(
                            height: 500,
                            child: GridView.count(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing: 10, // Spacing between columns
                              mainAxisSpacing: 10, // Spacing between rows
                              padding: const EdgeInsets.all(
                                  10), // Padding around the grid
                              children: List.generate(
                                  playListNotifier.value.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    if (widget.idx != null) {
                                      playlistAddDB(songs[widget.idx!],
                                          playListNotifier.value[index].name);
                                      playListNotifier.value[index].container
                                          .add(songs[widget.idx!]);
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ListingScreen(
                                              playlistName: playListNotifier
                                                  .value[index].name,
                                              idx: index),
                                        ));
                                  },
                                  child: card(
                                      index,
                                      playListNotifier.value[index].name,
                                      context),
                                );
                              }),
                            )),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.300999,
                        child: const Center(
                          child: Text(
                            'Play List is empty',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                      );
              },
            ),
          ])),
    ));
  }
}

Widget card(int index, var playlistName, BuildContext context) {
  return Card(
    elevation: 10,
    child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 2), color: Color.fromARGB(255, 215, 215, 215)),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Edit Playlist'),
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Delete Playlist'),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 'edit') {
                    editShowAddPlaylistDialog(
                      context,
                      index,
                      playListNotifier.value[index].name,
                    );
                  } else if (value == 'delete') {
                    playlistDelete(index);
                  }
                },
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Icon(Icons.music_note),
          Text(playlistName)
        ],
      ),
    ),
  );
}

void showAddPlaylistDialog(
  BuildContext context,
) {
  String playlistName = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Playlist'),
        content: TextField(
          onChanged: (value) {
            playlistName = value;
          },
          decoration: const InputDecoration(
            hintText: 'Enter playlist name',
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              addPlayList(playlistName);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

void editShowAddPlaylistDialog(BuildContext context, index, playlistName) {
  TextEditingController playlistController =
      TextEditingController(text: playlistName);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            title: const Text('Update Playlist'),
            content: TextField(
                onChanged: (value) {
                  setState(() {
                    playlistName = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter playlist name',
                ),
                controller: playlistController),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  playlistRename(index, playlistName);
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Edit'),
              ),
            ],
          );
        },
      );
    },
  );
}
