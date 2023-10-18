import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen()); // SplashScreen 위젯으로 첫 화면 지정
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          child: Center(
            child: Text('Splash Screen'),
          ),
        ),
      ),
    );
  }
}
