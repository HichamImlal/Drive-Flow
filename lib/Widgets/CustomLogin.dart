import 'package:flutter/material.dart';

import '../constant.dart';
import 'CustomButton.dart';
import 'CustomIcons.dart';
import 'CustomInput.dart';

class LoginCustom extends StatefulWidget {
  const LoginCustom({super.key});

  @override
  State<LoginCustom> createState() => _LoginCustomState();
}

class _LoginCustomState extends State<LoginCustom> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.65,
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
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Poppins_med',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _switchValue = !_switchValue;
                            });
                          },
                          child: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: _switchValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _switchValue = newValue;
                                });
                              },
                              activeTrackColor: Colors.blue[200],
                              activeColor: MainColor,
                              inactiveTrackColor: Colors.grey.withOpacity(0.5),
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                            ),
                          ),
                        ),
                         const Text(
                          'Remember me',
                          style:
                              TextStyle(fontFamily: 'Poppins_med', fontSize: 13),
                                               ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontFamily: 'Poppins_med', fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonCustom(text:'Login', clicked: () {Navigator.pushNamed(context, 'SearshScreen');  },),
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
                      'I don’t have an a compte ?',
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
                        Navigator.pushNamed(context, 'SignUpScreen');
                      },
                      child: Text(
                        'Register',
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
