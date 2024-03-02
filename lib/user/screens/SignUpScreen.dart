import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';
import '../Widgets/CustomSignUp.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Positioned(
              top: -height * 0.45,
              child: Transform.rotate(
                angle: 21,
                child: Container(
                  height: height*1.07,
                  width: height*1.07,
                  decoration:  BoxDecoration(color: MainColor),
                ),
              ),
            ),
            const Center(child: SignUpCustom()),
          ],
        ),
    );
  }
}







