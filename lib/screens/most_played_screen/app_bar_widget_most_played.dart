import 'package:flutter/material.dart';

class AppBarWidgetMostlyPlayed extends StatelessWidget {
  const AppBarWidgetMostlyPlayed({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.grey[300]),
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
          const SizedBox(width: 80),
          const Text(
            'Mostly Played',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
