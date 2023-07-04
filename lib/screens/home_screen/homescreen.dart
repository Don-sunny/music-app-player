import 'package:flutter/material.dart';
import 'package:music_app_player/screens/home_screen/widgets/appbarwidget.dart';

import 'package:music_app_player/screens/home_screen/widgets/scroll_view.dart';
import 'package:music_app_player/widgets/all_songs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            SizedBox(
              height: 30,
            ),
            ScrollViewWidget(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Songs',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            AllSongsList()
          ],
        ),
      ),
    );
  }
}
