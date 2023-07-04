import 'package:flutter/material.dart';
import 'package:music_app_player/screens/settings_screen/about_us/app_bar_widget_about_us.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidgetAbout(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Sonic Inferno - Your Ultimate Local Storage Music App!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "At Sonic Inferno, we believe in bringing the power of music to your fingertips. Whether you're a passionate music lover, an aspiring artist, or simply someone who enjoys grooving to their favorite tunes, our app is designed to enhance your music experience.",
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Key Features of Sonic Inferno:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "1. Local Storage: Say goodbye to the limitations of streaming services. With Sonic Inferno, you have full control over your music library. You can easily upload, organize, and store your entire music collection directly on your device, ensuring that your favorite tracks are always accessible, even without an internet connection.\n\n2. Seamless Organization: Sonic Inferno is equipped with intuitive tools to help you effortlessly organize your music. Create custom playlists for different moods, genres, or occasions. Sort your songs by artist, album, or track name, allowing you to find the perfect song in a matter of seconds.\n\n3. Enhanced Music Player: Our music player is thoughtfully designed to provide a delightful listening experience. Immerse yourself in crystal-clear sound quality and enjoy a sleek and intuitive interface that allows you to navigate through your tracks with ease. Customize your playback options, shuffle your playlist, and repeat your favorite songs with a single tap.\n\n4. Personalized Recommendations: Discovering new music is an exciting journey, and Sonic Inferno is here to guide you. Based on your listening habits and preferences, our app offers personalized recommendations, suggesting artists, albums, and tracks that align with your unique taste. Expand your musical horizons and uncover hidden gems you might have otherwise missed.",
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
