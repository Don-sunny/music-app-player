import 'package:hive_flutter/adapters.dart';
import 'package:music_app_player/db/model/mostly_played.dart';

late Box<MostlyPlayed> mostlyPlayedDb;

openMostly() async {
  mostlyPlayedDb = await Hive.openBox<MostlyPlayed>('mostly_played');
}

addMostlyPlayedSong(MostlyPlayed song) async {
  List<MostlyPlayed> mostlyPlayedList = mostlyPlayedDb.values.toList();
  if (mostlyPlayedList
      .where((element) => element.title == song.title)
      .isEmpty) {
    mostlyPlayedDb.put(song.id, song);
  } else {
    MostlyPlayed? sog = mostlyPlayedDb.get(song.id);
    int count = sog?.count ?? 0;
    song.count = count + 1;
    await mostlyPlayedDb.put(song.id, song);
  }
}

List<MostlyPlayed> sortMostlyPlayed() {
  List<MostlyPlayed> sortList = [];

  sortList = mostlyPlayedDb.values.toList();

  sortList.sort(
    (a, b) => (b.count ?? 0).compareTo(a.count ?? 0),
  );

  List<MostlyPlayed> mostlyPlayedSortList = [];

  for (final element in sortList) {
    if (element.count != null) {
      if (element.count! >= 3) {
        mostlyPlayedSortList.add(element);
      } else {
        return mostlyPlayedSortList;
      }
    }
  }
  return mostlyPlayedSortList;
}


