import 'package:flutter/material.dart';

// BottomNavigationBar 아래에 배치하고,
// 남는 공간에 TabBarView 위치시켜서 스크린 전환이 가능한 구조로 구현한다.

class RootScreen extends StatelessWidget {
  const RootScreen ({Key? key})  : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: TabBarView(  // 앱 화면을 보여줄 위젯
        children: renderChildren(),
      ),

      // 아래 탭 내비게이션을 구현하는 매개변수
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren(){
    return [];
  }

  BottomNavigationBar renderBottomNavigation(){
    // 탭 내비게이션을 구현하는 위젯
    return BottomNavigationBar(items: []);
  }
}

