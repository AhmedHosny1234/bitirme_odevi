import 'package:flutter/material.dart';
import 'package:untitled/screens/Home_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home:  const MyApp()));
}

