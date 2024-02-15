import "package:drive_flow_ui/constant.dart";
import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

import "../screens/HomeScreen.dart";
import "../screens/MapsScreen.dart";

class SearshScreen extends StatefulWidget {
  const SearshScreen({super.key});

  @override
  State<SearshScreen> createState() => _SearshScreenState();
}
class _SearshScreenState extends State<SearshScreen> {
  List<Widget> body = [const HomeScreen(),const MapsScreen(),Icon(Icons.message),Icon(Icons.person)];
  int index_=1;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300
              ),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.only(bottom:3,top: 3),
            child: GNav(
              onTabChange: (indix) {
                setState(() {
                  index_=indix;
                  print(index_);
                });
              },
              tabBackgroundColor: MainColor,
              activeColor: Colors.white,
              curve: Curves.easeInSine,
              textStyle: const TextStyle(fontFamily: 'Poppins_med',color: Colors.white),
              selectedIndex: 1,
              padding:const  EdgeInsets.all(12),
              iconSize: 30,
              gap: 8,
              tabs:const  [
                GButton(icon: Icons.home,text: 'Home'),
                GButton(icon: Icons.search,text: 'Search',),
                GButton(icon: Icons.message,text: 'Messages',),
                GButton(icon: Icons.person,text: 'Profile',),
              ],
            ),
          ),
        ),
        body: Center(child: body[index_],),
      ),
    );
  }
}
