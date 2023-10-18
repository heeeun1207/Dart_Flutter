import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(), // SplashScreen 위젯으로 첫 화면 지정
  ));
}

// SplashScreen 사용자 정의 위젯이 StatelessWidget을 상속함
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // 위젯의 UI 구현
    return Scaffold(
      body: Center( // 중앙 정렬 위젯
        // 글자에 화면을 보여주는 위젯
        child: Text('Splash Screen'),
      ),
    );
  }
}
