import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';

// Column 위젯 하나를 배치해서 Image와 Text 위젯 배치하기

class HomeScreen extends StatelessWidget{
  final int number;


  const HomeScreen ({
    required this.number,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 1. 주사위 이미지
        Center(
          child: Image.asset('asset/img/$number.png'),
        ),
        SizedBox(height: 32.0),
        Text(
            '행운의 숫자',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
              ),
            ),
             SizedBox(height: 12.0),
                 Text(
              number.toString(), // 2.주사위 값에 해당하는 숫자
              style: TextStyle(
                color: primaryColor,
                fontSize: 60.0,
                fontWeight: FontWeight.w200,
                   ),
                 ),
      ],
    );
  }
}
// 1.생성자로 입력된 number값에 해당하는 이미지를 화면에 그려준다.
// 2.생성자로 입력된 number값에 해당하는 글자를 화면에 그려준다.
