import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  CustomInput({super.key, required this.hint});
  String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        style: const TextStyle(fontFamily: 'Poppins', fontSize: 14.5),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          hoverColor: Colors.grey,
          counterStyle: const TextStyle(color: Colors.blue),
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Poppins'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        obscureText:
            hint == 'Password' || hint == 'Confirm Password' ? true : false,
      ),
    );
  }
}
