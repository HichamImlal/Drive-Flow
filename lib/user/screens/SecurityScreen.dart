import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/CustomInput.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/Widgets/TitleInput.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmNewPassword = TextEditingController();
  }

  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmNewPassword;

  Future<void> updateUser() async {
    final String apiUrl = 'http://${ipAddress}:8080/update';
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    var passwordBytes = utf8.encode(_newPassword.text.trim());
    var sha256Hash = sha256.convert(passwordBytes);
    final Map<String, dynamic> requestBody = {
      'id': userData?['id'],
      'username': userData?['username'],
      'email': userData?['email'],
      'password': sha256Hash.toString(),
      'role': false,
    };
     print(requestBody);
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User password updated successfully'),
        duration: Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password remains the same.'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context).userData;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              HeaderSettings(width: width,text: "Edit Password",),
              SizedBox(
                height: height * 0.05,
              ),
              TitleInput(
                width: width,
                text: "Old Password",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                hint: "Old Password",
                controller: _oldPassword,
                validator: (value) {
                  if (value == null || value.length < 9) {
                    return 'Password must be between 0 and 9 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TitleInput(
                width: width,
                text: "New Password",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                hint: "New Password",
                controller: _newPassword,
                validator: (value) {
                  if (value != _confirmNewPassword.text ||
                      value == null ||
                      value.length < 9) {
                    return 'Password must be between 0 and 9 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.012,
              ),
              TitleInput(
                width: width,
                text: "Confirm New Password",
              ),
              SizedBox(
                height: height * 0.003,
              ),
              CustomInput(
                hint: "Confirm New Password",
                controller: _confirmNewPassword,
                validator: (value) {
                  if (value != _newPassword.text ||
                      value == null ||
                      value.length < 9) {
                    return 'Password must be between 0 and 9 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: ButtonCustom(
                text: "Save",
                clicked: () {
                  var passwordBytes = utf8.encode(_oldPassword.text.trim());
                  var sha256Hash = sha256.convert(passwordBytes);
                  if (_formKey.currentState!.validate()) {
                    if (sha256Hash.toString() != userData?['password']) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Old password is incorrect'),
                        duration: Duration(seconds: 3),
                      ));
                    } else {
                      updateUser();
                    }
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
