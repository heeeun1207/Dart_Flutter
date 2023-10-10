// 키를 이용해서 원하는 값을 빠르게 찾는데 중점을 둔다. 
// map<키의 타입,값의 타입>맵이름 형식

void main (){
  Map<String, String> dictionary = {
    'Harry Potter' : '해리 포터', // 키 : 값
    'Ron Weasley' : '론 위즐리',
    'Hermione Granger' : '헤르미온느 그레인저',
  };

  print(dictionary['Harry Potter']);
  print(dictionary['Hermione Granger']);
}