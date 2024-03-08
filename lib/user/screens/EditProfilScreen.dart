import 'dart:convert';

import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/CustomInput.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/Widgets/TitleInput.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  late TextEditingController _username;
  final _formKey = GlobalKey<FormState>();

  Future<void> updateUser() async {
    final String apiUrl = 'http://${ipAddress}:8080/update';
    final userData =
    Provider.of<UserDataProvider>(context, listen: false).userData;
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
          .updateUserData(requestBody);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User updated successfully'),
        duration: Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username remains the same.'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    _username = TextEditingController(text: userData?['username']);
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context).userData;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    _username = TextEditingController(text: userData?["username"]);
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
              HeaderSettings(width: width,text: "Edit Profile",isEdit: false,),
              SizedBox(
                height: height * 0.1,
              ),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: width * 0.35,
                      width: width * 0.35,
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/person1.jpg"),
                      ),
                    ),
                    Positioned(
                        right: width * 0.03,
                        bottom: 0,
                        child: Image(
                          image: const AssetImage("assets/images/circle.png"),
                          width: width * 0.08,
                        ))
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
                text: "email",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                valueInit: userData?['email'],
                check: false,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: ButtonCustom(
                    isPost: true,
                text: "Save",
                clicked: () {
                  if (_formKey.currentState!.validate()) {
                    updateUser();
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
