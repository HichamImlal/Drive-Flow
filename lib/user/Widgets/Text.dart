import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,@required this.text,
  });
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:const TextStyle(fontSize: 16,fontFamily:'Poppins_semiBold'),);
  }
}