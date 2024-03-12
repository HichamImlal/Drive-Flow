import 'dart:convert';
import 'dart:typed_data';
import 'package:drive_flow_ui/class/Car.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomCard.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key,  this.isAdmin=true});
  final bool isAdmin;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
   Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    _getImage();
    widget.isAdmin?fetchPosts():fetchPostsUsers();
  }

  Future<void> _getImage() async {
    final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
    final url = 'http://${ipAddress}:8080/getImage/${userData!['id']}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        imageData = response.bodyBytes;
      });
    }
  }
  List<Car> posts = [];
  void fetchPostsUsers() async {
    final url = Uri.parse('http://${ipAddress}:8080/getAllPosts');
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
  void fetchPosts() async {
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    final url = Uri.parse(
        'http://${ipAddress}:8080/getByIdAdmin/${userData!['id'].toString()}');
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: posts.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomCard(
                  isAdmin: widget.isAdmin,
                  id_car: posts[index].id_car,
                  mark: posts[index].mark,
                  model: posts[index].model,
                  price: posts[index].price,
                  description: posts[index].description,
                  image: posts[index].image,
                  imageData: imageData,
                ),
              )),
    );
  }
}
