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
  bool showControls = false; // 동영상을 조작하는 아이콘이 보일지 여부
  // 1.동영상을 조작하는 컨트롤러
  VideoPlayerController? videoController;

  // covariant 라는 키워드는 CustomVideoPlayer의 상속된 값도 허가한다.
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 새로 선택한 동영상이 같은 동영상인지 확인
    if (oldWidget.video.path != widget.video.path) {
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
  void dispose() {
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
    return GestureDetector( // 화면 전체 탭을 인식하기 위해서 사용
      onTap: () {
        setState(() {
          showControls = !showControls;
        });
      },
      child: AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if (showControls)
              Container( // 아이콘 버튼이 보일 때 화면을 어둡게 변경
                color: Colors.black.withOpacity(0.5),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Slider(
                onChanged: (double val) {
                  videoController!.seekTo(
                    Duration(seconds: val.toInt()),
                  );
                },
                value: videoController!.value.position.inSeconds.toDouble(),
                min: 0,
                max: videoController!.value.duration.inSeconds.toDouble(),
              ),
            ),
            // showControls이 true일 때만 아이콘 보여주기
            if (showControls)
              Align(
                alignment: Alignment.topRight,
                child: CustomIconButton(
                  onPressed: widget.onNewVideoPressed,
                  iconData: Icons.photo_camera_back,
                ),
              ),
            if (showControls)
              Align( // 동영상 컨트롤 부분
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      onPressed: onReversePressed,
                      iconData: Icons.rotate_left,
                    ),
                    CustomIconButton(
                      onPressed: onPlayPressed,
                      iconData: videoController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    CustomIconButton(
                      onPressed: onForwardPressed,
                      iconData: Icons.rotate_right,
                    ),
                  ],
                ),
              ),
          ],
        ),
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

    void onForwardPressed() {
      // 앞으로 감기 버튼 눌렀을 때 실행할 함수
      final maxPosition = videoController!.value.duration; // 동영상 길이
      final currentPosition = videoController!.value.position;

      Duration position = maxPosition; // 동영상 길이로 실행 위치 초기화

      // 동영상 길이에서 3초를 뺀 값보다 현재 위치가 짧을 때만 3초 더하기  = 3초 넘기기
      if ((maxPosition - const Duration(seconds: 3)).inSeconds >
          currentPosition.inSeconds) {
        position = currentPosition + const Duration(seconds: 3);
      }

      videoController!.seekTo(position);
    }

    void onPlayPressed() {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
      }
    }
  }
// 1. 로고를 클릭하고, 동영상을 선택하면 위젯이 잘 렌더링 되는지 확인(CustomVideoPlayer 확인)