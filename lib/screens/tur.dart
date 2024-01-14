 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_plus/translator_plus.dart';

class translate extends StatefulWidget {
   const translate({super.key});

   @override
   State<translate> createState() => _translateState();
 }

 class _translateState extends State<translate> {



     var M= {
      'turk':{'txt':' Türkçe ','flag':'tr','Lan':'tr','textf':'Çevirmek ıstediğiniz metin yazınız','textf1':'Çevrilen metin burada görünecek','bo':'Çevir'},
       'usa':{'txt':'ingilizce ','flag':'us','Lan':'en','textf':'Please Type the text you want to translate','textf1':'The translated text will appear here','bo':'translate'}
     };
     var  m1='turk';
     var m2='usa';
     final myController = TextEditingController();

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
             title: Text("Türcme",style: TextStyle(color: Colors.white),),
         ),
       backgroundColor: Colors.grey.shade400,
       body: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22)
                ),
               margin: EdgeInsets.all(15),
               padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleFlagSvg(code: '${M[m1]!['flag']}',size: 20,),
                        Text(M[m1]!['txt']!),
                      ],
                    ),
                    SizedBox(width: 75,),
                    InkWell(
                      onTap: (){


                        change();
                      },
                      child: Container(

                        width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(FontAwesomeIcons.rightLeft ,size: 16,color: Colors.white, )),
                    ),
                    SizedBox(width: 75,),
                    Row(
                      children: [
                        Text(M[m2]!['txt']!),
                        CircleFlagSvg(code: '${M[m2]!['flag']}',size: 20,),

                      ],
                    ),
                  ],
                ),
              ),
               Container(
                 
                 decoration: BoxDecoration(
                   color: Colors.white,

                    borderRadius: BorderRadius.circular(10)
                 ),

                 margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                 child: TextField(
                   controller: myController,

                   maxLines: 5,
                   decoration: InputDecoration(

                     border: OutlineInputBorder(),
                     hintText: '${M[m1]!['textf']}',
                   ),
                 ),
               ),
               ElevatedButton(onPressed: (){

                 MM( myController.text,M[m1]!['Lan']!, M[m2]!['Lan']!,);
                 FocusScope.of(context).unfocus();

               }, child: Text("${M[m1]!['bo']}")),
               Container(
                 decoration: BoxDecoration(
                     color: Colors.white,

                     borderRadius: BorderRadius.circular(10)
                 ),

                 margin: EdgeInsets.all(10),
                 child: TextField(

                   keyboardType: TextInputType.multiline,
                   maxLines: 5,
                   readOnly: true,
                   decoration: InputDecoration(


                     border: OutlineInputBorder(),
                     hintText: '${M[m2]!['textf1']}',
                   ),
                 ),
               ),

               ]

         ),
       )

     );
   }

   void change(){

     setState(() {
       if(m1=='turk'){
         m1='usa';
         m2="turk";
       }else{
         m1='turk';
         m2="usa";
       }

     });

   }

   void MM(String txt,String from, String to) async{
     final translator = GoogleTranslator();
   var translation = await translator.translate(txt, from: from, to: to);
     setState(() {
       M[m2]!['textf1']=translation.toString();
     });
 }
 }
