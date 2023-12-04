import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng parkLatLng = LatLng( // 지도 초기화 위치
    36.3567955, // 위도
    127.3848277, // 경도시
  );
// 지정한 위치 (공원 = parkLatLng) 마커 선언
static final Marker marker = Marker(
  markerId: MarkerId('park'),
  position: parkLatLng,
);

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot){
          // 로딩 상태
          if(!snapshot.hasData &&
          snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // 권한이 허가된 상태
          if(snapshot.data == '위치 권한이 허가 되었습니다.'){
            return Column(   // 지도와 출근하기(footer)나눠주기
              children: [
              Expanded( // 2/3만큼 공간 차지
                flex: 2,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: parkLatLng,
                    zoom: 16,
                ),
                  markers: Set.from([marker]), // Set으로 Marker 제공
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
          );
    }

          // 권한 없는 상태
          return Center(
            child:Text(
            snapshot.data.toString(),
          ),
          );
          }
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

Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
  // 위치 서비스가 활성화되어 있는지 확인

  if (!isLocationEnabled) {
    return '위치 서비스를 활성화 시켜주세요';
    // 위치 서비스가 비활성화된 경우 해당 메시지 반환
  }

  LocationPermission checkedPermission = await Geolocator.checkPermission();
  // 위치 권한 확인

  if (checkedPermission == LocationPermission.denied) {
    // 위치 권한이 거절된 경우
    checkedPermission = await Geolocator.requestPermission();
    // 위치 권한 다시 요청

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
      // 위치 권한이 영원히 거절된 경우 해당 메시지 반환
    }

    return '위치 권한이 허가 되었습니다.';
    // 위치 권한이 허가된 경우 해당 메시지 반환
  }

  // 모든 상황에 대한 반환 값을 명시
  return '위치 권한이 허가 되었습니다.'; // 기본 반환 값
}

