import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/screens/apis.dart';
import 'package:untitled/screens/list.dart';
import 'package:untitled/screens/namaz.dart';
import 'package:untitled/screens/Home_page.dart';
import 'screens/HD.dart';
import 'screens/details.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home:  MyApp()));
}

