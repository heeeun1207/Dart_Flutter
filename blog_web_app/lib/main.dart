import 'package:blog_web_app/screen/home_screen.dart';
//일반적으로, 'package: [플러그인이름] /[플러그인이름]. dart'형식
import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}