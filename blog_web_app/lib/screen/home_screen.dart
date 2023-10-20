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