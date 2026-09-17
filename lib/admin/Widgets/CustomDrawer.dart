import 'package:drive_flow_ui/admin/Widgets/CustomMenu.dart';
import 'package:drive_flow_ui/admin/Widgets/HeaderDrawer.dart';
import 'package:drive_flow_ui/user/screens/LoginScreen.dart';
import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const HeaderDrawer(),
          SizedBox(
            height: height * 0.04,
          ),
          CustomMenu(
            width: width,
            pathImage: "assets/images/dashboard.png",
            text: "Tableau de bord",
            clicked: (){
              Navigator.pushNamed(context, 'DashboardAdmin');
            },
          ),
          CustomMenu(
            width: width,
            pathImage: "assets/images/home.png",
            text: "Accueil",
            clicked: (){
              Navigator.pushNamed(context, 'HomeScreenAdmin');
            },
          ),
          CustomMenu(
            width: width,
            pathImage: "assets/images/car-rental.png",
            text: "Mes Locations",
            clicked: (){
              Navigator.pushNamed(context, 'CustomRentCars');
            },
          ),
          CustomMenu(
            width: width,
            pathImage: "assets/images/question.png",
            text: "Aide & Support",
          ),
          CustomMenu(
            width: width,
            pathImage: "assets/images/logout.png",
            text: "Déconnexion",
            clicked: (){
              _showLogoutDialog(context);
            },
          ),
        ],
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
