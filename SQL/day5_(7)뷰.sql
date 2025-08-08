/*
 *  뷰(view) 만들기 : create view 
 * 		- 가상 테이블
 * 		- 자주 사용하는 select 조회 결과를 미리 컴파일하여 오라클 뷰 객체로 저장
 * 		- 저장된 뷰는 select 조회 할 때 테이블처럼 모든 형식을 적용 
 * 		- 주로 join 등 복잡한 SQL 을 뷰로 만들어서 사용합니다.
 * 		- with 임시이름 as (select 쿼리) 은 영구 저장이 아닙니다.
 * 		- 가상 테이블이므로 insert, update, delete 제약이 많고 사용을 권하지 않음.
 * 
 *  뷰 생성 권한이 있어야 create view 실행 가능합니다.
 * 		- grant create view to c##idev;
 * 		- 권한 추가 후 디비버는 재연결 실행
 */

SELECT tp.pcode, tp.pname, tp.price*sale.salesum AS total
FROM TBL_PRODUCT tp 
JOIN 
  (
    SELECT PCODE, SUM(QUANTITY)  AS salesum 
    FROM TBL_BUY tb 
    GROUP BY PCODE 
    ORDER BY salesum DESC
  ) sale -- group by 결과 행 집합의 별칭(테이블 처럼 서브쿼리로 사용)
ON 	tp.pcode = sale.pcode
ORDER BY total DESC;

--위의 쿼리를 자주 사용한다면 미리 컴파일하여 view 객체로 만듭니다.
--그러면 좀 더 쿼리가 빠르고 단순해집니다.ALTER
-- view 생성은 create or replace 명령을 사용하여 수정이 필요할 때 drop 없이 다시 정의.

CREATE OR REPLACE VIEW v_final_sale
AS
    SELECT tp.pcode, tp.pname, tp.price*sale.salesum AS total
    FROM TBL_PRODUCT tp 
    JOIN 
    (
        SELECT PCODE, SUM(QUANTITY)  AS salesum 
        FROM TBL_BUY tb 
        GROUP BY PCODE 
        ORDER BY salesum DESC
    ) sale -- group by 결과 행 집합의 별칭(테이블 처럼 서브쿼리로 사용)
    ON 	tp.pcode = sale.pcode
    ORDER BY total DESC;

    -- 뷰를 사용하기

    SELECT * FROM V_FINAL_SALE;

    SELECT * FROM V_FINAL_SALE
    WHERE TOTAL > 100000;

    SELECT * FROM V_FINAL_SALE
    ORDER BY TOTAL desc;

    --프로그래머스 SQL 테스트에 많이 나옵니다.
    --참고 : nvl 함수, decode 함수, case~when~end (관계식 비교) 예시 찾아보세요.