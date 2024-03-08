import 'dart:typed_data';
import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';


class CustomAvailableCars extends StatefulWidget {
  const CustomAvailableCars({
    super.key, this.mark, this.model, this.price, this.description, required this.image,
  });
  final mark;
  final model;
  final price;
  final description;
  final Uint8List image;

  @override
  State<CustomAvailableCars> createState() => _CustomAvailableCarsState();
}

class _CustomAvailableCarsState extends State<CustomAvailableCars> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width;
    final height=MediaQuery.sizeOf(context).height;
    return Container(
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
          ListTile(
            title:  Text(
              widget.mark,
              style:  TextStyle(fontSize: 18),
            ),
            subtitle:  Text(
              widget.model,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          Container(
            height: height*0.11,
            child: Image.memory(widget.image),),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                     "${widget.price} MAD",
                    style: TextStyle(fontSize: 18, color: MainColor),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '/',
                    style: TextStyle(fontSize: 10, color: MainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Jour',
                      style: TextStyle(fontSize: 12, color: MainColor),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
