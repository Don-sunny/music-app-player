import 'package:flutter/material.dart';
import 'package:music_app_player/screens/favorite_escreen/favorite_screen.dart';

import '../../most_played_screen/mostly_played_screen.dart';
import '../../play_list_screen/play_list_screen.dart';
import '../../recent_sscreen/recent_screen.dart';

void navigation(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyList(),
          ));

      break;
    case 1:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MostlyPlayedScreen(),
          ));

      break;
    case 2:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RecentScreen(),
          ));

      break;
    case 3:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoriteScreen(),
          ));

      break;
  }
}
