
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';




class api extends StatefulWidget {
  const api({super.key});



  @override

  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
   bool datageldi=true;
  List<dynamic> PH=[];
  late Position position;

  @override
  initState()  {

    _determinePosition();

    fetchusers();


  }

  void _sortProducts() {
    bool ascending=true;
    bool sortAscending = true;
    setState(() {
      sortAscending = ascending;
      PH.sort((a, b) => ascending
          ? a['uzak'].compareTo(b['uzak'])
          : b['uzak'].compareTo(a['uzak']));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Nöbetçi Eczaneleri"),
      ),
        body: datageldi?  Center(child: const SizedBox(width: 100,height: 100,child: CircularProgressIndicator() ,)):
        ListView.builder(
       itemCount: PH.length,

         itemBuilder:(context,index){

          final  ph=PH[index];
           final name=ph['name'];
           final ilac=ph['dist'];



           return ListTile(
             leading: CircleAvatar(child: Text('${index+1}')),
             title:Text(name) ,
             subtitle: Text("$ilac 0${ph['phone']}",style: const TextStyle(fontSize: 15)),
             trailing:  Text("${ph['uzak'].toStringAsFixed(1)} KM ",style: const TextStyle(fontSize: 18)),
            onTap: (){

              _launchURL( PH[index]['loc']);
            },
           );
         }



      ),

      floatingActionButton: FloatingActionButton(onPressed: (){



      },),
    );
  }



  Future<void>  fetchusers() async{

    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final response = await http.get(
      Uri.parse('https://api.collectapi.com/health/dutyPharmacy?ilce=&il=Mersin'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.contentTypeHeader:'application/json',
        HttpHeaders.authorizationHeader: 'apikey 0cFf61NxNpeEL503h6QxXF:2qZL2FNKkBK1HKudkafaHa',
      },
    );
    print("object");
    


    final body=response.body;
    final json=jsonDecode(body);
    setState(() {

       PH=json['result'];
       for (var entry in PH) {
         String coordinates = entry['loc'];
         List<String> coordinatesList = coordinates.split(',');
         double lat2 = double.parse(coordinatesList[0]);
         double lon2 = double.parse(coordinatesList[1]);
         var p = 0.017453292519943295;
         var a = 0.5 - cos((lat2 - position.latitude) * p)/2 +
             cos(position.latitude * p) * cos(lat2 * p) *
                 (1 - cos((lon2 - position.longitude) * p))/2;
         a= 12742 * asin(sqrt(a));
         entry['uzak'] = a;
       }
       _sortProducts();

         datageldi=false;

    });

  }
  void _launchURL(String LOC) async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${LOC}');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }





  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }



}



