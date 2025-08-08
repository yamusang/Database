-- 조인 : 테이블의 컬럼을 합치는 작업
--행연산 : 행단위를 대상으로 하는 작업
-- UNION(합집합), INTERSECT(교집합), MINUS(차집합)

SELECT customer_id
FROM tbl_customer#
UNION 
SELECT customer_id
FROM tbl_buy;

SELECT customer_id
FROM tbl_customer#
INTERSECT 
SELECT customer_id --자동으로 중복 제거하고 연산
FROM tbl_buy;

-- 구매 이력이 있는 고객
SELECT customer_id
FROM tbl_customer# --4명 고객
MINUS
SELECT customer_id --자동으로 중복 제거하고 연산. 3명 고객
FROM tbl_buy;