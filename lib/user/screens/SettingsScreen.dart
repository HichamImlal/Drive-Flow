import 'package:drive_flow_ui/user/Widgets/CustomBoxSettings.dart';
import 'package:drive_flow_ui/user/Widgets/Text.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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




