import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:SizedBox(
            // 높이 지정
            height: 200.0,

            // 너비 지정
            width: 200.0,

            //* 사이즈 박스 크기 확인용으로 색 추가
            child: Container(
              color: Colors.red,
            ),
          )
        ),
      ),
    );
  }
}