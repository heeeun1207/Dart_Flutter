import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //* 핸드폰은 크기나 디자인이 매우 다양하다
        // 특히 아이폰의 노치 디자인처럼 (상단 일부가 파여있는 형태)
        // SafeArea를 사용하여 기기별 예외 처리를 하지않고 안전한 화면만 위젯에 그릴 수 있다.
        body: SafeArea(
          // 원하는 부분만 따로 적용할 수 있다.
          // true 적용 false 미적용
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            color: Colors.red,
            height: 300.0,
            width: 300.0,
          ),
        ),
      ),
    );
  }
}
