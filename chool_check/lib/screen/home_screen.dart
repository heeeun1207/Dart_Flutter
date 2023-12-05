import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng parkLatLng = LatLng( // 지도 초기화 위치
    36.3567,
    127.3847,
  );
// 지정한 위치 (공원 = parkLatLng) 마커 선언
  static final Marker marker = Marker(
    markerId: MarkerId('park'),
    position: parkLatLng,
  );
//현재 위치 반경 표시하기
  static final Circle circle = Circle(
    circleId:CircleId('choolcheckCircle'),
    center: parkLatLng, // 원의 중심이 되는 위치. LatLng값 제공
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색상
    radius: 100, // 원의 반지름 (미터 단위)
    strokeColor: Colors.blue, // 원의 테두리 색상
    strokeWidth: 1, // 원의 테두리 두께
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
                      myLocationEnabled: true, // 내 위치 지도에 보여주기
                      markers: Set.from([marker]), // Set으로 Marker 제공
                      circles: Set.from([circle]), // Set으로 Circle 제공
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
                          onPressed: () async {
                            final curPosition = await Geolocator
                                .getCurrentPosition(); // 현재 위치

                            final distance = Geolocator.distanceBetween(
                              curPosition.latitude, // 현재 위치 위도
                              curPosition.longitude, // 현재 위치 경도
                              parkLatLng.latitude, // 공원 위치 위도
                              parkLatLng.longitude, // 공원 위치 경도
                            );

                            bool canCheck =
                                distance < 100; // 100미터 이내에 있으면 출근 가능

                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('출근하기'),

                                  // 출근 가능 여부에 따라서 다른 메시지 제공
                                  content: Text(
                                    canCheck? '출근을 하시겠습니까?' : '출근을 할 수 없는 위치입니다.',
                                  ),
                                  actions: [
                                    TextButton(

                                      // 취소를 누르면 false 반환
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text('취소'),
                                    ),
                                    if (canCheck) // 출근 가능한 상태일때만 [출근하기]버튼 제공
                                      TextButton(

                                        // 출근하기 누르면 true 반환
                                        onPressed: (){
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text('출근하기'),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
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