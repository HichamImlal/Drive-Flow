import 'package:drive_flow_ui/admin/Widgets/CustomDrawer.dart';
import 'package:drive_flow_ui/admin/Widgets/Header.dart';
import 'package:drive_flow_ui/user/Widgets/CustomListView.dart';
import 'package:flutter/material.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: CustomDrawer(height: height, width: width),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Header(width: width, scaffoldKey: _scaffoldKey,text: "Home",),
            const Expanded(child: CustomListView()),
          ],
        ),
      ),
    );
  }
}
