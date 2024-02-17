
import 'package:drive_flow_ui/Widgets/CustomListView.dart';
import 'package:drive_flow_ui/Widgets/Header.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(text: 'Home'),
            const SizedBox(
              height: 20,
            ),
            const CustomSearch(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
             const Expanded(child:  CustomListView()),
          ],
        ),
      ),
    );
  }
}

