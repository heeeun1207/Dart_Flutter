// 머터리얼 디자인과 관련된 기능을 불러오는 코드
// material.dart 파일을 불러와야
// 플러터에서 제공하는 기본 위젯을 사용할 수 있다.
import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: //플러터 기본 위젯 알아보기 ,
        ),
      ),
    )
  }
}

