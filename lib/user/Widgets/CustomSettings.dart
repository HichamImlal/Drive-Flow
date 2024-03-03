import 'package:drive_flow_ui/user/screens/EditProfilScreen.dart';
import 'package:drive_flow_ui/user/screens/LoginScreen.dart';
import 'package:drive_flow_ui/user/screens/SecurityScreen.dart';
import 'package:flutter/material.dart';

class CustomSettings extends StatelessWidget {
  const CustomSettings({
    super.key,
    required this.icon,
    this.text,
  });
  final IconData icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () {
          if (text == "Edit profile") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditProfilScreen(),
            ));
          } else if (text == "Security") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SecurityScreen(),
            ));
          } else if (text == "Log out") {
            _showLogoutDialog(context);
          }
        },
        child: Container(
          color: Colors.grey[200],
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.06,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Logout"),
            content: const  Text('Are you sure you want to logout ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
                child: const Text('Yes'),
              )
            ],
          );
        });
  }
}
