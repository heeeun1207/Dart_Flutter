// for문이 횟수 기반으로 반복한다면 , while문은 조건을 기반으로 반복문을 실행함
// true 와 false로 진행됨

// void main (){
//   int total = 0;

//   while(total < 10 ){ // total값이 10보다 작으면 계속 실행 
//     total += 1;
//   }

//   print(total);
// }

//* do while 은 특수한 형태의 while문이다.
// while은 조건을 먼저 확인한 후 실행하고, do while은 반복문을 실행한 후 조건을 확인한다.

void main (){
  int total = 0;

  do{
    total += 1;
  }while(total<10);

  print(total);

}
