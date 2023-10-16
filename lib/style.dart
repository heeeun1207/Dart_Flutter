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
          child: Container(
            color: Colors.black,

            // 중간 파란 컨테이너
            child: Container(
              color: Colors.blue,

              // 마진 적용 위치
              margin: EdgeInsets.all(16.0),

              // 패딩 적용
              child: Padding(
                padding: EdgeInsets.all(16.0),
                // 패딩이 적용된 빨간 컨테이너
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 패딩은 적용된 위젯이 차지하는 크기 내부에서 간격이 추가된다
// 마진을 따로 위젯이 사용하지않고, 컨테이너 위젯에 추가 할 수있다 ( 많이 사용되진 않음)
