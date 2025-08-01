/* day3_(5)DML.sql에서 만든 테이블
CREATE TABLE tbl_student(
    stuno CHAR(7) PRIMARY KEY, --학번
    name VARCHAR2(30) NOT NULL, -- 이름
    age NUMBER CHECK(age BETWEEN 10 AND 30),
    address VARCHAR2(100)
);
*/
-- 데이터 초기화
TRUNCATE TABLE tbl_student;
INSERT INTO tbl_student VALUES('2025003','김모모',23,'서울시');
INSERT INTO tbl_student VALUES('2025004','최사나',22,'수원시');
INSERT INTO tbl_student VALUES('2025005','이하니',25,'경기도');
INSERT INTO tbl_student VALUES('2023001','이사나',24,'서울시');
INSERT INTO tbl_student VALUES('2024004','박다현',21,'성남시');
SELECT * FROM tbl_student;
commit;

-- tbl_score : tbl_student와 참조관계인 자식테이블
-- 요구사항 : 학생 1명이 같은 과목을 여러번 수강할 수 있다.
CREATE TABLE tbl_score(
    idx NUMBER PRIMARY KEY,
    stuno CHAR(7) NOT NULL,                  --참조관계 컬럼과 형식 동일
    subject VARCHAR2(20) NOT NULL, --과목명 : 국어, 영어, 수학
    jumsu NUMBER NOT NULL,
    teacher VARCHAR2(100) NOT NULL,
    term CHAR(7) NOT NULL, --수강학기 : 2024_02
    FOREIGN KEY(stuno)
    REFERENCES              --참조테이블과 컬럼
        tbl_student(stuno)  --create table 현재 명령실행 전에 tbl_student 있어야 함.
);

-- 테이블 삭제 순서 : 자식 테이블 -> 부모 테이블
DROP TABLE tbl_student;
-- 오류 : 참조 관계 부모 테이블 삭제 못함. 
-- 해결방법 1) 자식테이블 삭제 2) FK 제약조건 삭제

--🔥참조관계 오류 발생하는 사례(무결성 제약 조건 위배)
-- ORA-02291: integrity constraint (C##IDEV.SYS_C007355) violated - parent key not found
INSERT INTO tbl_score VALUES (1,'2022001','국어',88,'김길동','2025_01');

--정상 실행
INSERT INTO tbl_score VALUES (2,'2023001','국어',88,'김길동','2025_01');
INSERT INTO tbl_score VALUES (3,'2025003','국어',90,'김길동','2025_01');
INSERT INTO tbl_score VALUES (4,'2025004','국어',99,'김길동','2025_01');
INSERT INTO tbl_score VALUES (5,'2023001','수학',84,'최수학','2024_02');
INSERT INTO tbl_score VALUES (6,'2025003','수학',70,'최수학','2025_01');
INSERT INTO tbl_score VALUES (7,'2024004','수학',91,'최수학','2024_02');
INSERT INTO tbl_score VALUES (8,'2025004','영어',90,'박영어','2025_01');
INSERT INTO tbl_score VALUES (9,'2025005','영어',95,'박영어','2025_01');
commit;

SELECT * 
FROM tbl_score
WHERE stuno='2025004';


-- 추가적인 인덱스 생성하기(학번 검색)
CREATE INDEX index_tblscore ON tbl_score  (stuno);

-- 시퀀스
CREATE SEQUENCE seq_score_idx
START WITH 10;

SELECT seq_score_idx.nextval FROM dual;