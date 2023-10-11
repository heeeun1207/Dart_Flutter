// enum : 한 변수의 값을 몇가지 옵션으로 제한하는 기능 -> 선택지가 제한적일때 사용한다. 

enum Status {
  approved,
  pending,
  rejected,
}

void main (){
  Status status = Status.approved;
  print(status); //Status.approved
}