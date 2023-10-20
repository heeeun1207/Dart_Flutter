import 'package:flutter/material.dart';
// 웹뷰 플러그인 임포트
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller; // 컨트롤러 변수 생성
  // const 생성자 -> 삭제
  HomeScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( // 앱바 위젯 추가
        backgroundColor: Colors.deepOrangeAccent,
        // 앱 타이틀 설정
        title: Text('Blog web app'),
        // 가운데 정렬
        centerTitle: true,
        // AppBar의 actions 매개변수
        actions: [
          IconButton(

              // 눌렀을 때 콜백 함수 설정
              onPressed: (){
                if (controller != null){

                  // 웹뷰에서 보여줄 사이트 실행
                  controller!.loadUrl('https://blog.codefactory.ai');
                }
              },

              // 홈 버튼 아이콘 설정
              icon: Icon(
                Icons.home,
              ),
          ),
        ],
      ),
      body: WebView( // WebView 추가
        // 웹뷰 생성 함수
        onWebViewCreated: (WebViewController controller){
          this.controller =controller; // 위젯에 컨트롤러 저장
        },
        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}