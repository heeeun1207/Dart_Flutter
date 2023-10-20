import 'package:flutter/material.dart';
// 웹뷰 플러그인 임포트
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  // const 생성자
  const HomeScreen({Key? key}) : super (key: key);

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
        initialUrl: 'https://www.naver.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}