DBC(Java Database Connectivity)
자바에서 데이터베이스와 연결하고 데이터를 주고받을 수 있도록 해주는 자바 API

자바에서 SQL 문을 실행하고 결과를 처리할 수 있도록 해주는 표준 인터페이스
다양한 DBMS(예: MySQL, Oracle 등)와 상관없이'일관된 방식'으로 데이터베이스에 접근 가능 ㄴ DBMS 에 상관없이 동일한 인터페이스와 구현 메소드 사용함. ㄴ ✔ 실제 구현 클래스는 드라이버 (라이브러리) 에 포함되어 있음. 오라클 드라이버 라이브러리 경로 : C:\app\Class01\product\18.0.0\dbhomeXE\jdbc\lib 드라이버 파일명 : ojdbc8.jar
자바의 java.sql 패키지에 포함되어 있음
 ㄴ java.sql패키지의 인터페이스들을 구현한 클래스 로드가 필요합니다.
 ㄴ oracle.jdbc.driver.OracleDriver 클래스는 자동 로딩.
 참고 : mysql의 드라이버 클래스는 com.mysql.jdbc.Driver입니다.

 ##SQL 실행

### 첫번째 테스트 SQL

```
INSERT INTO TBL_JAVAWORD(idx,english,korean,step) VALUES (
		33,'connection','연결. 접속','2'
);	  
```

## JDBC SQL 실행 과정

### 1. JDBC 드라이버 로딩
    - oracle.jdbc.driver.OracleDriver
### 2. 데이터베이스와 연결
    - 연결 결과로 Connection 타입 객체 생성
### 3. SQL문 작성 및 SQL 실행 객체 생성
- Statement 타입의 실행 객체 생성 
: SQL 실행에 필요한 값을 포함하여 SQL명령을 완성합니다.
:SQL이 실행될 때마다 파싱(parsing)

- PreparedStatement 타입의 실행 객체 생성 (🔥)
: SQL 실행에 필요한 값을 SQL 전달한 후에 설정할 수 있습니다.
:SQL 명령을 미리 파싱해 놓고 값만 나중에 바인딩(값의 대입)

- 참고 : 프로그래밍 언어는 컴파일 전에 명령문을 파싱(구문 분석)합니다.
   순서는 파싱 -> 컴파일 -> 실행