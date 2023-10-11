// 함수의 시그니처를 정의하는 값
// 시그니처는 반환값 타입, 매개변수 개수와 타입등을 말한다. 
// 즉 함수 선언부를 정의하는 키워드이다. 
// 함수가 무슨 동작을 하는지에 대한 정의는 없다.
//* 그럼 함수를 어떻게 사용할까? 시그니처에 맞춘 함수를 사용하면 된다. 

// typedef Operation = void Function(int x, int y);

// void add(int x, int y ){
//   print('결괏값 : ${ x + y }');
// }

// void subtract(int x, int y ){
//   print('결괏값 : ${ x - y }');
// }

// void main (){
//   // typedef는 일반적인 변수의 type처럼 사용 가능
//   Operation oper = add;
//   oper(1,2);

//   // subtract함수도  Operation에 해당하는 함수이므로 
//   // 시그니처이므로 oper 변수에 저장가능
//   oper=subtract;
//   oper(1,2);
// }


//* 다트에서 함수는 일급객체이다. (first-class citizen) : 일급시민 이라고도 한다.
//* 함수를 값처럼 사용할 수 있다.
//* 그래서 플러터에서는 typedef로 선언한 함수를 다음과 같이 매개변수로 넣어서 사용함.
typedef Operation = void Function(int x, int y);

void add(int x, int y ){
    print('결괏값 : ${ x + y }');
}

void calculate(int x, int y, Operation oper){
  oper(x,y);
}

void main(){
  calculate(1,2,add); 
}
// 결괏값 : 3

