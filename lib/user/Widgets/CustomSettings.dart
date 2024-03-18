import 'package:drive_flow_ui/user/screens/EditProfilScreen.dart';
import 'package:drive_flow_ui/user/screens/LoginScreen.dart';
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
          if (text == "Modifier le profil") {
            Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfilScreen(
                          isAdmin: false,
                        ),
                      ));
            
          } else if (text == "Security") {
            Navigator.pushNamed(context, 'SecurityScreen');
          } else if (text == "Déconnexion") {
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
            title: const Text("Déconnexion"),
            content: const  Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:const Text('Non'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
                child: const Text('Oui'),
              )
            ],
          );
        });
  }
}
