class Idol {
  // 생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용 
  final String name;

  //* 생성자 선언 
  //* 클래스와 같은 이름이여야 한다. 
  //* 함수의 매개변수를 선언하는 것처럼 매개변수를 지정한다.
  Idol(String name) : this.name = name;

  void SayName(){
    print('저는 ${this.name}입니다.');
  }
}

void main(){
  Idol blackPink = Idol('블랙핑크');
  blackPink.SayName();

  //! Idol 클래스 하나로 여러가지 인스턴스를 생성했다. 
  Idol bts = Idol('BTS');
  bts.SayName();
}