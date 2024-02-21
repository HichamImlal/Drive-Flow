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
    final width = MediaQuery.sizeOf(context).width;
    return  SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.04),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                     SizedBox(
                      height:height*0.01 ,
                    ),
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 100,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
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
                    SizedBox(
                      height: height*0.05,
                    ),
                    ButtonCustom(text:'Sign Up', clicked: () {Navigator.pushNamed(context, 'SearshScreen');}),
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
                              color: MainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.008,)
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}