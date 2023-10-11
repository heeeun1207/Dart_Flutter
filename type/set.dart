void main (){
  // Map 이 키와값의 조합이라면, Set은 중복 없는 값들의 집합이다.
  //* 형식: Set<타입> 세트이름
  Set<String> animalList = {'고양이','호랑이','사자','돌고래','돌고래'};

  print(animalList); //{고양이, 호랑이, 사자, 돌고래}
  print(animalList.contains('고양이')); //true
  print(animalList.toList()); //[고양이, 호랑이, 사자, 돌고래]

  List<String> animalList2 = ['고양이','호랑이','호랑이'];
  print(Set.from(animalList2)); // {고양이, 호랑이}
}

// Set은 절대로 중복값을 허용하지 않음
// 원한다면 Set 타입을 List로 변환하거나, List타입을 Set타입을 변환 할 수 있다.
