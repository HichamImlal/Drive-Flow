import 'package:drive_flow_ui/admin/Widgets/HeaderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const HeaderDrawer(),
            SizedBox(
              height: height * 0.04,
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/dashboard.png",
              text: "Dashboard",
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/operation.png",
              text: "Manage Cars",
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/bookmark.png",
              text: "Bookings",
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/customer.png",
              text: "Customers",
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/question.png",
              text: "Help & Support",
            ),
            CustomMenu(
              width: width,
              pathImage: "assets/images/logout.png",
              text: "Logout",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.035,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Image(
                    image: const AssetImage("assets/images/menu.png"),
                    width: width * 0.065,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.215,
              ),
              const Text(
                'Dashboard',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: width * 0.18,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/admin.jpg"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
    required this.width,
    this.pathImage,
    this.text,
  });

  final double width;
  final pathImage;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 0.2)),
      ),
      child: ListTile(
        leading: Image(
          image: AssetImage(pathImage),
          width: text=="Bookings" || text=="Logout" || text =="Customers"?width * 0.055:width * 0.07,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {},
      ),
    );
  }
}
