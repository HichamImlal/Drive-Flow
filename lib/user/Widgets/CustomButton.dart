import 'package:flutter/material.dart';

import '../../constant.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback clicked;
  const ButtonCustom({super.key, this.text, required this.clicked,  this.isPost=true,});
  final text;
  final bool isPost;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: clicked,
      child: Container(
        height: height * 0.065,
        width: isPost ? width*0.5 : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MainColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
