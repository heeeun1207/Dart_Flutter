import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';

class SettingsSreen extends StatelessWidget{
  final double threshold; // Slider의 현잿값
  // Slider가 변경될 때마다 실행되는 함수
  final ValueChanged<double> onThresholdChange;

  const SettingsSreen({
    Key? key,

    // threshold와 onThresholdChange는 SettingsSreen에서 입력
    required this.threshold,
    required this.onThresholdChange,
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                  '민감도',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: 0.1,   // 1. 최솟값
          max: 10.0,  // 2. 최댓값
          divisions: 101, // 3. 최솟값과 최댓값의 사이 구간 개수
          value: threshold, // 4. 슬라이더 선택값
          onChanged: onThresholdChange, // 5. 갑 변경시 실행되는 함수
          label: threshold.toStringAsFixed(1), // 6. 표싯값
        ),
      ],
    );
  }
}

