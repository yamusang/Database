--tbl_buy와 tbl_customer, tbl_buy와 tbl_product rkrrkr ckawhrhksrP dlfEo
-- 3개의 테이블 join 가능합니다.

SELECT tb.buy_seq,
tc.customer_id,
tc.name,
tp.pcode,
tp.pname,
tp.price*tb.quantity AS "구매금액"
FROM tbl_buy tb --자식 테이블을 from 뒤에 작성하기
JOIN tbl_customer# tc ON tb.customer_id = tc.customer_id
JOIN tbl_product tp ON tb.pcode = tp.pcode;

--3개 이상의 조인은 쿼리 성능을 떨어뜨릴 수 있습니다.
--대부분은 2개 테이블의 조인으로 요구사항을 처리할 수 있습니다.