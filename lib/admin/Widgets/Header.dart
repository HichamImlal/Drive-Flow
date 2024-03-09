import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.width,
    required GlobalKey<ScaffoldState> scaffoldKey, this.text,
  }) : _scaffoldKey = scaffoldKey;

  final double width;
  final text;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        child: Image(
          image: const AssetImage("assets/images/menu.png"),
          width: width * 0.065,
        ),
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "EditProfilScreen");
        },
        child: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/admin.jpg"),
        ),
      )
    ],
            );
  }
}