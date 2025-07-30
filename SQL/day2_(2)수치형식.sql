-- 정수 또는 실수 수치 형식
-- 데이터 타입 number  
--      : 자바 정수와 실수 타입 형식 지정  
-- number(정밀도 n ,소수점이하 자리수 m) 
--      : 정밀도 지정 안하면 데이터에 따라 저장공간 할당. 최대 38자리(자바 BigDecimal)
--      : 정수와 실수 모두 가증

-- number 테스트 테이블
CREATE TABLE tbl_number(
	xcol NUMBER,	 
	ycol NUMBER(5),			-- 정수로 최대 5자리(소수점 이하 없음.-소수점 이하 반올림). m=0 입니다.
	zcol NUMBER(7,2),		-- 전체 자리수 최대 7자리, 소수점 이하 2자리(고정). NUMBER(n,m) n>m 인 경우
	zcol2 NUMBER(2,5)
-- NUMBER(n,m) n<m 인 경우 : 소수점이하 최대 5자리(0이 3개 고정) , 0아닌 유효 숫자 최대 2자리. 
);
commit;
show autocommit;
set AUTOCOMMIT ON;

-- 유효 숫자 : 1000(모든 0이 유효함.)   00100 (1 앞에 0 2개는 유효 숫자가 아님)
            -- 0.0001 (모든 0이 유효함.)0.000100(1 뒤에 0 2개는 유효 숫자가 아님)
INSERT INTO tbl_number(xcol) values (12345);
INSERT INTO tbl_number(xcol) values (123456);
INSERT INTO tbl_number(xcol) values (12345.789);

INSERT INTO tbl_number(ycol) values (12345);
INSERT INTO tbl_number(ycol) values (123456); --오류
INSERT INTO tbl_number(ycol) values (12345.789); ---정상실행. 반올림을 정수값 12346 표시

INSERT INTO TBL_NUMBER(zcol) values (12345.67);
INSERT INTO TBL_NUMBER(zcol) values (1245.6);    -- 1245.60
INSERT INTO TBL_NUMBER(zcol) values (1245.454);  -- 1245.45
INSERT INTO TBL_NUMBER(zcol) values (123456.454);  --오류(정수 포함 전체 자리수 초과)

-- zcol2 NUMBER(2,5)  : 소수점 이하 자리수 항상 5개,
-- 5-2 =3은 유효한 0의 갯수(고정값) 
INSERT INTO TBL_NUMBER (zcol2) values (0.00034);
INSERT INTO TBL_NUMBER (zcol2) values (0.00345);-- 오류
INSERT INTO TBL_NUMBER (zcol2) values (0.0003);

INSERT INTO TBL_NUMBER (zcol2) values (0.23); -- 오류
INSERT INTO TBL_NUMBER (zcol2) values (0.000378); --0.00038