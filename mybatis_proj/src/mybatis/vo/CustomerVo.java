package mybatis.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// @AllArgsConstructor // 모든 프로퍼티값 초기화하는 생성자 코드
@RequiredArgsConstructor // final 키워드 변수만 초기화 생성자
public class CustomerVo {
    private final String customerId;
    private final String name;
    private final String email;
    private final int age;
    private final Date regDate;
    private String postcode;
}
// 과거 마이바티스 3.4 이전 버전은 getter,setter, 기본생성자 없으면 오류 발생.
// -> 현재 버전은 문제 없이 정상 실행