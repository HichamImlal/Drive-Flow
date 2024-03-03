import 'package:flutter/material.dart';


class HeaderSettings extends StatelessWidget {
  const HeaderSettings({
    super.key,
    required this.width, this.text,
  });

  final double width;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(
              image: const AssetImage("assets/images/arrow.png"),
              width: width * 0.06,
            ),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
          SizedBox(width: width * 0.06,),
        ],
      ),
    );
  }
}
