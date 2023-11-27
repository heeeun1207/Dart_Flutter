import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
class CamScreen extends StatefulWidget{
  const CamScreen ({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen>{
  Future<bool> init() async { // 권한 관련 작업 모두 실행
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus.granted ||
    micPermission != PermissionStatus.granted){
      throw '카메라 또는 마이크 권한이 없습니다.';
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIVE'),
      ),
      body: FutureBuilder(
          future: init(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) { // 에러가 있을 때
              return Center(
                child: Text(
                    snapshot.error.toString()
                ),
              );
            }
            if (!snapshot.hasData) { // 아직 데이터가 없을 때 ( = 로딩 중 )
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center( // 나머지 상황에 권한 있음 표시하기
              child: Text('모든 권한이 있습니다!'),
            );
          }
      ),
    );
  }
  }


