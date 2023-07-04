// home page app bar widget.

import 'package:flutter/material.dart';
import 'package:music_app_player/screens/search_screen/search_screen.dart';
import 'package:music_app_player/screens/settings_screen/settings_screen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(ctx,
                  MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
            )),
        const SizedBox(
          width: 30,
        ),
        const Text(
          'My Music',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
          ),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (ctx) => const SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search_outlined)),
        )
      ],
    );
  }
}
