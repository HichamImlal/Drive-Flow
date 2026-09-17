import 'package:flutter/material.dart';


class CustomMenu extends StatelessWidget {
  final VoidCallback ? clicked;
  const CustomMenu({
    super.key,
    required this.width,
    this.pathImage,
    this.text, this.clicked,
  });
  final double width;
  final pathImage;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 0.2)),
      ),
      child: ListTile(
        leading: Image(
          image: AssetImage(pathImage),
          width: text == "Bookings" || text == "Logout" || text == "Customers" || text=="Home"
              ? width * 0.055
              : width * 0.07,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: clicked,
      ),
    );
  }
}
