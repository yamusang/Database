-- 김유나
-- 문제 1번 : 브랜드 별로 평균 무게와 평균 co2 구하기
SELECT CAR, ROUND(AVG(WEIGHT)) AS "평균 무게", ROUND(AVG(CO2)) AS "평균 CO2" 
FROM TBL_CAR_CO2 
WHERE WEIGHT >= 1300 
GROUP BY CAR;

-- 문제 2번 : 브랜드 별로 등록 된 차량 개수와 co2 평균 구하기
SELECT CAR, MODEL, COUNT(*) AS "개수", ROUND(AVG(CO2)) AS "CO2 평균" 
FROM TBL_CAR_CO2 
GROUP BY CAR, MODEL 
HAVING AVG(CO2) <= 100 
ORDER BY CAR, MODEL;

-- 김준우
-- 문제 1: 자동차 브랜드 별로 WEIGHT최대 최소를 구하고 최솟값이 1000 초과이고 최댓값이 1450 초과 조회
SELECT CAR, MIN(WEIGHT) as "WEIGHT최소", MAX(WEIGHT) as "WEIGHT최대"
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING MIN(WEIGHT) > 1000 and MAX(WEIGHT) > 1450
ORDER BY "WEIGHT최소", "WEIGHT최대";

-- 문제 2: 자동차 브랜드 별로 VOLUME합계를 구하고 합계가 5000 이상 조회
SELECT CAR, SUM(VOLUME) as "VOLUME합계"
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING SUM(VOLUME) > 5000
ORDER BY "VOLUME합계";

-- 김민재
-- 문제 1 : CO2배출량이 100미만인 배기량별 WEIGHT 평균값을 구하고 
-- 평균값이 1000을 초과한 것 조회
SELECT VOLUME, AVG(WEIGHT)
FROM TBL_CAR_CO2
WHERE CO2 < 100
GROUP BY VOLUME
HAVING AVG(WEIGHT) > 1000;


-- 문제 2 : 자동차 브랜드에 a가 들어가는 브랜드별로 중량이 1200미만 조회
SELECT CAR, MIN(WEIGHT)
FROM TBL_CAR_CO2
WHERE CAR LIKE '%a%'
GROUP BY CAR
HAVING MIN(WEIGHT) < 1200;

-- 홍선아
-- 문제1: 각 브랜드마다 가장 낮은 CO2 값 조회
SELECT car, MIN(CO2) AS min_co2
FROM TBL_CAR_CO2
GROUP BY car
ORDER BY MIN(CO2); 

-- 문제2: 총 브랜드의 수 조회
SELECT COUNT(distinct car)
FROM TBL_CAR_CO2;   

-- 임정수
-- 문제 1 : 자동차 브랜드별로 VOLUME 평균을 구하고, 평균이 1500 이상인 브랜드만 조회
SELECT CAR, ROUND(AVG(VOLUME)) AS "VOLUME 평균"
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING AVG(VOLUME) >= 1500
ORDER BY ROUND(AVG(VOLUME));

-- 문제 2 : 브랜드별 차량 수를 구하고 차량 수가 2대 이상인 브랜드만 조회
SELECT CAR, COUNT(*) AS "차량 수"
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING COUNT(*) >= 2
ORDER BY COUNT(*);

-- 오승현
-- 문제 1: 자동차 브랜드별로 차량 무게(weight)의 평균이 1300 이상인 브랜드만 조회하고,
--         평균 무게 오름차순으로 정렬하시오.
SELECT car, AVG(weight) AS "평균 무게"
FROM TBL_CAR_CO2
GROUP BY car
HAVING AVG(weight) >= 1300
ORDER BY AVG(weight);

-- 문제 2: 자동차 브랜드별로 등록된 차량 수를 구하고,
--         차량이 2대 이상인 브랜드만 조회하되, 차량 수 내림차순으로 정렬하시오.
SELECT car, COUNT(*) AS "차량 수"
FROM TBL_CAR_CO2
GROUP BY car
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;


-- 곽수영
-- 문제 1: 자동차 브랜드 별 weight 최소값을 구하고 1200 이상 조회 후 값을 오름차순 정렬
SELECT car, MIN(WEIGHT)
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING MIN(WEIGHT) >= 1200
ORDER BY MIN(WEIGHT);

-- 문제 2: 자동차 브랜드 별 CO2 최대값을 구하고 100 미만인 값 내림차순 정렬
SELECT car, MAX(CO2)
FROM TBL_CAR_CO2
GROUP BY CAR
HAVING MAX(CO2) <100
ORDER BY MAX(CO2) DESC;

-- 임은상
--문제 1.
--weight의 평균이 1500~2000사이인 자동차의 차종과 volume과 weight의 평균 값
SELECT car, ROUND(AVG(volume)), ROUND(AVG(weight))
FROM tbl_car_co2
GROUP BY car
HAVING ROUND(AVG(weight)) BETWEEN 1000 AND 1300;

--문제 2.
-- 제조사의 이름에 o가 들어가고  volume이 1500보다 큰 차량의 차종과 co2의 평균, weight평균,volume의 평균 오름차순 정렬 컬럼의 이름은 "탄소배출량평균", "중량 평균","CC평균"
SELECT car, ROUND(AVG(co2)) AS "탄소배출량평균", ROUND(AVG(weight)) AS "중량 평균", ROUND(AVG(volume)) AS "CC평균"
FROM tbl_car_co2
WHERE car LIKE '%o%'
GROUP BY car
HAVING ROUND(AVG(volume))>1500
ORDER BY car ASC;

--문제 3.
--volume이 1500보다 큰 차량의 제조사 weight의 최대값, co2의 최소값, volume의 최대값
SELECT car,MAX(weight),MIN(co2),MAX(volume)
FROM tbl_car_co2
GROUP BY car
HAVING ROUND(AVG(volume))>1500;