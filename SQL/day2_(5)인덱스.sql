/*
오라클의 객체: 테이블,인덱스, 시퀀스, 뷰....
📌 인덱스(Index)란?
검색 속도 향상을 위한 자료구조. 오라클에서는 인덱스를 객체로 관리합니다.
테이블의 특정 컬럼 값을 정렬하고, 해당 값의 물리적 위치(포인터)를 저장
마치 책의 목차/찾아보기 처럼, 원하는 데이터를 빠르게 찾을 수 있게 해줌
일반적으로 B-Tree(이진트리)나 Hash Table 구조로 구현됨
인덱스가 없으면 전체 테이블 스캔이 발생해 성능 저하 가능

🔐 기본키(Primary Key)란?
테이블에서 각 행을 고유하게 식별하는 컬럼(또는 컬럼 조합)
자동으로 NOT NULL + UNIQUE 제약 조건이 적용됨
테이블당 하나만 설정 가능
기본키를 설정하면 DBMS가 자동으로 고유 인덱스(UNIQUE INDEX)를 생성함
오라클은 Unique 컬럼도 자동으로 인덱스를 만들어줍니다.

*/

SELECT * FROM tbl_javadict WHERE idx=2; --기본키 컬럼 검색(인덱스를 통해서 빠른 성능)

SELECT * FROM tbl_javadict WHERE english='order'; --인덱스가 없는 컬럼. 데이터가 많으면 검색 속도 저하

-- 새로운 연습. 기본키가 없는 테이블에 기본키 설정하기
-- PK의 자격 : Null 값이 없음. + Unique(고유성)
--           ㄴ model 컬럼이 있으나 충분하지 않다. (미래의 값이 예측이 안됨)
--           ㄴ 해결책 1 : 새로운 컬럼 idx 를 만든다. -> PK(다음 진도 시퀀스에서 합니다.)
--           ㄴ 해결책 2 : 기존 컬럼만으로 한다면 (car, model) 복합 컬럼으로 PK를 만든다.
ALTER TABLE tbl_carco2 ADD CONSTRAINT pk_carco2 PRIMARY KEY (car,model);

-- (car,model) 그룹으로 묶었을 때 같은 값이 있으면 기본키 설정 안됩니다.

SELECT * FROM tbl_carco2 ORDER BY car,model;

SELECT * FROM tbl_carco2 WHERE car='Hyundai' AND model='I20';

-- 인덱스를 기본키 컬럼 외에 추가적인 생성하기
--          unique 컬럼 대상.
--         중복된 값이 최소인 컬럼. 검색이 많은 컬럼.
-- 실제 검색에 korean 컬럼이 많이 쓰인다. unique 컬럼은 아니다.ㄴ.
SELECT * 
FROM tbl_javadict 
WHERE korean='순서';

CREATE INDEX index_javadict_kor ON tbl_javadict(korean);

--오라클 테이블 user_indexes 조회
SELECT *
FROM user_indexes
WHERE TABLE_NAME='TBL_JAVADICT';