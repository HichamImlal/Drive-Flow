import 'package:drive_flow_ui/screens/LoginScreen.dart';
import 'package:drive_flow_ui/controller/ButtomBarMenu.dart';
import 'package:drive_flow_ui/screens/SignUpScreen.dart';
import 'package:drive_flow_ui/screens/SplashScreen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins_med'),
      routes: {
        'LoginScreen':(context) => const LoginScreen(),
        'SignUpScreen':(context) => const SignUpScreen(),
        'SearshScreen':(context) => const SearshScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
