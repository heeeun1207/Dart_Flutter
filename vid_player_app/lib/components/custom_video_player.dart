//CustomVideoPlayer 위젯은 HomeScreen 위젯에서 선택된 동영상을 재생하는 모든 상태를 관리한다.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomVideoPlayer extends StatefulWidget {

  // 선택된 동영상을 저장할 변수
  // XFile은 ImagePicker로 영상 또는 이미지를 선택했을 때 반환하는 타입
  final XFile video;

  const CustomVideoPlayer({
    required this.video, // 상위에서 선택한 동영상 주입하기
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'CustomVideoPlayer', // 임시
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

// 1. 로고를 클릭하고, 동영상을 선택하면 위젯이 잘 렌더링 되는지 확인(CustomVideoPlayer 확인)