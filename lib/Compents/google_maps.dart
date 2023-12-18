import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.795037,34.626539);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(

            width: 400,
            height: 250,
            child:
            GoogleMap(

              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('Sydney'),
                  position: LatLng(36.795037,34.626539),
                )
              },
            ),);



  }

}





