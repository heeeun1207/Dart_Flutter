// 입력된 상수값에 따라 알맞은 case 블록을 수행한다.
// break 키워드를 사용하면 switch 문 밖으로 나갈 수 있다.
//* case 끝에 break 사용하는 걸 잊지 말아라 (컴파일 에러 발생)
// enum과 함께 사용하면 유용하다.

enum Status {
  approved,
  pending,
  rejected,
}

void main (){ 
  Status status = Status.approved;

  switch (status) {
    case Status.approved:
    //approved값이기 때문에 다음코드가 실행된다.
      print('승인 상태입니다.');
      break;
    case Status.pending:
      print('대기 상태입니다.');

      break;
    case Status.rejected:
      print('거절 상태입니다.');
  default:
    print('알 수 없는 상태입니다.');
}
// enum 모든 수를 리스트로 반환한다. 

  print(Status.values);
}

// 승인 상태입니다.
// [Status.approved, Status.pending, Status.rejected]