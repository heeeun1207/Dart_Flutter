void main (){
      List<String> animalList = ['고양이','호랑이','사자','돌고래'];

      // 1. reduce() 함수와 마찬가지로 각 요소를 순회하며 실행
      // 최초 순회 초깃값 (0)이 입력되고 , 이후에 기존 순회의 반환값이 입력된다.
      final allMembers =
        animalList.fold<int>(0, (value, element) => value + element.length);

      print(allMembers); //11 
}

//fold() 함수는 reduce()와 실행되는 논리는 같다.
//* 차이점 
//reduce() 함수가 실행되는 리스트 요소들의 타입이 같아야 한다.
//fold() 함수는 어떤 타입이든 반환할 수 있다.

