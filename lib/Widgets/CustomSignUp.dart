import 'package:drive_flow_ui/Widgets/CustomIcons.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'CustomButton.dart';
import 'CustomInput.dart';

class SignUpCustom extends StatelessWidget {
  const SignUpCustom({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return  SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.77,
              width: height * 0.44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 100,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Poppins_med',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   CustomInput(
                    hint: 'Username',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   CustomInput(
                    hint: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   CustomInput(
                    hint: 'Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   CustomInput(
                    hint: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ButtonCustom(text:'Sign Up'),
                  const SizedBox(
                    height: 15,
                  ),
                  const IconsCustom(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Alredy have an Account ?',
                        style: TextStyle(
                          fontFamily: 'Poppins_med',
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'LoginScreen');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins_med',
                            color: MainColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}