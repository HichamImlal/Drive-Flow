import 'dart:convert';

import 'package:drive_flow_ui/class/Car.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.isAdmin});
  final bool isAdmin;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<Car> posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void fetchPosts() async {
    final url = Uri.parse('http://${ipAddress}:8080/getAllPosts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        posts = data.map((post) => Car.fromJson(post)).toList();
      });
      print(posts.length);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: posts.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomCard(
                  isAdmin: widget.isAdmin,
                  mark: posts[index].mark,
                  model: posts[index].model,
                  price: posts[index].price,
                  description: posts[index].description,
                ),
              )),
    );
  }
}
