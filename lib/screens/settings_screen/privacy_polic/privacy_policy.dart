import 'package:flutter/material.dart';
import 'package:music_app_player/screens/settings_screen/privacy_polic/privacy_policy_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidgetPrivacy(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Privacy Policy for Sonic Inferno Music App",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "At Sonic Inferno, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, store, and disclose your data when you use our music app, Sonic Inferno. By using our app, you consent to the practices described in this Privacy Policy.",
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
                          "Information We Collect:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "1. Information We Collect: Personal Information: When you use Sonic Inferno, we may collect certain personal information, such as your name, email address, and profile picture. This information is collected when you create an account or voluntarily provide it to personalize your experience\n\n2. Use of Information: Personalization: We may use your personal information to personalize your experience, including recommending music based on your preferences, creating customized playlists, and providing relevant content.\n\n3. Data Security: We implement industry-standard security measures to protect your personal information and prevent unauthorized access, disclosure, or alteration\n\n4. Data Sharing: We may share your information with trusted service providers and partners who assist us in delivering our services, subject to strict confidentiality obligations.\n\n5. Children's Privacy:Sonic Inferno is not intended for use by children under the age of 13. We do not knowingly collect personal information from children. If you believe we have inadvertently collected information from a child, please contact us, and we will promptly delete it.",
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
      )),
    );
  }
}
