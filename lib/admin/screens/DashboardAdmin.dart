import 'dart:convert';

import 'package:drive_flow_ui/admin/Widgets/CustomAvailableCars.dart';
import 'package:drive_flow_ui/admin/Widgets/CustomDrawer.dart';
import 'package:drive_flow_ui/admin/Widgets/Header.dart';
import 'package:drive_flow_ui/class/Car.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
   List<Car> posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  // void fetchPosts() async {
  //   final url = Uri.parse('http://${ipAddress}:8080/getAllPosts');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     setState(() {
  //       posts = data.map((post) => Car.fromJson(post)).toList();
  //     });
  //   } else {
  //     throw Exception('Failed to load posts');
  //   }
  // }
  void fetchPosts() async {
  final userData = Provider.of<UserDataProvider>(context, listen: false).userData;
  final url = Uri.parse('http://${ipAddress}:8080/getByIdAdmin/${userData!['id'].toString()}');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    setState(() {
      posts = data.map((post) => Car.fromJson(post)).toList();
    });
  } else {
    throw Exception('Failed to load posts');
  }
}
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Header(
              width: width,
              scaffoldKey: _scaffoldKey,
              text: "Tableau de bord",
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child:  Text(
              "Voitures disponibles :",
              style: TextStyle(fontSize: 16, fontFamily: "Poppins_semiBold"),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: .85),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: CustomAvailableCars(
                  id_car: posts[index].id_car,
                  mark: posts[index].mark,
                  model: posts[index].model,
                  price: posts[index].price,
                  description: posts[index].description,
                  image: posts[index].image,
                  isAdmin: true,
                ),
              ),
              itemCount: posts.length,
            ),
          )
        ],
      ),
    );
  }
}

