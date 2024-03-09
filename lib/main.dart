import 'package:drive_flow_ui/admin/screens/AddPostAdmin.dart';
import 'package:drive_flow_ui/admin/screens/DashboardAdmin.dart';
import 'package:drive_flow_ui/admin/screens/HomeScreenAdmin.dart';
import 'package:drive_flow_ui/user/controller/ButtomBarMenu.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:drive_flow_ui/user/screens/EditProfilScreen.dart';
import 'package:drive_flow_ui/user/screens/LoginScreen.dart';
import 'package:drive_flow_ui/user/screens/SignUpScreen.dart';
import 'package:drive_flow_ui/user/screens/SplashScreen.dart';
import 'package:provider/provider.dart';
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
    return   ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins_med'),
        routes: {
          'LoginScreen':(context) => const LoginScreen(),
          'SignUpScreen':(context) => const SignUpScreen(),
          'SearshScreen':(context) => const SearshScreen(),
          'DashboardAdmin':(context) =>const DashboardAdmin(),
          'HomeScreenAdmin':(context) =>const HomeScreenAdmin(),
          'AddPostAdmin':(context) =>const AddPostAdmin(),
          'EditProfilScreen':(context) => const EditProfilScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
