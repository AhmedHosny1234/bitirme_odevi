import 'package:flutter/material.dart';
import 'package:untitled/screens/details.dart';
class item extends StatelessWidget {
  const item({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

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
