
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Hava extends StatefulWidget {
  const Hava({super.key});



  @override

  State<Hava> createState() => HavaState();
}

class HavaState extends State<Hava> {

  List<dynamic> HD = [];
  String il = "";
  bool error=false;
  String errormasege="";
  @override
  initState() {
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFF629BF2),


      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Hava durumu", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF629BF2),
      ),

      body: HD.isEmpty?  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(width: 100,height: 100,child: CircularProgressIndicator() ,),
          error?  AlertDialog(

            title: Text(errormasege ,style: const TextStyle(fontSize: 21),),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context,"ok");
              }, child: const Text("OK"))
            ],
          ):const Text("")
        ],
      )):
      SingleChildScrollView(
        child:
        Column(
          children: [
            Text(il, style: const TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            const Text("Bugün Hava Durumu",
              style: TextStyle(fontSize: 14, color: Colors.white),),
            SizedBox(
              height: 210,
              width: 240,
              child: Stack(
                children: [

                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.network(
                      HD[0]['icon'],
                      scale: 3,),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text("${HD[0]['degree'].substring(0, 4)}°",
                      style: const TextStyle(fontSize: 85,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                  ),

                ],

              ),
            ),

            Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Beklenen Hadise : ${HD[0]['description']}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),),
                    Text("Nem (%)	 : ${HD[0]['humidity']}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),),
                    Text("En Düşük	 : ${HD[0]['min']}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),),
                    Text("En Yüksek	 : ${HD[0]['max']} °C.",
                      style: const TextStyle(color: Colors.white, fontSize: 18),),
                  ],),
                const SizedBox(width: 85,),
                Container(

                  child: Column(
                    children: [
                      Container(


                          child: const Icon(
                            Icons.nights_stay_sharp, size: 65, color: Colors
                              .white,)
                      ),
                      Container(

                        child: Text("${HD[0]['night'].substring(0, 4)}°C",
                          style: const TextStyle(fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                      ),
                    ],),
                )

              ],),
            ),

            Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Text("Gelcek Günler", style: TextStyle(fontSize: 21),),),
            SizedBox(
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
                        style: const TextStyle(color: Colors.white, fontSize: 20),),
                      subtitle: Text(HD[index]['description'],
                        style: const TextStyle(color: Colors.white),),
                      trailing: Column(
                        children: [

                          Text("${HD[index]['degree'].substring(0, 4)}°",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 23),),
                          Text(
                            "Nem : ${HD[index]['humidity']}%", style: const TextStyle(
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

