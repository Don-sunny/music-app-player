import 'package:flutter/material.dart';
import 'package:music_app_player/screens/most_played_screen/app_bar_widget_most_played.dart';
import 'package:music_app_player/screens/most_played_screen/expanded_widget_mostly.dart';

class MostlyPlayedScreen extends StatelessWidget {
  const MostlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidgetMostlyPlayed(),
          SizedBox(
            height: 50,
          ),
          MostlyExpandedWidget()
        ],
      )),
    );
  }
}
