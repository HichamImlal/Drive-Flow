import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  CustomInput(
      {super.key,
      this.hint,
      this.controller,
      this.validator,
      this.valueInit,
      this.check});
  final hint;
  final check;
  final String? valueInit;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

bool ispasswordvisible = true;

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        enabled: widget.check,
        initialValue: widget.valueInit,
        style: const TextStyle(fontFamily: 'Poppins', fontSize: 14.5),
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 18, bottom: 18, left: 10),
          filled: true,
          fillColor: const Color.fromRGBO(224, 224, 224, 1),
          suffixIcon: IconButton(
              icon: widget.hint == 'Password' ||
                      widget.hint == 'Confirm Password' ||
                      widget.hint == 'Old Password' ||
                      widget.hint == 'New Password' ||
                      widget.hint == 'Confirm New Password'
                  ?
                  // ignore: dead_code
                  ispasswordvisible
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      // ignore: dead_code
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                  : const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(224, 224, 224, 1),
                    ),
              onPressed: () => setState(
                    () => ispasswordvisible = !ispasswordvisible,
                  )),
          hoverColor: Colors.grey,
          counterStyle: const TextStyle(color: Colors.blue),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontFamily: 'Poppins'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MainColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        obscureText: ispasswordvisible &&
            (widget.hint == 'Password' ||
                widget.hint == 'Confirm Password' ||
                widget.hint == 'Old Password' ||
                widget.hint == 'New Password' ||
                widget.hint == 'Confirm New Password'),
      ),
    );
  }
}
