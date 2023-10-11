//* 해당 인스턴스의 속성이나 멤버 함수를 연속해서 사용하는 기능
// 캐스케이드 연산자는 .. 기호를 사용한다.
class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);
  
  void sayName(){
    print('저는 ${this.name}입니다.');
  }
  
  void sayMembersCount(){
    print('${this.name}의 멤버는 ${this.membersCount}명입니다.');
  }
}
void main(){
  //cascade operator (..)사용하면
  //선언한 변수의 메서드를 연속으로 실행할 수 있다.
  Idol blackPink = Idol('블랙핑크', 4)
  ..sayName() //* 캐스케이딩 연산자(..)를 사용할 때는 세미콜론(;)을 사용하지 않음
  ..sayMembersCount();
}