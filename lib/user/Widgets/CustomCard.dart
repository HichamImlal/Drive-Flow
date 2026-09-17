import 'dart:typed_data';
import 'package:drive_flow_ui/admin/screens/AddPostAdmin.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/ButtomSheetCarDetails.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final bool isAdmin;
  const CustomCard({
    super.key,
    this.isAdmin = false,
    this.mark,
    this.model,
    this.price,
    this.description,
    required this.image,
    this.imageData, this.id_car,
  });
  final mark;
  final model;
  final price;
  final id_car;
  final description;
  final Uint8List image;
  final Uint8List? imageData;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        widget.isAdmin ? () {} :
        showModalBottomSheet(
            context: context, builder: (context) => ButtomSheetCarDetails(height: height, widget: widget));
      },
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
              height: MediaQuery.sizeOf(context).height * 0.08,
              child: ListTile(
                title: Text(
                  widget.mark,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  widget.model,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
                trailing: widget.isAdmin
                    ? IconButton(
                        onPressed: () {
                          _showEditDialog(context);
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      )
                    : IconButton(
                        icon: _isFavorite
                            ? const Icon(Icons.favorite_border)
                            // ignore: dead_code
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    "${widget.price} MAD",
                    style: TextStyle(fontSize: 25, color: MainColor),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Container(
                  height: height * 0.2, child: Image.memory(widget.image)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: widget.imageData == null
                        ? AssetImage("assets/images/addpic.png")
                            as ImageProvider<Object>
                        : MemoryImage(widget.imageData!),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width -
                          MediaQuery.sizeOf(context).width * 0.3,
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }


  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return  AddPostAdmin(
              isInEditPost: true,
              text: "Modifier la voiture",
              isEdit: true,
              idCar:widget.id_car,
            );
          },
        );
      },
    );
  }
}

