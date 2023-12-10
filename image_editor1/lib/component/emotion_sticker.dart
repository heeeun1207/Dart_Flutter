import 'package:flutter/material.dart';

class EmoticonStictker extends StatefulWidget{ // 스티커 그리는 위젯
  final VoidCallback onTransform;
  final String imgPath;

  const EmoticonStictker({
    required this.onTransform,
    required this.imgPath,
    Key? key,
  }): super(key: key);

  @override
  State<EmoticonStictker> createState() => _EmoticonStictkerState();
}

class _EmoticonStictkerState extends State<EmoticonStictker> {

  double scale =1; // 확대/축소 배율

  double hTransform = 0; // 가로의 움직임

  double vTransform = 0; // 세로의 움직임

  double actualScale = 1; // 위젯의 초기 크기 기준 확대/축소 배율

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { //  임시 : 스티커를 눌렀을 때 실행할 함수
        widget.onTransform(); // 스티커 상태가 변경될 때마다 실행
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        // 스티커 확대 비율이 변경됐을 때 실행
        widget.onTransform();
        setState(() {
          scale = details.scale* actualScale;
          // 최근 확대 비율 기반으로 실제 확대 비율 계산
          vTransform += details.focalPointDelta.dy; // 세로 이동 거리 계산
          hTransform += details.focalPointDelta.dx; // 가로 이동 거리 계산
        });
      },
      onScaleEnd: (ScaleEndDetails details){
        actualScale = scale; // 확대 비율 저장
      },
      // 스티커 확대 비율 변경이 완료 됐을 때 실행
      child: Image.asset(
        widget.imgPath,
      ),
    );
  }
}