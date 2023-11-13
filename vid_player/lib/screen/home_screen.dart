import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  XFile? video; // 1. 동영상 저장할 변수

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      // 2. 동영상이 선택됐을 때와 선택 안 됐을 때 보여줄 위젯
      body: video ==null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderEmpty(){ // 3. 동영상 선택 전 보여줄 위젯
    return Container();
  }

  Widget renderVideo(){ // 4. 동영상 선택 후 보여줄 위젯
  return Container();
  }
}

// 1. image_picker 플러그인을 사용하면 XFile 클래스 형태로 동영상을 받아볼 수 있다. 선택된 동영상이 있으면 이 변수에 저장한다.
// 2. 선택된 동영상이 없으면 renderEmpty 함수가 반환하는 위젯을 보여주고, 선택되었으면 renderVideo 함수가 반환하는 위젯을 보여준다.
// 3,4. 각 상황에 따라 보여줄 위젯을 렌더링 하는 함수이다.