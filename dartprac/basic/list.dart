// 리스트명[인덱스]
void main (){
  //리스트에 넣을 타입을 <> 사이에 명시할 수 있다.
  List<String> animalList = ['고양이','호랑이','사자','돌고래'];
  print(animalList); //[고양이, 호랑이, 사자, 돌고래]
  print(animalList[0]); //고양이
  print(animalList[3]); //돌고래

  print(animalList.length); //4

  animalList[3] = '강아지';
  print(animalList); //[고양이, 호랑이, 사자, 강아지]
}




