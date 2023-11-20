//CustomVideoPlayer 위젯은 HomeScreen 위젯에서 선택된 동영상을 재생하는 모든 상태를 관리한다.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player_app/components/custom_icon_button.dart';
import 'package:video_player/video_player.dart';
import 'dart:io'; // 파일 관련 작업 패키지

class CustomVideoPlayer extends StatefulWidget {
  // 선택된 동영상을 저장할 변수
  // XFile은 ImagePicker로 영상 또는 이미지를 선택했을 때 반환하는 타입
  final XFile video;

  // 새로운 동영상을 선택하면 실행되는 함수
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.video, // 상위에서 선택한 동영상 주입하기
    required this.onNewVideoPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer> {
  // 1.동영상을 조작하는 컨트롤러
  VideoPlayerController? videoController;

  // covariant 라는 키워드는 CustomVideoPlayer의 상속된 값도 허가한다.
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);
    // 새로 선택한 동영상이 같은 동영상인지 확인
    if(oldWidget.video.path != widget.video.path){
      initializeController();
    }
  }
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

    // 컨트롤러 속성이 변경될 때마다 실행할 함수 등록
    videoController.addListener(videoControllerListener);

    setState(() {
      this.videoController = videoController;
    });
  }

  // 동영상의 재생 상태가 변경될 때마다
  // setState() 를 실행해서 build()를 재실행한다.
  void videoControllerListener() {
    setState(() {

    });
  }
  // State가 폐기될 때 같이 폐기할 함수를 실행한다.
  @override
  void dispose(){

    // Listener 삭제
    videoController?.removeListener(videoControllerListener);
    super.dispose();
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
          Align( // 오른쪽 위 : 새 동영상 아이콘 배치
            alignment:Alignment.topRight,
            child: CustomIconButton(
              onPressed: widget.onNewVideoPressed,
              iconData: Icons.photo_camera_back,
            ),
          ),
          Align( // 중앙 : 동영상 재생 관련 아이콘
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(   // 되감기 버튼
                    onPressed: onReversePressed,
                    iconData: Icons.rotate_left
                ),
                CustomIconButton(  // 재생 버튼
                    onPressed: onPlayPressed,
                    iconData: videoController!.value.isPlaying ?
                        Icons.pause : Icons.play_arrow,
                ),
                CustomIconButton( // 앞으로 감기 버튼
                    onPressed: onForwardPressed,
                    iconData: Icons.rotate_right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

void onReversePressed() {
  final currentPosition = videoController!.value.position;

  Duration position = const Duration();

  if (currentPosition.inSeconds > 3) {
    position = currentPosition - const Duration(seconds: 3);
  }

  videoController!.seekTo(position);
}

void onForwardPressed() { // 앞으로 감기 버튼 눌렀을 때 실행할 함수
  final maxPosition = videoController!.value.duration; // 동영상 길이
  final currentPosition = videoController!.value.position;

  Duration position = maxPosition; // 동영상 길이로 실행 위치 초기화

  // 동영상 길이에서 3초를 뺀 값보다 현재 위치가 짧을 때만 3초 더하기  = 3초 넘기기
  if((maxPosition - const Duration(seconds: 3)).inSeconds >
      currentPosition.inSeconds){
    position = currentPosition + const Duration(seconds: 3);
  }

  videoController!.seekTo(position);
}

void onPlayPressed(){
  if (videoController!.value.isPlaying){
    videoController!.pause();
  }else{
    videoController!.play();
  }
}
}
// 1. 로고를 클릭하고, 동영상을 선택하면 위젯이 잘 렌더링 되는지 확인(CustomVideoPlayer 확인)