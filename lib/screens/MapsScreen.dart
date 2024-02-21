import 'package:drive_flow_ui/Widgets/CustomSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          initialCameraPosition:  const CameraPosition(
            target: LatLng(34.0209, -6.8416), // San Francisco coordinates
            zoom: 12.0,
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: height*0.05,left: 15,right: 15),
          child: const CustomSearch(color: true,)),
        ],
       
      ),
    );
  }
}
