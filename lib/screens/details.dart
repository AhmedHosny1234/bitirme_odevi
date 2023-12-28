import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Compents/google_maps.dart';

class details extends StatelessWidget {

  QueryDocumentSnapshot Muze;
   details({
    required this.Muze
});



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
          leading: IconButton(
            icon:const Icon(Icons.arrow_back
              ,color: Colors.white,
              size: 30,) ,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xFF0C2E51),
          title:
             Center(child: Text("${Muze['Name']}",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
          actions:  [

            IconButton(onPressed: () {
              Share.share('${Muze['Name']} https://www.google.com/maps/search/?api=1&query=${Muze['Latitude']},${Muze['Longitude']}', subject: 'Look what I made!');

              print("object");

            }, icon:  Icon(Icons.share,color: Colors.white, size: 30,)

            ),
            SizedBox(width: 10,),
          ],
      ),
          
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Container(

               margin: const EdgeInsets.only(top: 20,left: 20),
              width: 80, height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(7.0),),
              ),
              child:  Row(

                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.remove_red_eye_sharp),
                  SizedBox(width: 7,),
                  Text("${Muze['count']}",style: TextStyle(fontSize: 17),)
                ],
              ),
            ),

            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                       Text("${Muze['Name']} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              "${Muze['Aciklama']}",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                        ],
                      ),




                    ],
                  ),

                  Container(
                   alignment: Alignment.centerRight,
                    margin: const EdgeInsets.all(10.0),
                      child:  Image(image: NetworkImage("${Muze['ResimURL ']}"),width: 120,height: 150,)),

                ],

              ),
            ),
              Divider(

              ),
            if(Muze['dates'])
            getList(),


            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  InkWell(
                    onTap: (){
                      final Uri url = Uri.parse(Muze['link']);

                      launchUrl(url);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.black26),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Icon(FontAwesomeIcons.globe,size: 45,color: Colors.black,),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.green.shade200),
                          borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Icon(FontAwesomeIcons.whatsapp,size: 45,color: Colors.green,),
                    ),
                  ),
                  
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
    decoration: BoxDecoration(
    border: Border.all(width: 2.0,color: Colors.lightBlue.shade200),
    borderRadius: const BorderRadius.all(Radius.circular(30))
    ),
                    child: const Icon(Icons.phone,size: 45,color: Colors.blue,),
                  ),
                ],
              ),

            ),
            Divider(

            ),
              const Text("Konum",style: TextStyle(fontSize: 25),),
             Text("${Muze['Adres']}",style: TextStyle(fontSize: 18), ),
            Divider(

            ),
             Container(
                 alignment: Alignment.center,
                 child: MyApp1(Longitude: Muze['Longitude'], Latitude: Muze['Latitude'],))
            



          ],
    ),
       ),


    );
  }

Widget  getList(){
      return   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Bilet fiyati : ${Muze['price']} ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  if(Muze['price']!='ÜCRETSİZ ')
                    Text("₺",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                ],
              )

          ),
          Divider(

          ),
          Container(

              padding: EdgeInsets.only(left: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Açılış/Kapanış Saatleri: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  Text("Açılış Saati: ${Muze['open']}"),
                  Text("Kapanış Saati: ${Muze['close']}"),
                  Text("Gişe Kapanış Saati: ${Muze['gate']}")
                ],
              )

          ),
        ],
      );
  }
}

