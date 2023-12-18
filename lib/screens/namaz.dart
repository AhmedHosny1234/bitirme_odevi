
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class namaz extends StatefulWidget {




  @override

  State<namaz> createState() => namazState();
}

class namazState extends State<namaz> {

  List<dynamic> NV=[];

  List<dynamic> NVimges=[

    "images/6599957.png",
    "images/3951777.png",
    "images/1150199.png",
    "images/4067469.png",
    "images/3951784.png",
    "images/8507192.png",
  ];
  @override
  initState()  {
       fetchusers();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("Namaz Vakitleri"),
      ),
      body:Column(
        children: [
          Container(
            child: Image(image: AssetImage("images/d4f7a4ffa1f8089eaa81b2f00a9e4e34.jpg" ,)
              ,height: 180,fit: BoxFit.fill,),

          ),
          SizedBox(height:40,),
          Expanded(

            child: ListView.builder(
                itemCount: NV.length,
                itemBuilder:(context,index){
                  return ListTile(
                    leading: CircleAvatar(child: Image(image: AssetImage( NVimges[index]),)),
                    title:Text(NV[index]['vakit'],style: TextStyle(fontSize: 24),) ,
                    trailing: Text(NV[index]['saat'],style: TextStyle(fontSize: 18)),

                  );
                }

            ),
          ),
        ],
      ),

    );;
  }



 void fetchusers() async{
    final response = await http.get(
      Uri.parse('https://api.collectapi.com/pray/all?data.city=istanbul'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.contentTypeHeader:'application/json',
        HttpHeaders.authorizationHeader: 'apikey 0cFf61NxNpeEL503h6QxXF:2qZL2FNKkBK1HKudkafaHa',
      },
    );

    final body=response.body;
    final json=jsonDecode(body);
    setState(() {
      NV=json['result'];
    });

  }

}


