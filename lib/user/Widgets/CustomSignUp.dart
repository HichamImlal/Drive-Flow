import 'dart:convert';
import 'package:drive_flow_ui/user/Widgets/CustomIcons.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CustomButton.dart';
import 'CustomInput.dart';
import 'package:crypto/crypto.dart';

class SignUpCustom extends StatefulWidget {
  const SignUpCustom({super.key});

  @override
  State<SignUpCustom> createState() => _SignUpCustomState();
}

class _SignUpCustomState extends State<SignUpCustom> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _username;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _isLoading = false;

  String url =
      "http://${ipAddress}:8080/register"; 

  @override
  void initState() {
    super.initState();
    _confirmPasswordController = TextEditingController();
    _username = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    setState(() {
      _isLoading = true;
    });
    var passwordBytes = utf8.encode(_passwordController.text.trim());
    var sha256Hash = sha256.convert(passwordBytes);
    await Future.delayed( const Duration(seconds: 2));
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _username.text,
        'email': _emailController.text.trim(),
        'password': sha256Hash.toString(),
        'role':false,
      }),
    );

    if (response.statusCode == 200 &&
        _passwordController.text == _confirmPasswordController.text &&
        response.body.length != 0) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content:  Text(
              'Registration successful'),
          duration:  Duration(seconds: 3),
        ));
        Navigator.pushNamed(context,'LoginScreen' );
    } else {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          content:   Text(
              'The entered password does not match the confirmation password.'),
          duration:  Duration(seconds: 3),
        ));
      } else if (response.body.length == 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email address already exists.'),
          duration: Duration(seconds: 3),
        ));
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
                      'Inscription',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInput(
                      hint: 'Nom d\'utilisateur',
                      controller: _username,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length<8) {
                          return 'Entrez votre nom d\'utilisateur ?';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      controller: _emailController,
                      hint: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez votre adresse e-mail ?';
                        }
                        if (!value.trim().endsWith('@gmail.com')) {
                          return 'Entrez une adresse Gmail ?';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      controller: _passwordController,
                      hint: 'Mot de passe',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 9) {
                          return 'Le mot de passe doit contenir entre 0 et 9 caractères ?';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomInput(
                      controller: _confirmPasswordController,
                      hint: 'Confirmez le mot de passe',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mot de passe incorrect ?';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    
                  _isLoading
                      ? CircularProgressIndicator(
                        color: MainColor,
                      )
                      : ButtonCustom(
                    text: 'Inscription',
                    clicked: () {
                      if (_formKey.currentState!.validate()) {
                      registerUser();
                  }
                    },),
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
                          'Vous avez déjà un compte ?',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: Text(
                            'Connexion',
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
      ),
    );
  }
}
