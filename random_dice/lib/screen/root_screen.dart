import 'package:flutter/material.dart';

// BottomNavigationBar 아래에 배치하고,
// 남는 공간에 TabBarView 위치시켜서 스크린 전환이 가능한 구조로 구현한다.

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with
TickerProviderStateMixin {
  // TickerProviderStateMixin 사용하기
  TabController? controller; // 사용할 탭 컨트롤러 선언

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); // 컨트롤러 초기화하기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView( // 앱 화면을 보여줄 위젯
        controller: controller, // ! 컨트롤러 등록하기
        children: renderChildren(),
      ),
      // 아래 탭 내비게이션을 구현하는 매개변수
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      Container( // 홈 탭
        child: Center(
          child: Text(
            'Tab 1',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container( // 설정 스크린 탭
        child: Center(
          child: Text(
            'Tab 2',
            style: TextStyle(
             color: Colors.white,
          ),
        ),
       ),
      ),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    // 탭 내비게이션을 구현하는 위젯
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.edgesensor_high_outlined,
        ),
        label: '주사위',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: '설정',
      ),
    ],
    );
  }
}

// TabController 에서 vsync 기능을 사용하려면 필수로 TickerProviderStateMixin 사용해야 한다.
// TickerProviderStateMixin 와 SingleTickerProviderStateMixin 애니메이션 효율을 올려주는 역할을 한다.
// TabController의 length의 매개변수에 탭 개수를 int로 제공하고,
// vsync에는 TickerProviderMixin 을 사용하는 State 클래스를 this 형태로 넣는다.
// 결과 : 그렇게 해서 생성된 TabController는 TabBarView의 매개변수에 입력한다.
// 즉 입력된 controller를 통해서 TabBarView를 조작할 수 있음.


// 정리 : 이해하고 넘어가기
// TabBarView는 TabController가 필수이다.
// 추가적으로 TabController를 초기화하려면 vsync 기능이 필요한데 이는 State 위젯에
// TickerProviderMixin 을 mixin으로 제공해줘야 사용할 수 있다