import 'package:flutter/material.dart';

import 'package:newsapi/views/articel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
       
    
      ),
      home: Home()
    );
  }
}

