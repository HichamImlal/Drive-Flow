import 'dart:convert';
import 'dart:typed_data';
import 'package:drive_flow_ui/class/Car.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomCard.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key, this.isAdmin = true}) : super(key: key);
  final bool isAdmin;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  Uint8List? imageData;
  late List<Car> filteredPosts;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _getImage();
    widget.isAdmin ? fetchPosts() : fetchPostsUsers();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    filteredPosts = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _getImage() async {
    final url = 'http://${ipAddress}:8080/getImage/2';
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
        filteredPosts = List.from(posts);
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
        filteredPosts = List.from(posts);
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredPosts = posts.where((post) {
        final mark = post.mark.toLowerCase();
        final model = post.model.toLowerCase();
        return mark.contains(query) || model.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'recherche',
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Marque ou Modèle...',
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredPosts.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomCard(
                  isAdmin: widget.isAdmin,
                  id_car: filteredPosts[index].id_car,
                  mark: filteredPosts[index].mark,
                  model: filteredPosts[index].model,
                  price: filteredPosts[index].price,
                  description: filteredPosts[index].description,
                  image: filteredPosts[index].image,
                  imageData: imageData,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
