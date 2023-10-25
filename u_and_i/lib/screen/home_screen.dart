import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea( // 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 위아래 끝에 각각 위젯 배치하기
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(), // _첫글자가 언더스코어이면 다른 파일에서 접근할 수 없다.
            _CoupleImage() // 파일을 불러오기 했을 때 불필요한 값들이 한 번에 불러와지는 걸 방지할 수있다.
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Text('DDay Widget');
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset(
      'asset/img/middle_image.png',

      // 화면에 반만큼 높이 구현
      height: MediaQuery.of(context).size.height/ 2,
      ),
    );
  }
}