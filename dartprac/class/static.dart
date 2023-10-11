// 여태껏 변수와 메서드등 모든 속성이 '클래스의 인스턴스'에 귀속되었다.
//* static 키워드는 클래스 자체에 귀속된다.
class Counter {
  static int i = 0;

//카운터 클래스에 귀속되기때문에 호출시마다 1씩 증가한다.
  Counter(){
    i++;
    print(i);
  }
}

void main(){
  Counter count1 = Counter();
  Counter count2 = Counter();
  Counter count3 = Counter();
  Counter count4 = Counter();
  Counter count5 = Counter();
}