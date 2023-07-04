import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_player/db/functions/db_functions/mostly_function.dart.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MostlyExpandedWidget extends StatelessWidget {
  const MostlyExpandedWidget({super.key});

  @override
  Widget build(BuildContext ctx) {
    var mostlyPlayedSongs = sortMostlyPlayed();
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
            child: ValueListenableBuilder(
              valueListenable: mostlyPlayedDb.listenable(),
              builder: (context, value, child) {
                return mostlyPlayedSongs.isNotEmpty
                    ? ListView.separated(
                        itemCount: mostlyPlayedSongs.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.grey[300],
                              child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipOval(
                                    child: QueryArtworkWidget(
                                      id: mostlyPlayedSongs[index].id!,
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
                                  mostlyPlayedSongs[index].title!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                subtitle: Text(
                                  mostlyPlayedSongs[index].artist!,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'Mostly Played is Empty',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      );
              },
            )),
      ),
    );
  }
}
