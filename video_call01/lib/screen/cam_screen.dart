import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call01/const/agora.dart';


class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();

}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine; // 아고라 엔진 저장할 변수
  int? uid; // 내 ID
  int? otherUid; // 상대방 ID

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        micPermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    if(engine == null) {
      // 엔진이 정의되지 않았으면 새로 정의하기
      engine = createAgoraRtcEngine();

      // 아고라 엔진을 초기화
      await engine!.initialize(

        // 초기화 할 때 사용할 설정 제공
        const RtcEngineContext(

          // 미리 저장해둔 APP ID 입력
          appId: APP_ID,

          // 라이브 동영상 송출에 최적화하기
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
      engine!.registerEventHandler(
        // 아고라 엔진에서 받을 수 있는 이벤트 값 등록
        RtcEngineEventHandler(

          // elapsed : JoinChannel 실행한 후 콜백이 실행되기까지 걸린 시간
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            print('채널에 입장했습니다. uid : ${connection.localUid}');
            setState(() {
              this.uid = connection.localUid;
            });
          },
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {
            print('채널 퇴장');
            setState(() {
              uid = null;
            });
          },
          // remoteUid = 상대방 고유 ID
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('상대가 채널에 입장했습니다. uid : ${remoteUid}');
            setState(() {
              otherUid = remoteUid;
            });
          },
          // 다른 사용자가 채널을 나갔을 때 => reason ( 방에서 나가게 된 이유 : 채널끊김, 직접나가기 등)
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reaseon) {
            print('상대가 채널에서 나갔습니다. uid : ${uid}');
            setState(() {
              otherUid = null;
            });
          },
        ),
      );

      // 엔진을 영상으로 송출하겠다고 설정
      await engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
      await engine!.enableVideo();
      await engine!.startPreview();
      await engine!.joinChannel(
          token: TEMP_TOKEN,
          channelId: CHANNEL_NAME,
          uid: 0, // 0을 입력하면 자동으로 고유 ID 배정
          options: const ChannelMediaOptions()
      );
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
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Center(
              child: Text('모든 권한이 있습니다!'),
            );
          }
      ),
    );
  }
}