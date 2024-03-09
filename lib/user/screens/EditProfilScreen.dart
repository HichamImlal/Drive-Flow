import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:drive_flow_ui/user/controller/ButtomBarMenu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/CustomInput.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/Widgets/TitleInput.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  late TextEditingController _username;
  final _formKey = GlobalKey<FormState>();

 Uint8List? _decodeImage(String? base64String) {
  if (base64String == null || base64String.isEmpty) return null;
  return base64Decode(base64String);
}

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
    _username.text = userData?['username'] ?? '';
    imageData = _decodeImage(userData?['image']);
  }
  Future<void> updateUser() async {
    final String apiUrl = 'http://${ipAddress}:8080/update';
    final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
    final Map<String, dynamic> requestBody = {
      'id': userData?['id'],
      'username': _username.text,
      'email': userData?['email'],
      'password': userData?['password'],
      'role': false,
    };
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200 && _username.text != userData?["username"]) {
      Provider.of<UserDataProvider>(context, listen: false)
          ?.updateUserData(requestBody);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Profile updated successfully'),
        duration: Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username remains the same.'),
        duration: Duration(seconds: 3),
      ));
    }
  }
  Future<void> _updateUserImage(File imageFile) async {
    final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
    if (userData != null) {
      final uri =
          Uri.parse('http://${ipAddress}:8080/updateImage/${userData['id']}');
      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        final updatedImageResponse = await http.get(
            Uri.parse('http://${ipAddress}:8080/getImage/${userData['id']}'));
        if (updatedImageResponse.statusCode == 200) {
          setState(() {
            imageData = updatedImageResponse.bodyBytes;
          });
          userData['image'] = base64Encode(imageData!);
          Provider.of<UserDataProvider>(context, listen: false)
              ?.updateUserData(userData);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Your image updated successfully'),
        duration: Duration(seconds: 3),
      ));
          print('User image updated successfully');
        } else {
          print('Failed to fetch updated image data');
        }
      } else {
        print('User image update failed');
      }
    }
  }

  File? _imageFile;
  Uint8List? imageData;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context)?.userData;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              HeaderSettings(width: width, text: "Edit Profile", isEdit: false),
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                child: Stack(
                  children: [
                    _imageFile == null
                        ? imageData != null
                            ? GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: SizedBox(
                                  height: width * 0.35,
                                  width: width * 0.35,
                                  child: CircleAvatar(
                                    backgroundImage: MemoryImage(imageData!),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          right: width * 0.05,
                                          child: SizedBox(
                                            width: width * 0.08,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/images/circle.png")),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: SizedBox(
                                  height: width * 0.35,
                                  width: width * 0.35,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                              "assets/images/addpic.png"),
                                  ),
                                ),
                              )
                        : SizedBox(
                            height: width * 0.35,
                            width: width * 0.35,
                            child: CircleAvatar(
                              backgroundImage: FileImage(_imageFile!),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: width * 0.05,
                                    child: SizedBox(
                                      width: width * 0.08,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/circle.png")),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TitleInput(
                width: width,
                text: "Username",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                controller: _username,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Username must be between 0 and 9 characters ?';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TitleInput(
                width: width,
                text: "Email",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                valueInit: userData?['email'] ?? '',
                check: false,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  text: "Save",
                  clicked: () {
                    if (_formKey.currentState!.validate()) {
                      updateUser();
                      if (_imageFile != null) {
                        _updateUserImage(_imageFile!);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
