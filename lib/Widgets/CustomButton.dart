import 'package:flutter/material.dart';

import '../constant.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback clicked;
  const ButtonCustom({super.key, this.text, required this.clicked,});
  final text;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: clicked,
      child: Container(
        height: height * 0.07,
        width: height * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: MainColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins_med',
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
