//제네릭은 클래스나 함수의 정의를 선언할 때가 아니라 
//인스턴스화 하거나 실행할 때로 미룬다.
//특정 변수의 타입을 하나의 타입으로 제한하고 싶지 않을때 사용한다.
  //예를 들어 정수를 받는 함수 setInt() , 문자열을 받는 함수 setString() 처럼 
  //* 따로 만들지 않아도 제네릭을 사용해서 set() 함수 하나로 여러 자료형을 입력받게 할 수있다.

//이미 제네릭은 많이 사용했다. Map,List,Set등에서 사용한 <>사이에 입력되는 값이 제네릭 문자이다 

// 인스턴스화할 때 입력받을 타입을 T로 지정한다.
class Cache<T> {
  //data 타입을 추후 입력될 T 타입으로 지정
  final T data;

  Cache({
    required this.data,
  });
}
  void main(){
    // T타입을 List<int>로 입력한다.
    final cache = Cache<List<int>>(
      data: [1,2,3],
    );


  // 제네릭에 입력된 값을 통해 data의 변수 타입이 자동으로 유추된다.
  print(cache.data.reduce((value, element)=> value + element ));
  } //6