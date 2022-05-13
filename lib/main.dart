import 'package:flutter/material.dart';
import 'package:part_of_picco_project/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        HomePage.id:(context)=> HomePage(),


      },
    );
  }
}
