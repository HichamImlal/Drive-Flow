import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/images/image2.png'),
            width: width * 0.95,
          ),
          const Text(
            'Choose your destination',
            style: TextStyle(
                fontFamily: 'Poppins_med',
                fontSize: 24,
                color: Color(0xff4489FE)),
          ),
          const SizedBox(height: 20,),
           SizedBox(
            width: width*0.90,
             child:const Text(
              'Lorem ipsum dolor sit amet consectetur. Adipiscing gravida in lacus mollis dignissim aenean. Sagittis vulputate in nam porta. Tellus integer erat elementum senectus.',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xffAFB5BF)),textAlign: TextAlign.justify,
                     ),
           ),
           SizedBox(height: width*0.12,),
           GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'LoginScreen'),
             child: Container(
              width: width * 0.5,
              height: width * 0.12,
              decoration: BoxDecoration(
                color: const Color(0xff1877C5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
                       ),
           ),
        ],
      ),
    );
  }
}
