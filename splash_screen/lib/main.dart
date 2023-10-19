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
            // 헥스코드(hex code)
            color: Color(0xfff99231),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Column(
              // 가운데 정렬 추가
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                // 1 여러 위젯을 입력할 수 있는 children 매개변수
                 Image.asset(
                // 매개변수로 파일 위치 적기
                'assets/logo.png',
                width: 200,
                ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
