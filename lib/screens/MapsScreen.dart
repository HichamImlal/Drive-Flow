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
            target: LatLng(28.9958781,-10.0701584), 
            zoom: 17.0,
          ),
          markers: {
               const  Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(28.9958781,-10.0701584),
                ),
                 Marker(
                  onTap: (){
                    print('hello');
                  },
                    markerId: const MarkerId("_Agence Drive Flow"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                    position: const LatLng(28.995784, -10.072004)),
              },
        ),
         Padding(
          padding: EdgeInsets.only(top: height*0.05,left: 15,right: 15),
          child: const CustomSearch()),
        ],
      ),
    );
  }
}
