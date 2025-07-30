/*
* 🔥제약 조건 constraint - 테이블에 저장되는 데이터가 `요구사항에 대한 부적절한 값`을 갖지 않도록 규정.
 * 	   : 제약조건은 create table 할 때 속성에서 설정.
 *     : 이미 만들어져 있는 테이블에 제약조건 추가할 때에는 alter table로 속성 변경		
 * 
 * 1) 반드시 값이 있어야한다.(필수 입력)	NULL 허용안함. - NOT NULL
 * 2) 같은 값을 가질수 없다.				UNIQUE (유일한) - NULL 값은 가능함. -> 검색 Index 를 만든다.
 * 3) 입력값 검사						CHECK - NULL값은 가능함
 * -------------------------
 * 4) 기본키 :  PRIMARY KEY ✅ 테이블의 행을 식별(구별)  
                테이블에서 기본키는 '1개'입니다. 단, 여러개 컬럼을 묶어서 1개의 기본키 설정은 가능합니다.
 *            where 기본키컬럼=값;	조건실행 헀을 때 1개의 행 조회됩니다.
 * 			  자동으로 인덱스(색인)로 생성이됩니다. 
 * 			  인덱스는 검색(조회) 속도 향상시키는 방법입니다.
 * 			   ✅ 기본키는 NOT NULL 과 UNIQUE 2가지 제약조건에 해당합니다.
 * 			  기본키는 테이블에서 1개만 가능합니다. 
 *            단, 기본키는 구성하는 컬럼은 1개 이상 (2개,3개...) 가능합니다.
 * 5) 외래키 : FOREIGN KEY 테이블 간의 참조를 위해서 사용합니다. (다음 예제에서 확인합니다.)
 * 			 외래키는 테이블 1개에서 여러 개 만들어질 수 있습니다.
 * 	
 * 자바 단어장의 요구사항(테이블 속성 제약조건)
 - idx 는 행을 식별하는 기본키
 - english는 고유값 + 널 허용 안함
 - korean 는 널 허용 안함
 - step은 1~3범위의 값
*/

CREATE TABLE tbl_javadict (
		idx number(10) PRIMARY KEY,
		english varchar2(100) NOT NULL UNIQUE,  
		korean varchar2(500) NOT NULL,    										  
		step char(1) CHECK (step BETWEEN '1' AND '3')		
);

show autocommit;
set AUTOCOMMIT ON; --autocommit IMMEDIATE(즉각 변경 반영)


--정상적인 행 추가
INSERT INTO tbl_javadict VALUES (
		1,
		'public',
		'공용의',
		'1'
);

-- ORA-01400: cannot insert NULL into ("C##IDEV"."TBL_JAVADICT"."IDX")
INSERT INTO tbl_javadict (ENGLISH ,KOREAN)
	   VALUES ('private','사적인');	
INSERT INTO tbl_javadict (IDX, ENGLISH ,KOREAN)
	   VALUES (2,'private','사적인');	
    --    ORA-00001: unique constraint (C##IDEV.SYS_C007302) violated(위반)
INSERT INTO tbl_javadict (IDX, ENGLISH ,KOREAN)
	   VALUES (2,'private','공용의');	

-- 정상 실행 
INSERT INTO tbl_javadict(idx,english,korean,step) VALUES (
		3,
		'deprecated',
		'비난하다.반대하다.',
		'3'
);	  
--오류 ORA-02290: check constraint (C##IDEV.SYS_C007301) violated
INSERT INTO tbl_javadict VALUES (
		4,
		'list',
		'목록',
		'4'
);	 
-- ORA-00001: unique constraint (C##IDEV.SYS_C007302) violated
-- number 3은 char로 자동 캐스팅
INSERT INTO tbl_javadict VALUES (
	1,
	'constraint',
	'제약사항',
	3 
);
--아래는 모두 정상 실행
INSERT INTO tbl_javadict VALUES (
	6,
	'order',
	'순서',
	1
);

INSERT INTO tbl_javadict VALUES (
	7,
	'main',
	'주요한',
	1
);

INSERT INTO tbl_javadict VALUES (
	8,
	'order',
	'순서',
	1
);

INSERT INTO tbl_javadict VALUES (
	9,
	'reverse',
	'반대로',
	2
);

INSERT INTO tbl_javadict VALUES (
	10,
	'double',
	'이중의',
	1
);

