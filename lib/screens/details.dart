import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icon.dart';

import '../Compents/google_maps.dart';

class details extends StatelessWidget {
  const details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back
              ,color: Colors.white,
              size: 30,) ,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xFF0C2E51),
          title:
            const Center(child: Text("Atatürk Evi Müzesi",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
          actions: [

            Icon(Icons.share,color: Colors.white, size: 30,),
            SizedBox(width: 10,),
          ],
      ),
          
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Container(

               margin: const EdgeInsets.all(20.0),
              width: 120, height: 30,
              child: Row(

                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.remove_red_eye_sharp),
                  SizedBox(width: 7,),
                  Text("1400",style: TextStyle(fontSize: 17),)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(7.0),),
              ),
            ),

            Container(


              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Atatürk Evi Müzesi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("açıklama yeri",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18
                                  ,fontWeight: FontWeight.bold ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),




                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                   
                      child: Image(image: AssetImage("images/C7922E1A-BF1B-4BA2-B7D9-F980AAA7B6B6-2048x1606.jpeg" ,),width: 120,height: 150,)),

                ],

              ),
            ),
            
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(

                  border: Border.all(width: 3.0,color: Colors.lightBlue.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 140,),
                  
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Icon(FontAwesomeIcons.facebook,size: 45,color: Colors.blueAccent,),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.blue.shade200),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Icon(FontAwesomeIcons.whatsapp,size: 45,color: Colors.green,),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.green.shade200),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Icon(Icons.phone,size: 45,color: Colors.blue,),
    decoration: BoxDecoration(
    border: Border.all(width: 2.0,color: Colors.lightBlue.shade200),
    borderRadius: BorderRadius.all(Radius.circular(30))
    ),
                  ),
                ],
              ),

            ),
              Text("Konum",style: TextStyle(fontSize: 25),),
            Text("Kültür, Atatürk Cd. No:34, 33010 İçel Merkez/Mersin",style: TextStyle(fontSize: 18), ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   MyApp1(),

              ],
            )
            



          ],
    ),
       ),


    );
  }
}

