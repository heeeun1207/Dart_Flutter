void main (){
    List<String> animalList = ['고양이','호랑이','사자','돌고래'];

    final newAnimalList = animalList.map(
      (name) => '귀여운 $name', //리스트의 모든 값 앞에 '귀여운' 추가
    );
    print(newAnimalList);
    print(newAnimalList.toList());
}