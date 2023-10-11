//OOP 기본은 클래스로 부터 시작된다.

//클래스 선언
class Idol {
  //1. 클래스에 종속되는 변수 지정
  String name = '블랙핑크';

  //2. 클래스에 종속되는 함수 지정
  //* 클래스에 종속되는 함수 = 메서드 라고 부른다. 
  void SayName(){
    //3. 클래스 내부의 속성을 지칭하고 싶을 때 this 키워드를 사용한다.
    //결과적으로 this.name은 Idol클래스의 name 변수를 지칭함.
    print('저는 ${this.name}입니다.');
    
    //* 4.스코프안에 같은 속성 이름이 하나만 존재하면 this 생략 가능 
    print('저는 $name입니다.');

  }
}
void main (){
  // 변수 타입을 Idol로 지정하고,
  // Idol 인스턴스를 생성할 수 있다.
  // 인스턴스를 생성할 때는 함수를 실행하는 것처럼
  //* "인스턴스화" 하고 싶은 클래스의 괄호()를 열고 닫는다. 
  Idol blackPink =Idol(); //1. Idol 인스턴스 생성 

  // 메서드 실행
  blackPink.SayName();
}