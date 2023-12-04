import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng parkLatLng = LatLng( // 지도 초기화 위치
    36.3567955, // 위도
    127.3848277, // 경도
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Column(   // 지도와 출근하기(footer)나눠주기
        children: [
          Expanded( // 2/3만큼 공간 차지
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: parkLatLng,
                zoom: 16,
              ),
            ),
          ),
          Expanded(
            child: Column(  // 나머지 1/3만큼 공간차지
              mainAxisAlignment: MainAxisAlignment.center, // Corrected property name
              children: [
                Icon( // 시계 아이콘
                  Icons.timelapse_outlined, // Corrected icon name
                  color: Colors.blue,
                  size: 50.0,
                ),
                SizedBox(height: 20.0), // Corrected widget name
                ElevatedButton( // [출근하기] 버튼
                  onPressed: () {},
                  child: Text('출근하기!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
