void main (){
    List<String> animalList = ['고양이','호랑이','사자','돌고래'];
    
    final allMembers = animalList.reduce((value,element) => value +',' +element);
    //reducev 리스트를 순회하며 값들을 더한다.

    print(allMembers); //고양이,호랑이,사자,돌고래
}
/**
순회가 처음 시작하면 
첫번째 매개변수 value = '고양이' 
두번째 매개변수 element = '호랑이'
첫번째 매개변수의 기존 순회에서 반환된 값이 첫번째 매개변수에 입력되고 
리스트에서 다음값이 두번째 매개변수에 입력된다. = '사자' 
즉 reduce()함수는 리스트 내부의 값들을 점차 더해가는 기능으로 사용된다.
*/