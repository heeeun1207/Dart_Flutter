void main(){
  try{
    //에러가 없을시 실행할 로직
    final String name = '정희은';

    //throw 키워드로 고의적으로 에러 발생시키기
    throw Exception('이름이 잘못됐습니다!');
    
    print(name);
  }catch(e){
    //에러가 있을시 실행할 로직
    print(e);
  }
}