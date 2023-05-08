import 'package:flutter/material.dart';//importing flutter package
import 'package:hide_my_files/calculator.dart';
import 'package:hide_my_files/home.dart';

void main(){
  runApp(const MyApp());
}//main function


class MyApp extends StatelessWidget {//main widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "calc":(context) => const Calculator(),
        "home":(context) => const Home(),
        "videos":(context)=> Container(),
        "audio":(context)=> Container(),
        "all files":(context)=> Container(),
        "excel":(context)=> Container(),
        "pdf":(context)=> Container(),
      },
      debugShowCheckedModeBanner:false,
      home:const Calculator(),
    );
  }
}