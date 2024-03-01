import 'package:drive_flow_ui/Widgets/CustomButton.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSearchCars extends StatelessWidget {
  const CustomSearchCars({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context, builder: (context) => const ButtomSheet());
      },
      child: Container(
        width: width * 0.9,
        height: height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: border()),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search here',
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }

  Border border() {
    return const Border(
      bottom: BorderSide(
        width: 0.8,
      ),
      left: BorderSide(
        width: 0.8,
      ),
      right: BorderSide(
        width: 0.8,
      ),
      top: BorderSide(
        width: 0.8,
      ),
    );
  }
}

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
