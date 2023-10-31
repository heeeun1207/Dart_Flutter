import 'package:flutter/material.dart';

// 프로젝트에 반복적으로 사용되는 상수들을 별도의 파일에 정리해서 일괄 변경할 경우 대공사를 예방한다.
const backgroundColor = Color(0xFFFFC0CB); // 배경색
const primaryColor = Colors.white; // 주 색상
final secondaryColor = Colors.grey[600]; // 보조 색상
// 1. Colors.grey 는 const 로 선언이 가능하지만, 600 이라는 키값을 입력하면 런타임에 색상이 계산되기 때문에 const 사용이 불가능하다.

