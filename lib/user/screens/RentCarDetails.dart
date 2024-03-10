import 'dart:typed_data';

import 'package:drive_flow_ui/admin/Widgets/CustomDetails.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/DetailsTimeRent.dart';
import 'package:drive_flow_ui/user/Widgets/HeaderSettings.dart';
import 'package:flutter/material.dart';

class RentCarDetails extends StatefulWidget {
  const RentCarDetails({
    super.key,
    required this.image,
    this.mark,
    this.model,
    this.price,
  });

  final Uint8List image;
  final mark;
  final model;
  final price;

  @override
  State<RentCarDetails> createState() => _RentCarDetailsState();
}

int nb_days = 1;
double total = 0;

class _RentCarDetailsState extends State<RentCarDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    updateTotal();
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
                  isEdit: false,
                  width: width,
                  text: "Rent Details",
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
                DetailsTimeRent(),
                SizedBox(
                  height: height * 0.04,
                ),
                Column(
                  children: [
                    Text(
                      'Number of Days :',
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
                          style:
                              TextStyle(fontFamily: 'Poppins_med', fontSize: 25),
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
            SizedBox(height: height*0.08,),
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
                                fontSize: 22,),
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
                      Container(
                        width: width * 0.3,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MainColor
                        ),
                        child: Center(
                            child: Text(
                          "Rent",
                          style: TextStyle(
                              fontFamily: "Poppins_med",
                              fontSize: 18,
                              color: Colors.white),
                        )),
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
}
