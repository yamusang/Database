SELECT * FROM tbl_customer#, tbl_buy WHERE tbl_customer#.customer_id = tbl_buy.customer_id AND age>=30;

SELECT email FROM tbl_customer# WHERE customer_id = 'twice';

SELECT pname FROM tbl_product WHERE category = 'A2';

SELECT MAX(price) FROM tbl_product;

SELECT SUM(quantity) FROM tbl_buy WHERE pcode = 'JINRMn5';

SELECT * FROM tbl_buy WHERE customer_id = 'mina012';

SELECT * FROM tbl_buy WHERE pcode LIKE '%0%';

SELECT * FROM tbl_product WHERE pcode LIKE UPPER('%on%');

--선생님
SELECT tbl_buy WHERE LOWER(pcode) LIKE '%on%';

SELECT tc.customer_id, tc.name, tb.buy_date FROM tbl_customer# tc, tbl_buy tb WHERE tc.customer_id = tb.customer_id AND TO_CHAR(tb.buy_date,'yyyy')='2024';

SELECT * FROM tbl_customer# tc JOIN tbl_buy tb ON tc.customer_id = tb.customer_id AND TO_CHAR(tb.BUY_DATE,'yyyy')='2024';--선생님

SELECT pname, price, price*quantity FROM tbl_product tp, tbl_buy tb WHERE tp.pcode = tb.pcode AND customer_id = 'twice';

SELECT tp.pcode,tp.pname, tp.price, tp.price*tb.quantity AS "구매금액" FROM tbl_product tp JOIN tbl_buy tb ON tp.pcode = tb.pcode AND tb.customer_id='twice';--선생님

--구매 행(건수) 중에서 구매 금액이 가장 높은 것을 찾아보자. 10번 문제에 customer_id 컬럼 추가 조회
--오라클 FETCH 명령이 있습니다. (12c 버전 이상)
--FETCH는 결과 행 집합을 커서로 접근할 수 있습니다.(first, last 등...)
SELECT tp.pcode,tp.pname, tp.price, tp.price*tb.quantity AS "구매금액" FROM tbl_product tp JOIN tbl_buy tb ON tp.pcode = tb.pcode ORDER BY "구매금액" desc FETCH FIRST 1 ROWS ONLY;

--문제 추가 : pcode 별로 수량 합계가 가장 높은 순서대로 rank 구하기

SELECT RANK() OVER(ORDER BY SUM(quantity)desc) as "rnk", SUM(tb.quantity) FROM tbl_product tp JOIN tbl_buy tb ON tp.pcode = tb.pcode GROUP BY pcode; 
commit;
--선생님
--1단계
SELECT pcode, sum(quantity)
FROM tbl_buy
GROUP BY pcode;

--2단계 ROW

select pcode, 
sum(quantity) as "sum",
rank() over (order by sum(quantity) desc) as "rnk"   -- rank 구하는 값이 sum() 함수 결과값.
from TBL_BUY
GROUP BY pcode;




--문제 추가
--1) 년도별 구매 건수 집계하기
SELECT TO_CHAR(buy_date,'yyyy'), count(quantity) FROM tbl_buy GROUP BY TO_CHAR(buy_date,'yyyy');

--선생님
SELECT EXTRACT(YEAR FROM buy_date) AS "년도", COUNT(*) AS "건수"
FROM tbl_buy tb
GROUP BY EXTRACT(YEAR FROM buy_date)
ORDER BY "년도";
--2) 년도별 and pcode 상품별(년도가 같을 때) 구매 건수 집계하기
SELECT TO_CHAR(tb.buy_date,'yyyy'), tb.pcode, tp.pname, quantity FROM tbl_buy tb JOIN tbl_product tp ON tb.pcode=tp.pcode GROUP BY tp.pname;

--선생님
SELECT EXTRACT(YEAR FROM buy_date) AS "년도", PCODE, COUNT(*) AS "년도/상품건수"
FROM tbl_buy tb
GROUP BY EXTRACT(YEAR FROM buy_date),pcode
ORDER BY "년도",pcode;
