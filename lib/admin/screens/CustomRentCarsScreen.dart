import 'dart:convert';

import 'package:drive_flow_ui/admin/Widgets/CustomDrawer.dart';
import 'package:drive_flow_ui/admin/Widgets/CustomRentalCars.dart';
import 'package:drive_flow_ui/admin/Widgets/Header.dart';
import 'package:drive_flow_ui/class/RentalDetailsDTO.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CustomRentCars extends StatefulWidget {
  const CustomRentCars({super.key});

  @override
  State<CustomRentCars> createState() => _CustomRentCarsState();
}

class _CustomRentCarsState extends State<CustomRentCars> {

  List<RentalDetailsDTO> rentalDetails = [];

 @override
  void initState() {
    super.initState();
    getAllRentalDetails();
  }
  Future<void> getAllRentalDetails() async {
    try {
      final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
      final response = await http.get(Uri.parse('http://${ipAddress}:8080/rentals/details?adminId=${userData!['id'].toString()}'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<RentalDetailsDTO> rentalDetailsList = jsonResponse.map((item) => RentalDetailsDTO.fromJson(item)).toList();
        setState(() {
          rentalDetails = rentalDetailsList;
        });
      } else {
        print('Failed to load rental details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching rental details: $e');
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
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Header(width: width, scaffoldKey: _scaffoldKey,text: "Mes locations",),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: rentalDetails.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: CustomRentalCars(width: width, height: height,rentalDetails: rentalDetails[index],),
                )),
          ),
        ],
      ),
    );
  }
}
