import 'package:flutter/material.dart';
import 'package:music_app_player/screens/home_screen/widgets/naviagting_function.dart';

class ScrollViewWidget extends StatefulWidget {
  const ScrollViewWidget({super.key});

  @override
  State<ScrollViewWidget> createState() => _ScrollViewWidgetState();
}

class _ScrollViewWidgetState extends State<ScrollViewWidget> {
  final Decoration _decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    shape: BoxShape.rectangle,
  );

  var categories = ['Play List', 'Mostly Played', 'Recents', 'Favorite'];

  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => navigation(index, context),
              child: Container(
                width: 150,
                decoration: _decoration,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/cover_image.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                          child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
