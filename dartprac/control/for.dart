// void main (){
//   for(int i= 0; i<3; i++){
//     print(i);
//   }
// }


//* 다트언어에서 for...in 패턴의 for 문
//일반적으로 List의 모든 값을 순회하고 싶을 때 사용한다.
void main(){
  List<int> numberList = [3,6,9];
  
  for (int number in numberList){
    print(number);
  }
}