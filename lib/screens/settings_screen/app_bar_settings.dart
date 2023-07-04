import 'package:flutter/material.dart';

class AppBarWidgetSettings extends StatelessWidget {
  const AppBarWidgetSettings({super.key});

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
          const SizedBox(
            width: 100,
          ),
          const Text(
            'Options',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          )
        ],
      ),
    );
  }
}
