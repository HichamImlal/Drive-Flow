import 'package:drive_flow_ui/user/screens/DetailsAgenceScreen.dart';
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
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(28.9958781, -10.0701584),
          zoom: 17.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(28.9958781, -10.0701584),
          ),
          Marker(
              onTap: () {
                Navigator.pushNamed(context, 'DetailsAgenceScreen');
              },
              markerId: const MarkerId("_Agence Drive Flow"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              position: const LatLng(28.995784, -10.072004)),
        },
      ),
    );
  }
}
