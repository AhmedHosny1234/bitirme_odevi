


import 'package:flutter/material.dart';
import 'package:untitled/Compents/item.dart';


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});


  List<Widget> _buildTextWidgets( ) {
    List<Widget> textWidgets = []; // Add an empty Container as a default widget
    for (int k = 0; k < 10; k++) {
      textWidgets.add(
        GestureDetector(
             child: Container(

                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Atatürk Evi Müzesi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 20,),
                        const Row(
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
                              onTap: (){

                                print("object");
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

                                print("object");
                              },
                            ),


                          ],
                        )

                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(right: 7),
                        child: const Image(image: AssetImage("images/Untitled design (1).png" ,),width: 120,height: 150,)),

                  ],

                ),
              ),




           ),
      ); // ending bracket of add function
    } // ending bracket of for loop
    return textWidgets;
  } // ending bracket of function

  @override
  Widget build(BuildContext context) {
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
        title: const Column(children: [
          Center(child: Text("Müzler",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
          Center(child: Text("sayi 10",style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),

        ],)
      ),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context,num){

            return const item();
          }),

    );
  }
}

