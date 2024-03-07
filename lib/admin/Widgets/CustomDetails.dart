import 'package:flutter/material.dart';


class CustomDetails extends StatelessWidget {
  const CustomDetails({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.75,
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(10), 
      ),
      child: const Column(
        children: [
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
                  Text("Color :",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "Poppins_med")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dacia", style: TextStyle(fontSize: 16)),
                  Text("G305", style: TextStyle(fontSize: 16)),
                  Text("Blue", style: TextStyle(fontSize: 16)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
