import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage('assets/images/image1.png'),
          width: width * 0.95,
        ),
        const Text(
          'Profitez bien de votre voyage',
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff4489FE)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: width * 0.85,
          child: const Text(
            "Cette phrase capture l'essence de l'aventure et de la détente, offrant de bons vœux pour un voyage mémorable à venir. Dans le contexte de la location de voitures.",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color(0xffAFB5BF)),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
