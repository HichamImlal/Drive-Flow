import 'dart:convert';

import 'package:drive_flow_ui/admin/Widgets/CustomRentalCars.dart';
import 'package:drive_flow_ui/class/RentalDetailsDTO.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomRentCars extends StatefulWidget {
  const CustomRentCars({super.key});

  @override
  State<CustomRentCars> createState() => _CustomRentCarsState();
}

class _CustomRentCarsState extends State<CustomRentCars> {
  @override
  void initState() {
  super.initState();
  loadData();
}

  List<RentalDetailsDTO> rentalDetails = [];

  Future<List<RentalDetailsDTO>> fetchRentalDetails() async {
  final response = await http.get(Uri.parse('http://${ipAddress}:8080/rentals/details'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<RentalDetailsDTO> rentalDetailsList = [];
    for (var item in data) {
      rentalDetailsList.add(RentalDetailsDTO.fromJson(item));
    }
    return rentalDetailsList;
  } else {
    throw Exception('Failed to load rental details');
  }
}
void loadData() async {
  try {
    List<RentalDetailsDTO> fetchedDetails = await fetchRentalDetails();
    setState(() {
      rentalDetails = fetchedDetails;
    });
  } catch (e) {
    print('Error: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          HeaderSettings(
            width: width,
            isEdit: false,
            text: "My Rentals",
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
