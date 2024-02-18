import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Increase or decrease spread radius as desired
                  blurRadius: 10, // Increase or decrease blur radius as desired
                  offset: const Offset(0, 10), // Adjust the offset
                ),
              ],
        ),
        child: Column(
          children: [
             SizedBox(
              height: MediaQuery.sizeOf(context).height*0.08,
              child: const ListTile(
                title: Text(
                  'Chevy Camaro',
                  style:
                      TextStyle( fontSize: 20),
                ),
                subtitle: Text(
                  'ECOBOOST',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                ),
                trailing: Icon(Icons.favorite_border),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    '\$50',
                    style: TextStyle(
                        fontSize: 25,
                        color: MainColor),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '/',
                    style: TextStyle(
                        fontSize: 10,
                        color: MainColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Jour',
                      style: TextStyle(
                          fontSize: 12,
                          color: MainColor),
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
                    backgroundImage:
                        AssetImage('assets/images/person.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width -
                          MediaQuery.sizeOf(context).width * 0.3,
                      child: const Text(
                        'A sleek, midnight blue sedan with aerodynamic curves, boasting a powerful hybrid engine and advanced safety features for a smooth .',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 10),
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
}
