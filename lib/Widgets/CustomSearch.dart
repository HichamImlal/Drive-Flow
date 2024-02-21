import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, this.color=false});
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 50.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search here ...",
          contentPadding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 12),
          filled: true,
          fillColor: color ? Colors.grey[300]?.withOpacity(0.5):Colors.grey[300],
          suffixIcon:const Icon(
            Icons.search,
            size: 28,
          ),
          border: Border(),
          enabledBorder:  Border(),
          focusedBorder: Border() ,
          ) ,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder Border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      );
  }
}
