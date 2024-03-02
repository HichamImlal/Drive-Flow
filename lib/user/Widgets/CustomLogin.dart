import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constant.dart';
import 'CustomButton.dart';
import 'CustomIcons.dart';
import 'CustomInput.dart';

class LoginCustom extends StatefulWidget {
  const LoginCustom({super.key});

  @override
  State<LoginCustom> createState() => _LoginCustomState();
}

class _LoginCustomState extends State<LoginCustom> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String url = "http://${ipAddress}:8080/login";
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Future<void> loginUser() async {
    setState(() {
      _isLoading = true;
    });
    var passwordBytes = utf8.encode(_passwordController.text);
    var sha256Hash = sha256.convert(passwordBytes);
    await Future.delayed(Duration(seconds: 2));
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _emailController.text.trim(),
        'password': sha256Hash.toString()
      }),
    );

    if (response.statusCode == 200 && response.body.length != 0) {
      Map<String, dynamic> userData = jsonDecode(response.body);
      Provider.of<UserDataProvider>(context, listen: false)
          .setUserData(userData);
      if(userData['role']==false) {
        Navigator.pushNamed(context, "SearshScreen");
      }else{
        Navigator.pushNamed(context, "DashboardAdmin");
      }

    } else {
      print('Login failed');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please try again.'),
        duration: Duration(seconds: 3),
      ));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                    height: height * 0.01,
                  ),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 100,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    hint: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email address ?';
                      }
                      if (!value.trim().endsWith('@gmail.com') ||
                          value.trim().length < "@gmail.com".length + 3) {
                        return 'Enter a Gmail address ?';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInput(
                    hint: 'Password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.length < 9) {
                        return 'Password must be between 0 and 9 characters';
                      }
                      return null;
                    },
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
                                inactiveTrackColor:
                                    Colors.grey.withOpacity(0.5),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                              ),
                            ),
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _isLoading
                      ? CircularProgressIndicator(
                          color: MainColor,
                        )
                      : ButtonCustom(
                          text: 'Login',
                          clicked: () {
                            if (_formKey.currentState!.validate()) {
                              loginUser();
                            }
                          },
                        ),
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
                        'I don\'t have an a compte ?',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'SignUpScreen');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: MainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.008,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
