--DML:SELECT, INSERT, UPDATE, DELETE
-- 테이블의 행을 대상으로 하는 명령어

-- insert into 테이블명(컬럼명1, 컬럼명2,...) values (값1, 값2, ....)

--update 테이블 이름 set 컬럼명1 = 값1, 컬럼명2=값2,... where 조건식;
--            조건에 맞는 행의 컬럼명1, 컬럼명2 값을 값1, 값2로 변경
--delete from 테이블 이름 where 조건식;
--주의 : update와 delete는 where 없이 사용하면 위험..!!!!!

--insert, update, delete는 변경ㅇ사항에 대해 바로 테이블에 반영(commit) 하지 않고
-- 트랜잭션 관리차원에서 commit 명령어로 수행하는게 바람직!!!
-- rollback은 마지막 commit 후에 실행한 DML을 취소(되돌리기) 합니다.
-- 트랜잭션 : 하나의 논리적인 업무를 수행하는 단위(여러개의 DML 명령으로 구성)
--atocommit 설정이 false이면 다른 세션(클라이언트-sqlplus, dbeaver,... ) 
--            ㄴ commit 하기전까지 변경된 데이터를 확인할 수 없습니다.(반영❌)
CREATE TABLE tbl_student(
    stuno CHAR(7) PRIMARY KEY, --학번
    name VARCHAR2(30) NOT NULL, -- 이름
    age NUMBER CHECK(age BETWEEN 10 AND 30),
    address VARCHAR2(100)
);
--null이 허용되는 컬럼은 ? age, address

INSERT INTO tbl_student(stuno,name) VALUES('2025003','김모모');
INSERT INTO tbl_student(stuno,name) VALUES('2025004','최사나');
INSERT INTO tbl_student(stuno,name) VALUES('2025005','이하니');

SELECT * FROM tbl_student; --커밋 전이지만 insert와 같은 세션이므로 조회
-- 테이블에 직접 가서 데이터 탭을 확인하면 행 추가 안되어있음.(세션이 다름.)
COMMIT;
UPDATE tbl_student SET age=21 WHERE stuno='2025003';
SELECT * FROM tbl_student WHERE stuno='2025003'; -- 변경 내용 확인
--rollback 되돌리기
ROLLBACK;
SELECT * FROM tbl_student WHERE stuno='2025003'; -- 변경 내용 확인
--2차 커밋
UPDATE tbl_student SET age=21 WHERE stuno='2025003';
COMMIT;
--2차 커밋 후에 delete
DELETE FROM tbl_student WHERE stuno='2025004';
DELETE FROM tbl_student WHERE stuno='2025005';
SELECT * FROM tbl_student;
ROLLBACK;