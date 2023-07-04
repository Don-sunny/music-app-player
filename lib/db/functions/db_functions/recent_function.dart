import 'package:hive/hive.dart';

import '../../model/recent_model.dart';

late Box<RecentlyPlayed> recentlyPlayedDB;


openRecentlyPlayedDB() async {
  recentlyPlayedDB = await Hive.openBox<RecentlyPlayed>('recently_played');
}


updatedRecentlyPlayed(RecentlyPlayed value) {
  List<RecentlyPlayed> list = recentlyPlayedDB.values.toList();
  bool isAlready =
      list.where((element) => element.title == value.title).isEmpty;

  if (isAlready) {
    recentlyPlayedDB.add(value);
  } else {
    int index = list.indexWhere((element) => element.title == value.title);
    recentlyPlayedDB.deleteAt(index);
    recentlyPlayedDB.add(value);
  }
}
