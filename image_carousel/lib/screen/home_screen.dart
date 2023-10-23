import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        // PageView 여러 개의 위젯을 독단적인 페이지로 생성,
        // 가로 또는 세로 스와이프로 페이지를 넘길 수 있는 위젯이다.
        children: [1,2,3,4,5] // 샘플 리스트 생성
          .map( // 위젯으로 매핑
            (number) => Image.asset('asset/img/image_$number.jpeg'),
           )
            .toList(),
      ),
    );
  }
}