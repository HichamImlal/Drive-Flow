import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final hiegth = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child:  Container(
        height: hiegth*0.065,
        width: hiegth*0.51,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child:   const Row(
          children: [
            SizedBox(width: 5,),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            SizedBox(width: 20,),
            Text('What\'s in your mind ?',style: TextStyle(fontFamily: 'Poppins_med'),),
            Spacer(),
            Image(image: AssetImage('assets/images/addpic.png'),width: 28,),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
