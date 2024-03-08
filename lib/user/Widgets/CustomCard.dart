import 'package:drive_flow_ui/admin/Widgets/CustomDetails.dart';
import 'package:drive_flow_ui/admin/screens/AddPostAdmin.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final bool isAdmin;
  const CustomCard({
    super.key,
    this.isAdmin = false, this.mark, this.model, this.price, this.description,
  });
  final mark;
  final model;
  final price;
  final description;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDetailsDialog(context);
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
                title:  Text(
                  widget.mark,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle:  Text(
                  widget.model,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
                trailing: widget.isAdmin
                    ? IconButton(
                     onPressed: () {  _showEditDialog(context);},
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: Image(image: AssetImage('assets/images/car1.png')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width -
                          MediaQuery.sizeOf(context).width * 0.3,
                      child:  Text(
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

  bool _isfavorite = true;

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: const AssetImage("assets/images/arrow.png"),
                            width: width * 0.06,
                          ),
                        ),
                        const Text(
                          'Cars details',
                          style: TextStyle(fontSize: 25),
                        ),
                        IconButton(
                          icon: _isfavorite
                              ? const Icon(
                                  Icons.favorite_border,
                                  size: 28,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 28,
                                ),
                          onPressed: () {
                            setState(() {
                              _isfavorite = !_isfavorite;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/logocar.jpg"),
                                radius: 40,
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sport car",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black54),
                                  ),
                                  Text(
                                    "Agadir , Morocco",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black45),
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
                            height: height * 0.03,
                          ),
                          Container(
                            child: const Image(
                              image: AssetImage("assets/images/carimage1.png"),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          CustomDetails(width: width),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      "specification :",
                      style: TextStyle(fontFamily: "Poppins_med"),
                    ),
                   const  Text(
                      'A sleek, midnight blue sedan with aerodynamic curves, boasting a powerful hybrid engine and advanced safety features for a smooth .',
                    ),
                    SizedBox(height: height*0.065,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Price : ",
                              style: TextStyle(fontSize: 18,fontFamily: "Poppins_med"),
                            ),
                            Text(
                              "500 MAD",style: TextStyle(fontSize: 22,color: MainColor),
                            ),
                          ],
                        ),
                        ButtonCustom(clicked: (){},text: "Rent Car",)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return StatefulBuilder(
          builder: (context, setState) {
            return const AddPostAdmin(isInEditPost: true,text: "Edit Post",isEdit: true,);
          },
        );
      },
    );
  }
}

