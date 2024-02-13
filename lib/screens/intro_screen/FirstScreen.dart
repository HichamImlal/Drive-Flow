import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/images/image1.png'),
            width: width * 0.95,
          ),
          const Text(
            'Enjoy your trip',
            style: TextStyle(
                fontFamily: 'Poppins_med',
                fontSize: 24,
                color: Color(0xff4489FE)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width * 0.90,
            child: const Text(
              'Lorem ipsum dolor sit amet consectetur. Adipiscing gravida in lacus mollis dignissim aenean. Sagittis vulputate in nam porta. Tellus integer erat elementum senectus.',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xffAFB5BF)),
              textAlign: TextAlign.justify,
            ),
          ),
          
        ],
      ),
    );
  }
}
