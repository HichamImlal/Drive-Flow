import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         Center(
          child:  CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/admin.jpg"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Drive Flow",style: TextStyle(fontSize: 24,fontFamily: "Poppins_med"),),
      ],
    );
  }
}