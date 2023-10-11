class Idol {
  String name;
  int membersCount;

  Idol(this.name, this.membersCount);
}

mixin IdolSignMixin on Idol{
  void sing(){
    print('${this.name}가 노래를 부릅니다.');
  }
}

// 믹스인을 적용할 때 with 키워드 사용
//* mixin 특정 클래스에 원하는 기능들만 골라넣을 수 있는 기능이다. 
// 인터페이스처럼 한 개의 클래스에 여러 개의 믹스인을 적용할 수도 있다. 
class BoyGroup extends Idol with IdolSignMixin {
  BoyGroup(
    super.name,
    super.membersCount,
  );

  void sayMale(){
    print('저는 남자 아이돌입니다.');
  }
}
void main(){
    BoyGroup bts = BoyGroup('BTS', 7);

    //믹스인에서 정의한 sing 함수 사용 가능
    bts.sing();

    bts.sayMale();
    print('아이돌 이름: ${bts.name}');
    print('멤버 수: ${bts.membersCount}');

  }