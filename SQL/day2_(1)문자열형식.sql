-- 문자열 형식 테스트
--    CHAR(길이) : 고정길이(고정길이는 지정된 만큼 기억공간을 차지합니다. ) 단위는 바이트 
--    VARCHAR(길이) : 오라클에서 존재하지만 사용하지 않는 예비자료형.
--    VARCHAR2(길이) : 가변형길이 단위 바이트, 길이는 최대길이이고 실제로 메모리는 데이터크기만큼 사용합니다.
--				  최대 4000바이트. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트
--          가변길이는 데이터크기만큼 기억공간 사용하고 최대 크기로 제한.

CREATE TABLE tbl_string(
	acol char(10),			-- 10 바이트 고정길이 : 데이터를 꼭 10바이트에 저장.
	bcol varchar2(10)		-- 10 바이트 가변길이 : 데이터 크기에 따라 정해진다.(최대 10바이트)
);

-- 자동 커밋 설정 : 아래 예제 insert 명령 후 즉시 테이블에 변경적용.
show autocommit;
set AUTOCOMMIT ON;


-- 실행하기 : insert  하나씩 확인해보세요.

-- 1) 고정길이 바이트로 지정된 컬럼
-- 고정길이 형식은 지정된 길이를 맞추기 위해 공백을 추가
INSERT INTO TBL_STRING (acol) VALUES ('abcd');
INSERT INTO TBL_STRING (acol) VALUES ('abcd123456');
INSERT INTO TBL_STRING (acol) VALUES ('abcd1234567');	-- 오류
INSERT INTO TBL_STRING (acol) VALUES ('가나');			-- 한글은 1글자가 3바이트
INSERT INTO TBL_STRING (acol) VALUES ('가나다');
INSERT INTO TBL_STRING (acol) VALUES ('가나다라');			-- 오류;

SELECT * FROM TBL_STRING  ;

--2) 가변길이 바이트로 지정된 컬럼
INSERT INTO TBL_STRING (bcol) VALUES ('abcd');
INSERT INTO TBL_STRING (bcol) VALUES ('abcd123456');
INSERT INTO TBL_STRING (bcol) VALUES ('abcd1234567');	-- 오류
INSERT INTO TBL_STRING (bcol) VALUES ('가나');			
INSERT INTO TBL_STRING (bcol) VALUES ('가나다');
INSERT INTO TBL_STRING (bcol) VALUES ('가나다라');		-- 오류

--참고 : 문자열의 단위를 문자 개수로 하는 NCHAR, NVARCHAR2 타입도 있습니다.