SELECT tc.customer_id, tc.name, tb.buy_date
FROM tbl_customer# tc --4개 행
JOIN tbl_buy tb --8개 행
ON tc.customer_id=tb.customer_id;

--예시로 고객 'wonder'는 구매가 없으므로 tbl_buy에 없어요.
--이럴 때 tbl_buy는 null 상태로 합치는 것이 외부 조인(left outer join 또는 right outer join)

SELECT * --tc.customer_id, tc.name, tb.buy_date
FROM tbl_customer# tc --
LEFT JOIN tbl_buy tb --left에 있는 테이블(대체로 부모테이블)의 모든 행을 포함.
ON tc.customer_id=tb.customer_id;

SELECT * --tc.customer_id, tc.name, tb.buy_date
FROM tbl_customer# tc --
RIGHT JOIN tbl_buy tb --right 에 있는 테이블의 모든 행을 포함. 부모 테이블이 아니므로 동등조인 결과
ON tc.customer_id=tb.customer_id;

SELECT * --tc.customer_id, tc.name, tb.buy_date
FROM tbl_customer# tc --
RIGHT JOIN tbl_buy tb --right 에 있는 테이블의 모든 행을 포함. 부모 테이블이 아니므로 동등조인 결과
ON tc.customer_id=tb.customer_id;

--구매 건수가 없는 고객을 조회하기

SELECT tc.customer_id,tc.name, tc.reg_date
FROM tbl_customer# tc
LEFT JOIN tbl_buy tb
ON tc.customer_id = tb.customer_id
WHERE tb.buy_seq IS NULL;

--외부 조인일 때에는 추가 조건은 where로 합니다. 외부 조인 후에 실행하도록 하기 위함.ALTER
-- 문제 요구사항이 구매 이력이 있는 모든 고객을 조회하기
--이럴 때는 조건만 where tb.buy_seq is not null
--더 간단한 조회는 JOIN 없이 구매 이력이 있는 고객 찾기

SELECT DISTINCT customer_id
FROM tbl_buy;