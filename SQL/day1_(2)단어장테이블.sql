/*
 * 자바에서 파일에 저장했었던 '단어장' 을 위한 테이블 만들기
 * 
 * 0. 테이블 이름 : tbl_javaword
 * 1. 테이블 컬럼(속성) : 
 * 			idx (순서)               : number
 * 			english (영어 키워드)     : varchar2(100)
 * 			korean (한글 뜻)         : varchar2(500)
 * 			step (수준,레벨)         : char(1)
 * 
 * 2. insert 명령으로 샘플값(행)을 추가
             INSERT INTO 테이블명(컬럼명 나열) VALUES (값 나열);
 */
-- 1) DDL 
-- 새로운 테이블 tbl_javaword 이름으로 만들기(속성,컬럼 정의)
CREATE TABLE tbl_javaword (
		idx number(10),
		english varchar2(100),   --varchar2는 가변길이. 최대 100바이트
		korean varchar2(500),    --										  최대 500바이트
		step char(1)						 -- char 는 고정길이. 반드시 1바이트
);

-- 2) DML
-- insert : 행(row) 추가
-- insert 형식1 : 컬럼명 안쓸때는 모든 컬럼을 지정.값은 '모든값을 컬럼 정의 순서대로' 나열
INSERT INTO TBL_JAVAWORD VALUES (
		1,
		'public',
		'공용의',
		'1'
);
-- insert 형식2 : 선택적으로 컬럼이름 지정할 수 있습니다.
INSERT INTO TBL_JAVAWORD (ENGLISH ,KOREAN)
	   VALUES ('private','사적인');	
-- 값이 없는 컬럼 idx,step 은 null 상태 입니다.	  

INSERT INTO TBL_JAVAWORD(idx,english,korean,step) VALUES (
		3,
		'deprecated',
		'비난하다.반대하다.',
		'3'
);	  
	  
INSERT INTO TBL_JAVAWORD VALUES (
		4,
		'list',
		'목록',
		'2'
);	 
INSERT INTO TBL_JAVAWORD VALUES (
	5,
	'constraint',
	'제약사항',
	3
);

INSERT INTO TBL_JAVAWORD VALUES (
	6,
	'order',
	'순서',
	1
);

INSERT INTO TBL_JAVAWORD VALUES (
	7,
	'main',
	'주요한',
	1
);

INSERT INTO TBL_JAVAWORD VALUES (
	8,
	'order',
	'순서',
	1
);

INSERT INTO TBL_JAVAWORD VALUES (
	9,
	'reverse',
	'반대로',
	2
);

INSERT INTO TBL_JAVAWORD VALUES (
	10,
	'double',
	'이중의',
	1
);
/*
			insert, update ,delete 는 테이블의 데이터를 추가/수정/삭제로 변경작업입니다.
			autocommit 이 false 일 때는 바로 반영이 안됩니다.
			commit 명령어로 변경완료해야 합니다.
*/
commit;


-- 데이터 조회 : SELECT 명령어로 지정된 컬럼 또는 행을 추출(검색)
/*
 *   select 컬럼1,컬럼2,...
 *   from 테이블명
 *   [where 컬럼명=값 (조건식)]
 */

-- 모든 컬럼 (*) 과 모든 행(where 없음) 가져오기
SELECT * FROM TBL_JAVAWORD ;

-- 모든 행의 '일부' 컬럼 추출
SELECT english FROM TBL_JAVAWORD ;   -- 전체 행 english 컬럼 조회
SELECT english,STEP  FROM TBL_JAVAWORD ;  -- 전체 행 english,STEP 컬럼 조회

-- 일부 행 추출 : 1) 전체 행(조건이 없을 때)  2) 조건에 맞는 행 
SELECT * FROM TBL_JAVAWORD      -- 모든 컬럼
		 WHERE step > 2;        -- 조건식. 조건에 일치하는 행 추출     

-- 예시 1 : idx 값이 4인 행을 조회
SELECT * FROM TBL_JAVAWORD 
		 WHERE idx=4;
		
