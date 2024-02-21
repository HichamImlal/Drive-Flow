import 'package:flutter/material.dart';


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