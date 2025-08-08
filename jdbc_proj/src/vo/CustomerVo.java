package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//VO(Value Object)
//값을 저장하는 목적으로 정의된 클래스. 불변성 반영하려면 final 등 추가 코드가 필요.
// ㄴ tbl_customer# 데이터베이스 테이블의 행 값 하나는 VO 객체에 저장.
@Getter
@Setter
@ToString
@AllArgsConstructor // 모든 프로퍼티값 초기화하는 생성자 코드
public class CustomerVo {
    private String customerId; // rs.getString()
    private String name;
    private String email;
    private int age;// rs.getInt()
    private Date regDate; // rs.getDate()

}

// ORM 프레임웍을 사용하면 기본생성자, setter 가 필요합니다.