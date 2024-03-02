import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';



class InputButtomSheet extends StatelessWidget {
  const InputButtomSheet({super.key, this.hint, required this.icon});
  final hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MainColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}