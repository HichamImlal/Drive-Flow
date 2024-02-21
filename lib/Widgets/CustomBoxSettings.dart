import 'package:drive_flow_ui/Widgets/CustomSettings.dart';
import 'package:flutter/material.dart';



class CustomBoxSettings extends StatelessWidget {
  const CustomBoxSettings(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.IconFirst,
      this.textFirst,
      // ignore: non_constant_identifier_names
      required this.IconSecond,
      this.textSecond});
  // ignore: non_constant_identifier_names
  final IconData IconFirst;
  // ignore: prefer_typing_uninitialized_variables
  final textFirst;
  // ignore: non_constant_identifier_names
  final IconData IconSecond;
  // ignore: prefer_typing_uninitialized_variables
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