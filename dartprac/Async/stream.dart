// Future은 반환 값을 딱 한 번 받아내는 비동기 프로그래밍에 사용
//* 지속적으로 값을 반환 받을때 Stream 사용한다. 
// Stream은 한번 리슨하면 Stream에 주입되는 모든 값을 받아온다.

// 1. 데이터가 한 번 이상 반환되는가?
// 2. for, await을 사용하는게 더 효율적인가?
// 3. 아니라면 Stream.listen() 선택 

//* 플러터 기본 제공하는 dart:async 패키지 불러오기
import 'dart:async';

void main(){
  final controller = StreamController(); //선언
  final stream = controller.stream; //Stream 가져오기 

  //Stream listen() 함수를 실행하면 값이 주입될때마다 콜백함수를 실행할 수 있다.
  final streamListener1 = stream.listen((val){
    print(val);
  });

  //Stream에 값 주입하기
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
}



