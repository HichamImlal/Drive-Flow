import 'package:drive_flow_ui/Widgets/CustomCard.dart';
import 'package:flutter/material.dart';


class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 16.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: CustomCard(),
              )),
    );
  }
}
