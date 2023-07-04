import 'package:flutter/material.dart';
import 'package:music_app_player/screens/search_screen/expanded_container.dart';

TextEditingController searchController = TextEditingController();

class AppBarWidgetSearchScreen extends StatelessWidget {
  const AppBarWidgetSearchScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey[300],
          ),
          width: 50,
          height: 50,
          child: IconButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        SizedBox(
          width: 270,
          child: TextField(
            onChanged: (value) =>
                ExpandedWidgetSearchScreen.constructor(value: value),
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Serach here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }
}
