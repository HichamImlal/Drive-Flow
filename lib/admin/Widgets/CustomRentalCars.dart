import 'dart:convert';
import 'dart:typed_data';

import 'package:drive_flow_ui/class/RentalDetailsDTO.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomRentalCars extends StatefulWidget {
  const CustomRentalCars({
    super.key,
    required this.width,
    required this.height,
    required this.rentalDetails,
  });

  final double width;
  final double height;
  final RentalDetailsDTO rentalDetails;

  @override
  State<CustomRentalCars> createState() => _CustomRentalCarsState();
}

class _CustomRentalCarsState extends State<CustomRentalCars> {
  @override
  Widget build(BuildContext context) {
    String mark = widget.rentalDetails.mark;
    String model = widget.rentalDetails.model;
    String email = widget.rentalDetails.email;
    double totalPrice = widget.rentalDetails.totalPrice;
    String dateIn = widget.rentalDetails.dateIn;
    String dateOut = widget.rentalDetails.dateOut;
    String dateTimeString = dateIn;
    DateTime dateTime = DateTime.parse(dateTimeString);
    String _dateIn =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
        DateTime _dateTime = DateTime.parse(dateTimeString);
    String _dateOut =
        "${dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    Uint8List? imageBytes = base64Decode(widget.rentalDetails.image);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.width * 0.03, vertical: widget.height * 0.003),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.02),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    height: widget.height * 0.13,
                    child: Image(
                      image: MemoryImage(imageBytes!),
                    ),
                  ),
                  SizedBox(
                    width: widget.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${totalPrice} MAD",
                        style: TextStyle(fontSize: 18, color: MainColor),
                      ),
                      Text(
                        "${mark} ${model}",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "${email}",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      SizedBox(
                        height: widget.height * 0.004,
                      ),
                      Text(
                        "${_dateIn.toString()} / ${_dateOut.toString()}",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
