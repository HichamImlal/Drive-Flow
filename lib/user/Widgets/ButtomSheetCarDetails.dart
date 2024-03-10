import 'package:drive_flow_ui/admin/Widgets/CustomDetails.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/CustomCard.dart';
import 'package:drive_flow_ui/user/screens/RentCarDetails.dart';
import 'package:flutter/material.dart';

class ButtomSheetCarDetails extends StatelessWidget {
  const ButtomSheetCarDetails({
    super.key,
    required this.height,
    required this.widget,
  });

  final double height;
  final CustomCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/logocar.jpg"),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.description,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          Text(
                            "Agadir , Morocco",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: 0.8,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: height * 0.015,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Price : ",
                        style:
                            TextStyle(fontSize: 18, fontFamily: "Poppins_med"),
                      ),
                      Text(
                        "${widget.price} MAD",
                        style: TextStyle(fontSize: 20, color: MainColor),
                      ),
                    ],
                  ),
                  ButtonCustom(
                    clicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RentCarDetails(
                          image: widget.image,
                          mark: widget.mark,
                          model: widget.model,
                          price: widget.price,
                        ),
                      ));
                    },
                    text: "Rent Car",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
