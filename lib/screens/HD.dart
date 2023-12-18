
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Hava extends StatefulWidget {


  @override

  State<Hava> createState() => HavaState();
}

class HavaState extends State<Hava> {

  List<dynamic> HD = [];
  String il = "";
  bool error=false;
  String errormasege="";
  initState() {
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF629BF2),


      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Hava durumu", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF629BF2),
      ),

      body: HD.isEmpty?  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(child: CircularProgressIndicator() , width: 100,height: 100,),
          error?  AlertDialog(

            title: Text(errormasege ,style: TextStyle(fontSize: 21),),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context,"ok");
              }, child: Text("OK"))
            ],
          ):Text("")
        ],
      )):
      SingleChildScrollView(
        child:
        Column(
          children: [
            Text(il, style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            Text("Bugün Hava Durumu",
              style: TextStyle(fontSize: 14, color: Colors.white),),
            Container(
              height: 210,
              width: 240,
              child: Stack(
                children: [

                  Container(
                    child: Image.network(
                      HD[0]['icon'],
                      scale: 3,),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text("${HD[0]['degree'].substring(0, 4)}°",
                      style: TextStyle(fontSize: 85,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                  ),

                ],

              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Beklenen Hadise : ${HD[0]['description']}",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                    Text("Nem (%)	 : ${HD[0]['humidity']}",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                    Text("En Düşük	 : ${HD[0]['min']}",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                    Text("En Yüksek	 : ${HD[0]['max']} °C.",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],),
                SizedBox(width: 85,),
                Container(

                  child: Column(
                    children: [
                      Container(


                          child: Icon(
                            Icons.nights_stay_sharp, size: 65, color: Colors
                              .white,)
                      ),
                      Container(

                        child: Text("${HD[0]['night'].substring(0, 4)}°C",
                          style: TextStyle(fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                      ),
                    ],),
                )

              ],),
            ),

            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Text("Gelcek Günler", style: TextStyle(fontSize: 21),),),
            Container(
              width: double.infinity,
              height: 400,
              child: ListView.builder(
                  itemCount: HD.length,

                  itemBuilder: (context, index) {
                    if (index < HD.length - 1) {
                      index += 1;
                    }
                    final ph = HD[index];


                    return ListTile(
                      leading: CircleAvatar(child: Image.network(
                        HD[index]['icon'],)),


                      title: Text(HD[index]['day'],
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      subtitle: Text(HD[index]['description'],
                        style: TextStyle(color: Colors.white),),
                      trailing: Column(
                        children: [

                          Text("${HD[index]['degree'].substring(0, 4)}°",
                            style: TextStyle(
                                color: Colors.white, fontSize: 23),),
                          Text(
                            "Nem : ${HD[index]['humidity']}%", style: TextStyle(
                              color: Colors.white, fontSize: 15),),

                        ],
                      ),

                    );
                  }

              ),
            ),
          ],
        ),
      ),

    );
  }


  Future<void> fetchusers() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=mersin'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
         HttpHeaders.authorizationHeader: 'apikey 0cFf61NxNpeEL503h6QxXF:2qZL2FNKkBK1HKudkafaHa',
        },
      );
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        HD = json['result'];
        il = json['city'].toUpperCase();

      });
    } on Exception catch (e) {
        setState(() {

          error=true;
          errormasege=e.toString();
        });
    }
  }
}