-- 예시 2 : idx 값이 null 인 행을 조회. null 값은 = 아니고 is 로 조회
SELECT * FROM TBL_JAVAWORD 
		 WHERE idx IS null;		  
		 
-- 예시 3 : english 값이 'private' 인 행을 조회
SELECT * FROM TBL_JAVAWORD 
		 WHERE ENGLISH ='private';
		
-- 예시 4 : korean 값에 '반대' 포함한 문자열.  
-- (like와 %) 	LIKE '반대%'  는 '반대'로 시작하는 , LIKE '%반대' 는 '반대'로 끝나는 조건
SELECT * FROM TBL_JAVAWORD 
		 WHERE KOREAN LIKE '%반대%';

-- 예시 5 : english 값이 알파벳 d 로 시작하는 행을 조회	
SELECT * FROM TBL_JAVAWORD 
		 WHERE ENGLISH LIKE 'd%';
		
-- 조건식 사용 연산 : <, > , <=, >= , and ,or 
SELECT * FROM TBL_JAVAWORD 
		WHERE ENGLISH > 'public';   -- 사전순으로 'public' 뒤의 단어
		
		
-- between , in 연산
 SELECT * FROM TBL_JAVAWORD  
 		 WHERE idx BETWEEN 6 AND 9;
  -- idx >=6 and idx <=9 		
		
 SELECT * FROM TBL_JAVAWORD 
 		 WHERE idx IN (4,7,9);  
  -- idx=4 or idx=7 or idx=9		

-- not 연산
 SELECT * FROM TBL_JAVAWORD  
 		 WHERE idx NOT BETWEEN 6 AND 9;

 SELECT * FROM TBL_JAVAWORD 
 		 WHERE idx NOT IN (4,7,9); 

 SELECT * FROM TBL_JAVAWORD 
 		 WHERE idx IS NOT NULL;
 				
-- 크다,작다 연산 null 값은 제외.
SELECT * FROM TBL_JAVAWORD 
 				WHERE idx > 5;
SELECT * FROM TBL_JAVAWORD 
 				WHERE idx <= 5;	

-- 2개 이상의 컬럼으로 조건식 만들기 가능합니다. : and, or
SELECT * FROM TBL_JAVAWORD 
		WHERE ENGLISH LIKE 'd%' AND step =1;
 			
-- 문자열 함수 : length, upper, lower, substr , replace, instr...
-- 컬럼 값에 적용하여 조회하기. 
-- 함수 실행 결과로 새로운 컬럼이 만들어 집니다. as 를 사용하여 컬럼의 별칭을 정합니다.
select english from TBL_JAVAWORD;
SELECT english , UPPER(english) as "대문자", LENGTH(english) as "길이"
	FROM TBL_JAVAWORD ;


-- 내일 설명
--  where 조건을 활용하는 명령 : update, delete
--  데이터의 수정 update 

UPDATE TBL_JAVAWORD 
SET IDX =2,STEP ='1'   -- 변경할 컬럼이름=값, 나열
WHERE IDX IS NULL ;    -- 변경할 행의 조건식

UPDATE TBL_JAVAWORD 
SET step='2'
WHERE ENGLISH = 'public';  -- 값은 대소문자 구분합니다.

UPDATE TBL_JAVAWORD 
SET step='1'
WHERE idx BETWEEN 3 AND 5;

-- 행의 삭제 (컬럼만 삭제하는 것은 테이블 구조 변경)
DELETE FROM TBL_JAVAWORD 
	WHERE idx BETWEEN 3 AND 5;

-- update, delete 에 where 없이 사용하는 것은 위험한 작업
--			ㄴ 조건에 맞는 컬럼 또는 행에 적용되어야 합니다.

-- 전체 데이터 삭제 : rollback 못함.
TRUNCATE TABLE TBL_JAVAWORD ;

show autocommit; 			   -- 현재 상태 OFF

ROLLBACK;      -- 방금한(?) 명령(insert, update, delete 명령을 취소.)