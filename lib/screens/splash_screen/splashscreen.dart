import 'package:flutter/material.dart';
import 'package:music_app_player/db/functions/db_functions/mostly_function.dart.dart';
import 'package:music_app_player/db/functions/db_functions/recent_function.dart';

import 'package:music_app_player/screens/home_screen/homescreen.dart';
import 'package:music_app_player/screens/splash_screen/functions/fetch_song_details.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    fetchSongs();
    playlistFetch();
    navigateToHomeScreen();
    openRecentlyPlayedDB();
    openMostly();

    super.initState();
  }

  void navigateToHomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 5000));

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_image.png',
              height: 100,
            ),
            const Text(
              'Sonic Inferno',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
