import 'package:flutter/material.dart';
import 'package:music_app_player/screens/favorite_escreen/app_bar_favorite.dart';
import 'package:music_app_player/screens/favorite_escreen/expanded_widget_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidgetFAvorite(),
          SizedBox(
            height: 50,
          ),
          FavoriteExpandedWidget()
        ],
      )),
    );
  }
}
