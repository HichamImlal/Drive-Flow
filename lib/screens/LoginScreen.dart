import 'package:flutter/material.dart';
import '../Widgets/CustomLogin.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -height * 0.335,
            child: Transform.rotate(
              angle: 21,
              child: Container(
                height: height,
                width: height * 0.5,
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
          ),
          const Center(child: LoginCustom()),
        ],
      ),
    );
  }
}





