// void main(){
//   List<int> numbers = [1,2,3,4,5];

//   //*일반 함수로 모든 값 더하기 
//   final allMembers = numbers.reduce((value, element){
//     return value + element;
//   });

//   print(allMembers); //15 
// } 


//* 람다 함수로 모든 값 더하기 
void main(){
  List<int> numbers =  [1,2,3,4,5];

  final allMembers = numbers.reduce((value, element) => value + element );
  
  print(allMembers); //15
}