import 'dart:convert';

import 'package:drive_flow_ui/admin/Widgets/CustomAvailableCars.dart';
import 'package:drive_flow_ui/admin/Widgets/CustomDrawer.dart';
import 'package:drive_flow_ui/class/Car.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsAgenceScreen extends StatefulWidget {
  const DetailsAgenceScreen({super.key});

  @override
  State<DetailsAgenceScreen> createState() => _DetailsAgenceScreenState();
}

class _DetailsAgenceScreenState extends State<DetailsAgenceScreen> {
   List<Car> posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }
  void fetchPosts() async {
  final url = Uri.parse('http://${ipAddress}:8080/getByIdAdmin/2');
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          HeaderSettings(width: width,text: "Drive Flow",),
          SizedBox(
            height: height * 0.02,
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
                  mark: posts[index].mark,
                  model: posts[index].model,
                  price: posts[index].price,
                  description: posts[index].description,
                  image: posts[index].image,
                  id_car: posts[index].id_car,
                  id_admin: posts[index].id_admin,
                  isAdmin: false,
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

