import 'package:flutter/material.dart';


class HeaderSettings extends StatelessWidget {
  const HeaderSettings({
    super.key,
    required this.width, this.text, this.padding,
  });

  final double width;
  final text;
  final padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:padding ?? 10),
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
            style: const TextStyle(fontSize: 25,fontFamily: "Poppins_med"),
          ),
          Text(
            " ",
          ),
        ],
      ),
    );
  }
}
