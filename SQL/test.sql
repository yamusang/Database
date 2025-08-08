SELECT tc.name, 
       SUM(tb.quantity) AS 총수량,
       SUM(tp.price * tb.quantity) AS 총금액
FROM TBL_CUSTOMER# tc
JOIN TBL_BUY tb ON tc.customer_id = tb.customer_id
JOIN TBL_PRODUCT tp ON tb.pcode = tp.pcode
GROUP BY tc.name;


SELECT customer_id, COUNT(*) AS 구매건수
FROM TBL_BUY
WHERE TO_CHAR(buy_date, 'yyyy') = '2024'
GROUP BY customer_id
HAVING COUNT(*) >= 2;


SELECT pcode, 
       SUM(quantity) AS 총수량,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS 순위
FROM TBL_BUY
GROUP BY pcode;


SELECT tp.pname, tp.price * tb.quantity AS 구매금액
FROM TBL_BUY tb
JOIN TBL_PRODUCT tp ON tb.pcode = tp.pcode
WHERE tb.customer_id = 'mina012';


SELECT tb.customer_id, tp.pname, tp.price * tb.quantity AS 구매금액
FROM TBL_BUY tb
JOIN TBL_PRODUCT tp ON tb.pcode = tp.pcode
ORDER BY 구매금액 DESC
FETCH FIRST 1 ROWS ONLY;


SELECT EXTRACT(YEAR FROM buy_date) AS "년도", PCODE, COUNT(*) AS "년도/상품건수"
FROM tbl_buy tb
GROUP BY EXTRACT(YEAR FROM buy_date),pcode
ORDER BY "년도",pcode;