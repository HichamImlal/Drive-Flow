import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/material.dart';

class InputButtomSheet extends StatefulWidget {
  const InputButtomSheet(
      {super.key,
      this.hint,
      this.icon,
      this.maxLine,
      this.controller,
      this.validator,this.dateController, this.timeController});
  final hint;
  final maxLine;
  final IconData? icon;
  final String? Function(String?)? validator;

  final controller;
   final dateController;
  final timeController ;

  @override
  State<InputButtomSheet> createState() => _InputButtomSheetState();
}

class _InputButtomSheetState extends State<InputButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.hint == "Date"
          ? widget.dateController
          : widget.hint == "Time"
              ? widget.timeController
              : widget.controller,
      validator: widget.validator,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MainColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      readOnly: widget.hint == "Date" || widget.hint == "Time" ? true : false,
      onTap: () {
        if (widget.hint == "Date") {
          _selectDate();
        } else if (widget.hint == "Time") {
          _selectTime();
        }
      },
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picker != null) {
      setState(() {
       widget.dateController.text = _picker.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
       widget.timeController.text = "${timeOfDay.hour}:${timeOfDay.minute}";
      });
    }
  }
}
