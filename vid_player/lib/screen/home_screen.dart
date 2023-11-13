import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video; // 1. 동영상 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 2. 동영상이 선택됐을 때와 선택 안 됐을 때 보여줄 위젯
      body: video == null ? renderEmpty(context) : renderVideo(),
    );
  }
}
  // 로고 위젯 만들기
  class _Logo extends StatelessWidget {
  const _Logo({
  Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Image.asset(
  'assets/img/logo.png', // 로고 이미지 경로 수정
  );
  }
  }

  // 앱 제목을 출력하는 위젯 -> _Logo 클래스 아래 추가
  class _AppName extends StatelessWidget {
  const _AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final textStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.w300,
  );

  return Row(
  mainAxisAlignment: MainAxisAlignment.center, // 글자 가운데 정렬
  children: [
  Text(
  'VIDEO',
  style: textStyle,
  ),
  Text(
  'PLAYER',
  style: textStyle.copyWith(
  // textStyle 에서 두께만 700으로 변경
  fontWeight: FontWeight.w700,
  ),
  ),
  ],
  );
  }
  }

  Widget renderEmpty(BuildContext context) {
  // 3. 동영상 선택 전 보여줄 위젯
  return Container(
  width: MediaQuery.of(context).size.width,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  _Logo(),
  SizedBox(height: 30.0),
  _AppName(),
  ],
  ),
  );
  }

  Widget renderVideo() {
  // 4. 동영상 선택 후 보여줄 위젯
  return Container();
  }



// 1. image_picker 플러그인을 사용하면 XFile 클래스 형태로 동영상을 받아볼 수 있다. 선택된 동영상이 있으면 이 변수에 저장한다.
// 2. 선택된 동영상이 없으면 renderEmpty 함수가 반환하는 위젯을 보여주고, 선택되었으면 renderVideo 함수가 반환하는 위젯을 보여준다.
// 3,4. 각 상황에 따라 보여줄 위젯을 렌더링 하는 함수이다.