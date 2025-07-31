/*
집계(통계) 함수 : count, sum, avg, max, min, 표준편차, 분산,
                테이블의 컬럼을 대상으로 실행되는 함수
                🔥tbl_car_co2 테이블에서는 합계, 평균, 최대, 최소값은 number컬럼인
                volume, weight, co2을 대상으로 테스트 할 수 있습니다.

집계함수를 사용할 때, 다른 컬럼을 조회 할 수 없습니다. -> 그룹화가 필요합니다.

*/
-- 1.count 함수
--  1)데이터의 전체 갯수 : count 함수는 컬럼지정 대신 *
SELECT COUNT(*) as "전체 갯수"
FROM tbl_car_co2;

-- 2)count(weight) 로 컬럼을 지정하면 null이 아닌 값만 카운트합니다.
UPDATE tbl_car_co2 
SET weight = null 
WHERE model = 'Up!'; --테스트 위해 null 값으로 변경

SELECT COUNT(weight) AS "NULL 제외 갯수"
FROM tbl_car_co2;

-- 3)count(distinct car)
SELECT distinct car FROM tbl_car_co2;

SELECT COUNT(DISTINCT car) AS "중복 제거 갯수"
FROM tbl_car_co2;
-- where 조건으로 갯수 구하기
SELECT COUNT(*) as 
FROM tbl_car_co2
WHERE weight<1000;

--오류 : 그룹화 해야함.
SELECT car, COUNT(*) AS "브랜드 갯수"
FROM tbl_car_co2
WHERE car='Ford';


-- 2. avg 평균
-- 1)CO2 평균
SELECT AVG(co2)
FROM tbl_car_co2;

--널 값이 있는 weight 컬럼 - 나누기9 => sum()/count(weight)
SELECT AVG(weight)
FROM tbl_car_co2;--1128

--2) 평균을 null값은 0으로 바꾸기 -나누기10 => sum()/count(*)
SELECT weight
FROM tbl_car_co2;

SELECT NVL(weight,0)
FROM tbl_car_co2;

SELECT AVG(NVL(weight,0))
FROM tbl_car_co2; --1015.2

SELECT ROUND(AVG(NVL(weight,0)), 0)
FROM tbl_car_co2;

SELECT AVG(co2),AVG(weight)
FROM tbl_car_co2;

-- 3. sum, min, max 테스트
SELECT SUM(weight)
FROM tbl_car_co2 WHERE co2 BETWEEN 90 AND 95;

SELECT MIN(volume)
FROM tbl_car_co2 WHERE car = 'Mercedes';

SELECT max(co2)
FROM tbl_car_co2 WHERE weight < 2000;

-- 참고 : 함수에 조건식 적용하기

SELECT COUNT(*) as 
FROM tbl_car_co2
WHERE weight<1000;

SELECT COUNT(*) as 
FROM tbl_car_co2
WHERE weight>=1000;

-- 위의 2개의 select를 대체하는 방식
SELECT SUM(CASE WHEN weight >= 1000 THEN 1 END), -- when 조건식 then 값
       SUM(CASE WHEN weight < 1000 THEN 1 END)
FROM tbl_car_co2;