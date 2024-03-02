import 'package:flutter/material.dart';



class TitleInput extends StatelessWidget {
  const TitleInput({
    super.key,
    required this.width, this.text,
  });

  final double width;
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: width * 0.035),
      child:  Text(text,style: const TextStyle(fontSize: 18,fontFamily: 'Poppins_med'),),
    );
  }
}