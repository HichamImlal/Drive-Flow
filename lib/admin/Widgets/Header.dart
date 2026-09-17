import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.width,
    required GlobalKey<ScaffoldState> scaffoldKey,
    this.text,
  }) : _scaffoldKey = scaffoldKey, super(key: key);

  final double width;
  final text;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  Future<void> _getImage() async {
    final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
    final url = 'http://${ipAddress}:8080/getImage/${userData!['id']}';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        _imageData = response.bodyBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            widget._scaffoldKey.currentState?.openDrawer();
          },
          child: Image(
            image: const AssetImage("assets/images/menu.png"),
            width: widget.width * 0.065,
          ),
        ),
        Text(
          widget.text,
          style: const TextStyle(fontSize: 25),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "EditProfilScreen");
          },
          child: CircleAvatar(
            backgroundImage: _imageData != null
                ? MemoryImage(_imageData!)
                : AssetImage("assets/images/addpic.png") as ImageProvider<Object>,
          ),
        )
      ],
    );
  }
}
