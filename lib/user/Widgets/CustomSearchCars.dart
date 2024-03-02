import 'package:drive_flow_ui/user/Widgets/ButtomSheet.dart';
import 'package:flutter/material.dart';

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




