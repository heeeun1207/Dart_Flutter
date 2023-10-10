void main(){
  List<String> animalList = ['고양이','호랑이','사자','돌고래'];

  final newList = animalList.where(
    (name) => name == '고양이' || name == '호랑이', // 고양이 또는 호랑이만 유지
  );

  print(newList);
  print(newList.toList()); // Iterable을 List로 다시 변환할 때 .toList() 사용 
// (고양이, 호랑이)
// [고양이, 호랑이]
}