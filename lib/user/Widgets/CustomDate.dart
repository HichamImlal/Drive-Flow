import 'package:flutter/material.dart';



class CustomDate extends StatelessWidget {
  const CustomDate({
    super.key,@required this.date,
  });
  final date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,top: 3),
      child: Text(date,style: const TextStyle(fontSize: 10,color: Colors.grey),),
    );
  }
}