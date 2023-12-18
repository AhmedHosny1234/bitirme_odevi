
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';




class api extends StatefulWidget {


  @override

  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  List<dynamic> PH=[];


  initState()  {
    fetchusers();

  }

  void _sortProducts() {
    bool ascending=true;
    bool _sortAscending = true;
    setState(() {
      _sortAscending = ascending;
      PH.sort((a, b) => ascending
          ? a['uzak'].compareTo(b['uzak'])
          : b['uzak'].compareTo(a['uzak']));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Api"),
      ),
        body:ListView.builder(
       itemCount: PH.length,

         itemBuilder:(context,index){

          final  ph=PH[index];
           final name=ph['name'];
           final ilac=ph['dist'];



           return ListTile(
             leading: CircleAvatar(child: Text('${index+1}')),
             title:Text(name) ,
             subtitle: Text("${ilac} 0${ph['phone']}",style: TextStyle(fontSize: 15)),
             trailing:  Text("${ph['uzak'].toStringAsFixed(3)} KM ",style: TextStyle(fontSize: 18)),

           );
         }



      ),

      floatingActionButton: FloatingActionButton(onPressed: (){

        _launchURL();
      },),
    );
  }



  Future<void>  fetchusers() async{



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
       PH.forEach((entry) {
         String coordinates = entry['loc'];
         List<String> coordinatesList = coordinates.split(',');
         double lat2 = double.parse(coordinatesList[0]);
         double lon2 = double.parse(coordinatesList[1]);
         var p = 0.017453292519943295;
         var a = 0.5 - cos((lat2 - 36.7755264) * p)/2 +
             cos(36.7755264 * p) * cos(lat2 * p) *
                 (1 - cos((lon2 - 34.537472) * p))/2;
         a= 12742 * asin(sqrt(a));
         entry['uzak'] = a;
       });
       _sortProducts();
    });

  }

}


void _launchURL() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
