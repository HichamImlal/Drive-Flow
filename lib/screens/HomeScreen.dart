import 'package:flutter/material.dart';

import '../Widgets/CustomSearch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(
          fontFamily: 'Poppins_med',
        ),),
      ),
      body: const  Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: CustomSearch(),
          )
        ],
      ),
    );
  }
}
