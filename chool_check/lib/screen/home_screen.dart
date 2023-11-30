import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget{
  static final LatLng parkLatLng = LatLng( // 지도 초기화 위치
    36.3567955, // 위도
    127.3848277, // 경도
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: renderAppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: parkLatLng,
          zoom: 16, // 확대 정도 (높을수록 크게 보임)
        ),
      ),
    );
  }

  AppBar renderAppBar(){
    // AppBar를 구현할 함수
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

