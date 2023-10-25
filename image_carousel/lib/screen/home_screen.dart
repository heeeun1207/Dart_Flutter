import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async'; // async 패키지 불러오기

// StatefulWidget 위젯 정의
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// _HomeScreenState 정의
class _HomeScreenState extends State<HomeScreen>{

  // initState() 함수 등록
  @override
  void initState(){
    super.initState(); // 부모 initState() 실행

    Timer.periodic(
      Duration(seconds: 3),
          (timer) {
        print('실행!');
      },
    );
}
  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경     .light .dark
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

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
