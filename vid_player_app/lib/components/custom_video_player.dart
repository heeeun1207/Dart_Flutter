//CustomVideoPlayer 위젯은 HomeScreen 위젯에서 선택된 동영상을 재생하는 모든 상태를 관리한다.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io'; // 파일 관련 작업 패키지

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
  // 1.동영상을 조작하는 컨트롤러
  VideoPlayerController? videoController;
  @override
  void initState() {
    super.initState();

    initializeController(); // 2.컨트롤러 초기화
  }

  initializeController() async {
    // 3.선택한 동영상으로 컨트롤러 초기화
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    setState(() {
      this.videoController = videoController;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4.선택한 컨트롤러가 준비 중일 때 로딩 표시
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      // 5.동영상 비율에 따른 화면 렌더링
      aspectRatio: videoController!.value.aspectRatio,
      child: Stack( // children 위젯을 위로 쌓을 수 있는 위젯
        children: [
          VideoPlayer( // VideoPlayer 위젯을 Stack으로 이동
            videoController!,
          ),
          Positioned( // child 위젯의 위치를 정함
            bottom: 0,
            right: 0,
            left: 0,
            child: Slider( // 동영상 재생 상태를 보여주는 슬라이더

              // 슬라이더가 이동할 때마다 실행할 함수
              onChanged: (double val){
                videoController!.seekTo(
                  Duration(seconds: val.toInt()),
                );
              },

              // 동영상 재생 위치를 초 단위로 표현
              value: videoController!.value.position.inSeconds.toDouble(),
              min: 0,
              max: videoController!.value.duration.inSeconds.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
// 1. 로고를 클릭하고, 동영상을 선택하면 위젯이 잘 렌더링 되는지 확인(CustomVideoPlayer 확인)