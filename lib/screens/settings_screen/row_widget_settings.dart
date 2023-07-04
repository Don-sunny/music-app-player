import 'package:flutter/material.dart';

class RowWidgetSettingsScreen extends StatelessWidget {
  const RowWidgetSettingsScreen(
      {super.key, required this.icon, required this.name});

  // ignore: prefer_typing_uninitialized_variables
  final icon;

  // ignore: prefer_typing_uninitialized_variables
  final name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 20,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
          width: 100,
        ),
        if (name == 'Dark mode')
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.toggle_on,
                size: 40,
                color: Colors.black,
              ))
      ],
    );
  }
}
