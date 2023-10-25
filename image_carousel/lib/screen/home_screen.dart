import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // PageView는 여러 개의 위젯을 독립적인 페이지로 표시하며, 사용자가 페이지를 가로 또는 세로로 스와이프하여 넘길 수 있는 위젯
        children: [1, 2, 3, 4, 5].map(
              (number) => Image.asset(
            'asset/img/image_$number.jpeg',
            fit: BoxFit.cover, // 이미지를 부모 위젯에 맞게 확대 또는 축소
          ),
        ).toList(),
      ),
    );
  }
}
