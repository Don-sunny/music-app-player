import 'package:flutter/material.dart';
import 'package:music_app_player/screens/recent_sscreen/app_bar_recent_screen.dart';
import 'package:music_app_player/screens/recent_sscreen/exapnded_widget_recent.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidgetRecentsScreen(),
          SizedBox(
            height: 50,
          ),
          RecentExpandedWidget()
        ],
      )),
    );
  }
}
