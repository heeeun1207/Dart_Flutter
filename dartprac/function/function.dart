// // 순서가 고정된 매개변수 = positional parameter , 위치 매개변수 
// int addTwoNumbers (int a, int b){
//   return a+b;
// }

// void main (){
//   print(addTwoNumbers(1,2));
// }


// // 이름이 있는 매개변수 = named parameter , 명명된 매개변수
// //* 중괄호{}와 required 키워드를 사용한다.
// int addTwoNumbers ({
//   required int a,
//   required int b,
// }){
//   return a + b ;
// }
// void main (){
//   print(addTwoNumbers(a:1, b:2));
// }


// // 기본값을 갖는 포지셔널 파라미터 [] 로 지정
// int addTwoNumbers(int a,[int b=2]) {
//   return a + b ;
// }

// void main (){
//   print(addTwoNumbers(10));
// }
// //12
// // 입력값이 하나이므로 두 번째 매개변수에 기본값 2를 계산한 결과를 반환


// // 네임드 파라미터 기본값 적용. required 키워드 생략 
// int addTwoNumbers({
//   required int a,
//   int b =2,
// }) {
//   return a + b;
// }

// void main (){
//   print(addTwoNumbers(a:1));
// }


//* 포시셔널 파라미터와 네임드(required) 파라미터를 "섞어서" 사용할 수 있다. 
//* 단 포시녀널 파라미터가 반드시 먼저 위치해야 한다. 
int addTwoNumbers(
  int a,{
  required int b,
  int c = 4,
  }){
    return a + b + c;
  }

void main (){
  print(addTwoNumbers(1,b:3, c:7 )); // c는 4의 기본값을 덮어쓴다.
} //11 
