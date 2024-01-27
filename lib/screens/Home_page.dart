import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/screens/teeeest.dart';
import 'package:untitled/screens/tur.dart';

import 'HD.dart';

import 'apis.dart';

import 'namaz.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("images/Untitled design (1).png", scale: 5,)],) ,backgroundColor: const Color(0xFF0C2E51) ),
        body:    SingleChildScrollView(
          child: Column(
            children: [
              const CarouselSliderWithDots(),
              const SizedBox(height: 10,),

              const Text("Kategoriler",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold ),),
              Divider(),
              Row(children: [
                const SizedBox(width:20 ),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Image(image: AssetImage("images/museum (1).png" ,),width: 100,height: 130,),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   GetList( type: 'Müzler',)),
                            );
                          },

                        ),
                        const Text("Müzler", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                      ]
                  ),
                ),
                const SizedBox(width:30 ),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Image(image: AssetImage("images/ancient.png" ,),width: 100,height: 130,),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   GetList( type: 'antik_kentler',)),
                            );
                          },
                        ),
                        const Text("antik kentler", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                      ]
                  ),
                ),
                const SizedBox(width: 30,),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Image(image: AssetImage("images/castle (1).png" ,),width: 100,height: 130,),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   GetList( type: 'Kaleler',)),
                            );
                          },
                        ),
                        SizedBox(
                          child: const Text("Kaleler ve tarihi yaplilar",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18
                                ,fontWeight: FontWeight.bold ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ]
                  ),
                ),

              ],),
              const SizedBox(height: 10,),
              Row(children: [

                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Image(image: AssetImage("images/columns.png" ,),width: 100,height: 130,),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  GetList( type: 'Arkeolojik_siteler',)),
                            );
                          },
                        ),
                        const Text("Arkeolojik siteler", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ), ),
                      ]
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(

                  child: Column(
                      children: [
                        InkWell(
                          child: const Image(image: AssetImage("images/obelisk.png" ,),width: 100,height: 130,),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   GetList( type: 'Anıtlar',)),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 120,
                          child: Text("Anıtlar ve anıt meydanlar",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold
                            ),  maxLines: 2,
                            overflow: TextOverflow.ellipsis,),
                        ),

                      ]
                  ),
                ),


              ],),
              Divider(),
              const Text("Servisler",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),),
              Row(children: [
                const SizedBox(width:20 ),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Icon(FontAwesomeIcons.personPraying,
                            size: 80,
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const namaz()),
                            );
                          },
                        ),
                        const Text("Namaz Vakitlei", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                      ]
                  ),
                ),
                const SizedBox(width:40 ),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Icon(FontAwesomeIcons.pills,
                            size: 80,
                          ),
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const api()),
                            );
                          },
                        ),
                        const Text("Nöbetçi Eczaneleri", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                      ]
                  ),
                ),
                const SizedBox(width: 40,),
                Flexible(
                  child: Column(
                      children: [
                        InkWell(
                          child: const Icon(FontAwesomeIcons.language,
                            size: 75,
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   translate()),
                            );                          },
                        ),
                        Container(
                          child: const Text("Türceme",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18
                                ,fontWeight: FontWeight.bold ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ]
                  ),
                ),

              ],),
              ExpandChild(

                child: Column(
                  children: [

                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Flexible(
                          child: Column(

                              children: [

                                InkWell(
                                  child: const Icon(Icons.cloud,
                                    size: 80,
                                  ),
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  const Hava()),
                                    );
                                  },
                                ),
                                const Text("Hava durumu", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ), ),
                              ]
                          ),
                        ),



                      ],),
                  ],
                ),
              ),
            ],
          ),
        )
    );

  }
}

class CarouselSliderWithDots extends StatefulWidget {
  const CarouselSliderWithDots({
    super.key,
    this.items = const [
      'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
    ],
  });

  final List<String> items;

  @override
  State<CarouselSliderWithDots> createState() => _CarouselSliderWithDotsState();
}

class _CarouselSliderWithDotsState extends State<CarouselSliderWithDots> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(

      alignment: AlignmentDirectional.topCenter,
      children: [
        CarouselSlider(
          carouselController: controller,
          items: widget.items
              .map(
                (item) => Image.network(
              item,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
              .toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 8.0,
          child: DotsIndicator(
            dotsCount: widget.items.length,
            position: currentIndex,
            onTap: (index) {
              controller.animateToPage(index);
            },
            decorator: DotsDecorator(
              color: Colors.white,
              activeColor: Colors.amber,
              size: const Size.square(12.0),
              activeSize: const Size(24.0, 12.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],

    );
  }
}