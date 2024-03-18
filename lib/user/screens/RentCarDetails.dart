import 'dart:convert';
import 'dart:typed_data';

import 'package:drive_flow_ui/admin/Widgets/CustomDetails.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/DetailsTimeRent.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RentCarDetails extends StatefulWidget {
  const RentCarDetails({
    super.key,
    required this.image,
    this.mark,
    this.model,
    this.price, this.id_car, this.id_admin,
  });

  final Uint8List image;
  final mark;
  final model;
  final price;
  final id_car;
  final id_admin;

  @override
  State<RentCarDetails> createState() => _RentCarDetailsState();
}

int nb_days = 1;
double total = 0;

class _RentCarDetailsState extends State<RentCarDetails> {
  late TextEditingController start_date_timeController;
  late TextEditingController start_date_Controller;
  late TextEditingController end_date_timeController;
  late TextEditingController end_date_Controller;
  int nb_days = 1;
  double total = 0;

   @override
  void initState() {
    super.initState();
    start_date_Controller = TextEditingController();
    start_date_timeController= TextEditingController();
    end_date_timeController= TextEditingController();
    end_date_Controller = TextEditingController();
    updateTotal();
  }
  Future<void> addRental(String dateIn,String dateOut,double total) async {
  final String apiUrl = "http://${ipAddress}:8080/rentals/addRental";
  final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
  Map<String, dynamic> requestBody = {
    "userId": userData!['id'],
    "carId":widget.id_car,
    "adminId":widget.id_admin,
    "dateIn": dateIn,
    "dateOut": dateOut,
    "rentalPrice": total
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 201) {
      print('Rental added successfully.');
      updateCarAvailability(widget.id_car);
    } else {
      print('Failed to add rental: ${response.statusCode}');
    }
  } catch (error) {
    print('Exception occurred while adding rental: $error');
  }
}
Future<void> updateCarAvailability(int carId) async {
  final String apiUrl = "http://${ipAddress}:8080/cars/updateAvailability?carId=$carId";
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('Car availability updated successfully.');
    } else {
      print('Failed to update car availability: ${response.statusCode}');
    }
  } catch (error) {
    print('Exception occurred while updating car availability: $error');
  }
}
Future<void> addHistory(String dateIn,String dateOut,double total) async {
  String url = 'http://${ipAddress}:8080/history/add';
  final userData =
        Provider.of<UserDataProvider>(context, listen: false)?.userData;
  Map<String, dynamic> historyData = {
    'mark': widget.mark,
    'model': widget.model,
    'userId': userData!['id'],
    'dateIn': dateIn,
    'dateOut': dateOut,
    'carId': widget.id_car,
    'total':total,
  };
  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(historyData),
    );
    if (response.statusCode == 200) {
      print('History added successfully');
    } else {
      print('Failed to add history: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                HeaderSettings(
                  width: width,
                  text: "Détails",
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.2,
                  child: Image.memory(widget.image),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomDetails(
                  mark: widget.mark,
                  model: widget.model,
                  price: widget.price,
                ),
                DetailsTimeRent(
                  dateStartController: start_date_Controller,
                  dateEndController: end_date_Controller,
                  timeStartController: start_date_timeController,
                  timeendController: end_date_timeController,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Column(
                  children: [
                    Text(
                      'Nombre de jours :',
                      style: TextStyle(fontFamily: 'Poppins_med'),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (nb_days > 1) {
                              setState(() {
                                --nb_days;
                                updateTotal();
                              });
                            }
                          },
                          child: Container(
                              width: width * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontFamily: 'Poppins_med', fontSize: 22),
                              ))),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text(
                          "${nb_days}",
                          style: TextStyle(
                              fontFamily: 'Poppins_med', fontSize: 25),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ++nb_days;
                              updateTotal();
                            });
                          },
                          child: Container(
                              width: width * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontFamily: 'Poppins_med', fontSize: 22),
                              ))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total :",
                            style: TextStyle(
                              fontFamily: "Poppins_med",
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            " ${total} MAD",
                            style: TextStyle(
                                fontFamily: "Poppins_med",
                                fontSize: 18,
                                color: MainColor),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          checkAndCallFunction(start_date_Controller.text,end_date_Controller.text);
                        },
                        child: Container(
                          width: width * 0.3,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MainColor),
                          child: Center(
                              child: Text(
                            "Louer",
                            style: TextStyle(
                                fontFamily: "Poppins_med",
                                fontSize: 18,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateTotal() {
    setState(() {
      total = widget.price * nb_days;
    });
  }
  void checkAndCallFunction(String startDateString, String endDateString) {
  if(startDateString=="" || endDateString==""){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Insert champs.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
  }
  DateTime startDate = DateTime.parse(startDateString);
  DateTime endDate = DateTime.parse(endDateString);
  DateTime currentDate = DateTime.now();
  Duration difference = endDate.difference(startDate);
  if(startDate.isBefore(currentDate) && startDate.difference(currentDate).inDays>=0){
     if (difference.inDays >= 1) {
    if(difference.inDays==(total)/widget.price){
      addRental(startDateString, endDateString,total);
      addHistory(startDateString, endDateString,total);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location ajoutée avec succès.'),
        duration: Duration(seconds: 3),
      ));
      Navigator.pushNamed(context, 'SearshScreen');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error en Nombre de jours.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
  } else {
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('The difference between start and end dates must be exactly one day'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
  }
  }else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('La date n\'est pas antérieure à la date actuelle.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
  }
  
}

}
