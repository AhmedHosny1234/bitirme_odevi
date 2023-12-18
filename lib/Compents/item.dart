import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/details.dart';
class item extends StatelessWidget {
  const item({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Column(
        children: [
          SizedBox(height: 5,),
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
                    Text("Atatürk Evi Müzesi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Kültür, Atatürk Cd. No:34, 33010 İçel Merkez/Mersin",style:TextStyle(fontSize: 10),),

                        Icon(Icons.location_on)
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Container(

                            width: 100, height: 40,
                            child: Row(

                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 7,),
                                Text("Konum",style: TextStyle(fontSize: 17),)
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                            ),
                          ),
                          onTap: (){

                            print("object");
                          },
                        ),
                        SizedBox(width: 40,),
                        InkWell(
                          child: Container(

                            width: 100, height: 40,
                            child: Row(

                              children: [
                                Icon(Icons.phone),
                                SizedBox(width: 10,),
                                Text("ARA" ,style:  TextStyle(fontSize: 17),)
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                            ),
                          ),
                          onTap: (){

                            print("object");
                          },
                        ),


                      ],
                    )

                  ],
                ),
                Container(
                    padding: EdgeInsets.only(right: 7),
                    child: Image(image: AssetImage("images/Untitled design (1).png" ,),width: 120,height: 150,)),

              ],

            ),
          ),
        ],
      ),


      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const details()),
        );
      },

    );
  }
}
