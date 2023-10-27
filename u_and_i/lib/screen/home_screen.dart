import 'package:flutter/material.dart';
// 쿠퍼티노 iOS 위젯 사용하기 위해 임포트
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super (key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
            _DDay( // _첫글자가 언더스코어이면 다른 파일에서 접근할 수 없다.

              // 하트 눌렀을 때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay : firstDay,
            ),
            _CoupleImage()
          ],
        ),
      ),
    );
  }


  void onHeartPressed() {
    // 하트 눌렀을 때 실행할 함수
    showCupertinoDialog( // 1. 쿠퍼티노 다이얼로그 실행
        context: context, // 2. 보여줄 다이얼로그 빌드
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay =date;
                  });
                },
              ),
            ),
          );
        },
      barrierDismissible: true, // 외부 탭할 경우 다이얼로그 닫기
    );
  }
}



class _DDay extends StatelessWidget {

  // 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // 처음 만난 날

  const _DDay ({
    required this.onHeartPressed, // 상위에서 함수 입력 받기
    required this.firstDay, // 날짜 변수로 입력 받기
});

  @override
  Widget build(BuildContext context){
    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 현재 날짜 시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단의 U&I 텍스트
          'U&I',
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
         // DateTime을 년.월.일 형태로 변경하기
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
         style: textTheme.bodyMedium,
    ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed:onHeartPressed, // 아이콘 눌렀을 때 실행할 함수
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(// 만난 후 DDay
          // DDay 계산하기
          'D+${DateTime(now.year,now.month,now.day).difference(firstDay).inDays + 1 }',
          // difference 은 DateTime 값을 또 다른 DateTime 값과 비교한다.  오늘부터 1일 = +1
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}

// class _CoupleImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Expanded( // Expanded 위젯 - 오버플로 해결 하기
//     child : Center(
//       child: Image.asset(
//       'asset/img/middle_image.png',
//
//       // 화면에 반만큼 높이 구현 -> Expanded 가 우선 순위를 갖게 되어 무시된다.
//       height: MediaQuery.of(context).size.height/ 2,
//       ),
//       ),
//     );
//   }
// }