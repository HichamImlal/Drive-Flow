import 'package:drive_flow_ui/admin/Widgets/CustomDrawer.dart';
import 'package:drive_flow_ui/admin/Widgets/Header.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(height: height, width: width),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Header(width: width, scaffoldKey: _scaffoldKey,text: "Dashboard",),
        ],
      ),
    );
  }
}
