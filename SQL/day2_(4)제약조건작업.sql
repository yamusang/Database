/* 이미 만들어진 제약조건 확인하기
DBMS는 사용자(개발자)가 만든 테이블 등 여러 정보(메타데이터)를 저장하는 시스템 테이블이 있습니다.
--> USER_CONSTRAINTS, USER_CONS_COLUMNS 테이블은 오라클이 만든 시스템 테이블 ⭕'딕셔너리 뷰'라고 부릅니다.
*/
-- USER_CONSTRAINTS 테이블 : 사용자가 만든 테이블의 제약조건 정보를 저장
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='TBL_JAVADICT';
-- WHERE TABLE_NAME='TBL_JAVADICT'; 는 해당 테이블의 제약조건이 없으므로 조회 결과 없습니다.

-- USER_CONS_COLUMNS 테이블 : 사용자가 만든 테이블의 제약조건이 있는 속성 정보를 저장
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_JAVADICT';
/*✅2. 제약 조건 적용을 변경하기
* ALTER TABLE 명령어로 합니다.
* ALTER TABLE 는 이미 있ㄴㄴ 테이블의 구조를 변경할 때 사용합니다.
*
*/

--연습 테이블 만들기 : 기존 테이블 복사합니다.

CREATE TABLE tbl_javadict2
AS SELECT * FROM TBL_JAVADICT

-- 데이터 확인 : ⭕속성 이름과 타입, 데이터 행이 복사되었습니다.
SELECT * FROM TBL_JAVADICT2;

--제약조건 복사????? : NOT NULL 만 복사가 되었습니다.


--제약조건 unique, pk, u, check 는 복사가 안됩니다.
--제약 조건 추가하기 : ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건 이름 <제약조건 내용>
--                  제약조건은 우리가 정해줍니다. ALTER
ALTER TABLE tbl_javadict2 ADD CONSTRAINT pk_javadict2 PRIMARY KEY (idx);
ALTER TABLE tbl_javadict2 ADD CONSTRAINT uk_english UNIQUE (english);
ALTER TABLE tbl_javadict2 ADD CONSTRAINT chk_step CHECK (step BETWEEN '1' AND '3');

--이미 만들어진 제약조건 제거하기
ALTER TABLE tbl_javadict2 DROP CONSTRAINT pk_javadict2;

--제약조건 이름을 오라클이 만들도록 할 수 있습니다.(CONSTRAINT pk_javadict2 생략)
ALTER TABLE tbl_javadict2 ADD PRIMARY KEY (idx);

--tbl_javadict3 테이블 만듭니다. tbl_javadict와 동일하게 합니다.
--단, 제약조건 이름을 직접 정의하는 형식으로 해보세요.(PK,UNIQUE,CHECK)

CREATE TABLE tbl_javadict3 (
		idx number(10),
		english varchar2(100) NOT NULL,  
		korean varchar2(500) ,    										  
		step char(1),
        CONSTRAINT nn_javadict3_kor CHECK (KOREAN IS NOT NULL),
        CONSTRAINT pk_javadict3_idx PRIMARY KEY(idx),
        CONSTRAINT uq_javadict3_eng UNIQUE (english),
        CONSTRAINT chk_step_step CHECK (step BETWEEN '1' AND '3')
);

commit;
DROP TABLE tbl_javadict3;