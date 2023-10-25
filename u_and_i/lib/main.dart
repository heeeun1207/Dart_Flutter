import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData( // 테마를 지정할 수 있는 클래스
        fontFamily: 'sunflower', // 기본 폰트
        textTheme: TextTheme( // 글짜 테마를 적용할 수 있는 클래스
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
        )

      ),
      home: HomeScreen(),
    ),
  );
}