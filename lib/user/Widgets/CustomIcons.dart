import 'package:flutter/material.dart';

class IconsCustom extends StatelessWidget {
  const IconsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/facebook.png'),
          width: 25,
        ),
        SizedBox(
          width: 7,
        ),
        Image(
          image: AssetImage('assets/images/google.png'),
          width: 25,
        ),
        SizedBox(
          width: 7,
        ),
        Image(
          image: AssetImage('assets/images/linkedin.png'),
          width: 25,
        ),
      ],
    );
  }
}
