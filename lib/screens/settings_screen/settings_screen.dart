import 'package:flutter/material.dart';
import 'package:music_app_player/screens/settings_screen/privacy_polic/privacy_policy.dart';

import 'about_us.dart';
import 'app_bar_settings.dart';
import 'row_widget_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const AppBarWidgetSettings(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    // RowWidgetSettingsScreen(
                    //   name: 'Dark mode',
                    //   icon: Icons.dark_mode,
                    // ),
                    InkWell(
                      onTap: () => Navigator.push(
                          ctx,
                          MaterialPageRoute(
                            builder: (context) => const Aboutus(),
                          )),
                      child: const RowWidgetSettingsScreen(
                        name: 'About us',
                        icon: Icons.info,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          ctx,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy(),
                          )),
                      child: const RowWidgetSettingsScreen(
                        name: 'Privacy Policy',
                        icon: Icons.privacy_tip,
                      ),
                    ),
                    const RowWidgetSettingsScreen(
                      name: 'Share App',
                      icon: Icons.share,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 350),
          Text(
            'Version 1.0',
            style: TextStyle(color: Colors.grey[500]),
          )
        ],
      )),
    );
  }
}
