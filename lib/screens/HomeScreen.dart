import 'package:drive_flow_ui/Widgets/CustomListView.dart';
import 'package:flutter/material.dart';

import '../Widgets/CustomSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height*0.05,
            ),
            const CustomSearch(),
            const Expanded(child: CustomListView()),
          ],
        ),
      ),
    );
  }
}
