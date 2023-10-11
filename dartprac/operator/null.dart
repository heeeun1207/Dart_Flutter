// 다트 언어에서 변수타입이 null 값을 가지는지 여부를 직접 지정해줘야한다. 
//* 타입키워드를 그대로 사용하면 null 값이 저장될 수 없다
//* 타입뒤에 '?'추가해야만 null 값이 저장된다. 

// void main (){
//   double? number1 =1;
  
//   // 타입뒤에 '?' 명시하지 않아서 주석을 제거하면 에러가 난다.
//   // double number2 = null;
//   double? number2 = null;
// }

//* null 을 가질 수 있는 변수에 새로운 값을 추가할때 
//* ?? 사용하면 기존의 null인때만 값을 저장되도록 할 수도 있다. 

void main (){
  double? number; // 자동으로 null 값 지정
  print(number);  //null

  number ??= 3; 
  print(number); //3.0 : 기존값이 null 값일때만 저장

  number ??= 4; 
  print(number); //3.0 :  null 에서 3으로 저장됐으므로, 3이 유지된다
}