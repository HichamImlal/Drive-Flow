import 'package:drive_flow_ui/user/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/user/Widgets/InputButtomSheet.dart';
import 'package:flutter/material.dart';

class ButtomSheet extends StatelessWidget {
  const ButtomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(left: width * 0.05,right: width * 0.05,bottom: MediaQuery.of(context).viewInsets.bottom, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              'pick-up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.009,
            ),
            const InputButtomSheet(
              hint: "Location",
              icon: Icons.location_on,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 6.0),
                    child: InputButtomSheet(
                        hint: "Date", icon: Icons.calendar_month),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 6.0), 
                    child: InputButtomSheet(
                        hint: "Time", icon: Icons.access_time),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              'Drop-of',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.009,
            ),
            const InputButtomSheet(
              hint: "Location",
              icon: Icons.location_on,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 6.0),
                    child: InputButtomSheet(
                        hint: "Date", icon: Icons.calendar_month),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 6.0),
                    child: InputButtomSheet(
                        hint: "Time", icon: Icons.access_time),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Center(child: ButtonCustom(text: "Save", clicked: () {})),
            SizedBox(height: height*0.04,),
          ],
        ),
      ),
    );
  }
}