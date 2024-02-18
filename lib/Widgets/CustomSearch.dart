import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search here ...",
        filled: true,
        fillColor: Colors.grey[300],
        suffixIcon:const Icon(
          Icons.search,
          size: 28,
        ),
        border: Border(),
        enabledBorder:  Border(),
        focusedBorder: Border() ,
        ) ,
    );
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder Border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  const BorderSide(
          color: Colors.white,
        ),
      );
  }
}
