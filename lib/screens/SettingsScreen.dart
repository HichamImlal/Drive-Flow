import 'package:drive_flow_ui/Widgets/Header.dart';
import 'package:drive_flow_ui/Widgets/Text.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(text: 'Settings'),
            SizedBox(height: 20,),
            CustomText(text: 'Account'),
            SizedBox(height: 10,),
            CustomBoxSettings(
              IconFirst: Icons.person,
              textFirst: 'Edit profile',
              IconSecond: Icons.lock_rounded,
              textSecond: 'Security',
            ),
            SizedBox(height: 20,),
            CustomText(text: 'Support & About'),
            SizedBox(height: 10,),
            CustomBoxSettings(
              IconFirst: Icons.help_outline_outlined,
              textFirst: 'Help & Support',
              IconSecond: Icons.privacy_tip_outlined,
              textSecond: 'Terms & Policies',
            ),
            SizedBox(height: 20,),
            CustomText(text: 'Actions'),
            SizedBox(height: 10,),
            CustomBoxSettings(
              IconFirst: Icons.flag,
              textFirst: 'Report a  problem',
              IconSecond: Icons.logout,
              textSecond: 'Log out',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBoxSettings extends StatelessWidget {
  const CustomBoxSettings(
      {super.key,
      required this.IconFirst,
      this.textFirst,
      required this.IconSecond,
      this.textSecond});
  final IconData IconFirst;
  final textFirst;
  final IconData IconSecond;
  final textSecond;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        CustomSettings(
          icon: IconFirst,
          text: textFirst,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomSettings(
          icon: IconSecond,
          text: textSecond,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}

class CustomSettings extends StatelessWidget {
  const CustomSettings({super.key, required this.icon, this.text});
  final IconData icon;
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.06,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ]),
    );
  }
}
