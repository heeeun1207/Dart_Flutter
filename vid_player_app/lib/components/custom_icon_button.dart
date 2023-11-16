import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{
  final GestureTapCallback onPressed; // 아이콘 눌렀을 때 실행할 함수
  final IconData iconData; // 아이콘

const CustomIconButton({
  required this.onPressed,
  required this.iconData,
  Key? key,
}): super(key: key);

@override
  Widget build(BuildContext context){
  return IconButton(   // 아이콘 버튼 만들어주는 위젯
      onPressed: onPressed, // 아이콘 눌렀을 때 실행할 함수
      iconSize: 30.0,
      color: Colors.white,
      icon: Icon( // 아이콘
        iconData,
      ),
  );
}
}