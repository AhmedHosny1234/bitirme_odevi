import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MyApp1 extends StatefulWidget {

  final double Longitude,Latitude;


     MyApp1 ( { required this.Longitude , required this.Latitude});
  @override
  State createState() => _MyAppState(Longitude: Longitude, Latitude: Latitude,);
}

class _MyAppState extends State<MyApp1> {

   double Longitude,Latitude;
  _MyAppState({required this.Longitude,required this.Latitude});
  late GoogleMapController mapController;





  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    return  SizedBox(

            width: 400,
            height: 250,
            child:
            GoogleMap(

              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(Latitude,Longitude),
                zoom: 14.0,
              ),
              markers: {
                 Marker(
                  markerId: MarkerId('Sydney'),
                  position: LatLng(Latitude,Longitude),
                )
              },
            ),);



  }

}





