import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';

class InputButtomSheet extends StatelessWidget {
  const InputButtomSheet(
      {super.key,
      this.hint,
      this.icon,
      this.maxLine,
      this.controller,
      this.validator});
  final hint;
  final maxLine;
  final IconData? icon;
  final String? Function(String?)? validator;
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
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
