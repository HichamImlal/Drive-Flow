import 'package:drive_flow_ui/screens/LoginScreen.dart';
import 'package:drive_flow_ui/screens/SignUpScreen.dart';
import 'package:drive_flow_ui/screens/SplashScreen.dart';
import 'package:drive_flow_ui/screens/intro_screen/IntroScreen.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      routes: {
        'LoginScreen':(context) => const LoginScreen(),
        'SignUpScreen':(context) => const SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
