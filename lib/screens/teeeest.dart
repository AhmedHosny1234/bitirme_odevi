import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import 'details.dart';

class GetList extends StatelessWidget {

  String type;


  GetList({
    required this.type
});
   late CollectionReference Muze=FirebaseFirestore.instance.collection('Mersin').doc('catgory').collection('${type}');
  @override
  Widget build(BuildContext context) {



    return FutureBuilder<QuerySnapshot>(
      future:Muze.get() ,
        builder: (context,snapshot){

         if(snapshot.hasData){

           return Scaffold(
             appBar: AppBar(
                 leading: IconButton(
                   icon:const Icon(Icons.arrow_back
                     ,color: Colors.white,) ,
                   onPressed: () {
                     Navigator.pop(context);
                   },
                 ),
                 backgroundColor: const Color(0xFF0C2E51),
                 title:  Column(children: [
                   Center(child: Text("Müzler",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                   Center(child: Text("Sayi ${snapshot.data!.docs.length}",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),

                 ],)
             ),
             body: ListView.builder(
                 itemCount:  snapshot.data!.docs.length,
                 itemBuilder: (context,num){

                   return  GestureDetector(

                     child: Column(
                       children: [
                         const SizedBox(height: 5,),
                         Container(

                           decoration: BoxDecoration(
                               border: Border.all(color: Colors.blueAccent)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                    Text("${snapshot.data!.docs[num]['Name']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                                   ),),
                                   const SizedBox(height: 10,),
                                    Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       SizedBox(
                                           width: 240,
                                           child: Text("${snapshot.data!.docs[num]['Adres']}"
                                         ,style:TextStyle(fontSize: 12),
                                         maxLines: 4,
                                         overflow: TextOverflow.ellipsis,)),
                                       Icon(

                                           Icons.location_on)

                                     ],
                                   ),
                                   Row(
                                     children: [
                                       InkWell(
                                         child: Container(

                                           width: 100, height: 40,
                                           decoration: const BoxDecoration(
                                             color: Colors.green,
                                             borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(15.0),
                                               bottomRight: Radius.circular(15.0),
                                             ),
                                           ),
                                           child: const Row(

                                             children: [
                                               Icon(Icons.location_on),
                                               SizedBox(width: 7,),
                                               Text("Konum",style: TextStyle(fontSize: 17),)
                                             ],
                                           ),
                                         ),
                                         onTap: () async{

                                           final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${snapshot.data!.docs[num]['Latitude']},${snapshot.data!.docs[num]['Longitude']}');
                                           if ( await launchUrl(url)) {
                                           throw Exception('Could not launch $url');
                                           }
                                         },
                                       ),
                                       const SizedBox(width: 40,),
                                       InkWell(
                                         child: Container(

                                           width: 100, height: 40,
                                           decoration: const BoxDecoration(
                                             color: Colors.blue,
                                             borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(15.0),
                                               bottomRight: Radius.circular(15.0),
                                             ),
                                           ),
                                           child: const Row(

                                             children: [
                                               Icon(Icons.phone),
                                               SizedBox(width: 10,),
                                               Text("ARA" ,style:  TextStyle(fontSize: 17),)
                                             ],
                                           ),
                                         ),
                                         onTap: (){

                                           launch("tel://${snapshot.data!.docs[num]['phone']}");
                                         },
                                       ),


                                     ],
                                   )

                                 ],
                               ),
                               Container(
                                   padding: const EdgeInsets.only(right: 7),
                                   child:  Image( image: NetworkImage("${snapshot.data!.docs[num]['ResimURL ']}"),width: 120,height: 150,)),

                             ],

                           ),
                         ),
                       ],
                     ),

                     onTap: (){
                       Muze.doc("${snapshot.data!.docs[num].id}").update({'count': snapshot.data!.docs[num]['count']+1});
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  details(Muze: snapshot.data!.docs[num])),

                       );
                     },

                   );;
                 }),
           );
         }else{
           return  Scaffold(
             body: Center(
                child: const SizedBox(width: 100,height: 100,child: CircularProgressIndicator() ,),
             ),

           )  ;
         }
        });
  }
}

