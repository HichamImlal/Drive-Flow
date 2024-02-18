import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key, required this.text,
  });
  final text;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.05),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
         child:   Text(text,style:const  TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
      ),
    );
  }
}