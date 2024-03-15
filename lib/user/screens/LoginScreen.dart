import 'dart:convert';

import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';
import '../Widgets/CustomLogin.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    fetchRentalIds();
  }
  List<int> ids = [];

  Future <void> fetchRentalIds() async {
  try {
    final response = await http.get(Uri.parse("http://${ipAddress}:8080/rentals/getAllRentalIds"));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<int> rentalIds = data.cast<int>();
      setState(() {
          ids=rentalIds;
        });
    } else {
      throw Exception('Failed to load rental IDs');
    }
  } catch (error) {
    throw Exception('Failed to load rental IDs: $error');
  }
}
Future<void> checkAndUpdateCarAvailability(int rentalId) async {
  try {
    final response = await http.put(
      Uri.parse("http://${ipAddress}:8080/rentals/checkAndUpdateCarAvailability/$rentalId"),
    );
    if (response.statusCode == 200) {
      print('Car availability updated successfully.');
    } else {
      print('Failed to update car availability. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
  @override
  Widget build(BuildContext context) {
    for(int i =0;i<ids.length;i++){
      checkAndUpdateCarAvailability(ids[i]);
    }
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -height * 0.45,
            child: Transform.rotate(
              angle: 21,
              child: Container(
                height: height*1.07,
                width: height*1.07,
                decoration:  BoxDecoration(color: MainColor),
              ),
            ),
          ),
         const  LoginCustom(),
        ],
      ),
    );
  }
}





