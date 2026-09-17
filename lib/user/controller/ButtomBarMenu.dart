import "package:drive_flow_ui/user/screens/HistoryScreen.dart";
import "package:drive_flow_ui/user/screens/SettingsScreen.dart";
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
  List<Widget> body = [const HomeScreen(),const MapsScreen(), const HistoryScreen(),const SettingsScreen()];
  int index_=1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300
              ),
            ),
          ),
          child: GNav(
            onTabChange: (indix) {
              setState(() {
                index_=indix;
              });
            },
            color: Colors.black54,
            duration: const Duration(seconds: 0),
            activeColor: Colors.black,
            selectedIndex: 1,
            padding:const  EdgeInsets.symmetric(horizontal:12,vertical: 5),
            iconSize: 25,
            textSize: 13,
            style: GnavStyle.oldSchool, 
            tabs:const  [
              GButton(icon: Icons.home,text: 'Accueil',),
              GButton(icon: Icons.map_outlined,text: 'Maps',),
              GButton(icon: Icons.history,text: 'Histoire',),
              GButton(icon: Icons.settings,text: 'Paramètres',),
            ],
          ),
        ),
        body: Center(child: body[index_],),
    );
  }
}
