// Future : 코드가 작성된 순서대로 실행되지 않으면 프로그래밍이 헷갈릴 수 있다.
// 이때 async와 await을 사용하면 비동기를 유지하면서 가독성도 유지할 수 있다.

void main (){
  addNumbers(1,1);
  addNumbers(2,2);
  //! 이렇게 하면 비동기가 아닌 동기가 아닐까? 두 번 실행해보자.
  //* Future.delayed 실행되면서 3초를 기다려야 할 때 CPU리소스가 낭비되지 않고 
  //* 바로 다음코드인   addNumbers(2,2); 실행됐음을 알 수 있다.
  //! 1 + 1 계산 시작!
  //! 2 + 2 계산 시작!   
  // 1 + 1 = 2
  // 1 + 1 코드 실행 끝
  // 2 + 2 = 4
  // 2 + 2 코드 실행 끝
}
  //async 키워드는 함수 매개변수 정의와 바디 사이에 입력한다.
  Future<void> addNumbers(int number1, int number2) async {
    print('$number1 + $number2 계산 시작!');

    //await 대기하고 싶은 비동기 함수 앞에 입력한다.
    await Future.delayed(Duration(seconds:3),(){
      print('$number1 + $number2 = ${number1 + number2 }');
        });
    print('$number1 + $number2 코드 실행 끝');
}

