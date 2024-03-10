import 'package:flutter/material.dart';


class CustomDetails extends StatelessWidget {
  const CustomDetails({
    super.key, this.mark, this.model, this.price,
  });

  final mark;
  final model;
  final price;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(10), 
      ),
      child:  Column(
        children: [
          SizedBox(height: height*0.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mark :",
                    style: TextStyle(fontSize: 16, fontFamily: "Poppins_med"),
                  ),
                  Text("Model :",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "Poppins_med")),
                  Text("Price :",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "Poppins_med")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mark, style: TextStyle(fontSize: 16)),
                  Text(model, style: TextStyle(fontSize: 16)),
                  Text("${price} MAD", style: TextStyle(fontSize: 16)),
                ],
              )
            ],
          ),
          SizedBox(height: height*0.015,),
        ],
      ),
    );
  }
}
