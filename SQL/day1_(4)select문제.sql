/* select 문제와 답*/


------------------- 김유나
-- 1. volume - weight 가 200 이상인 자동차
SELECT * FROM TBL_CARCO2
        WHERE VOLUME - WEIGHT > 200;

--2. volume이 1100~1300 사이인 자동차
SELECT * FROM TBL_CARCO2
        WHERE VOLUME BETWEEN 1100 AND 1300;

--3. 모델명에 C로 시작하는 자동차
SELECT * FROM TBL_CARCO2
        WHERE LOWER(MODEL) LIKE 'c%';

--4. VOLUME, WEIGHT, CO2 평균 값이 700 이상인 자동차
SELECT * FROM TBL_CARCO2
        WHERE (VOLUME+WEIGHT+CO2)/3 > 700;

--5. S로 시작하는데 CO2가 95 이상인 자동차
SELECT * FROM TBL_CARCO2
        WHERE MODEL LIKE 'S%' AND CO2 >= 95;

--6. WEIGHT가 홀수인 자동차
SELECT * FROM TBL_CARCO2
        WHERE MOD(WEIGHT, 2) = 1;

--7. 길이가 7글자 이상인 자동차
SELECT * FROM TBL_CARCO2
        WHERE LENGTH(CAR) >= 7;

-------------------  김준우
-- 1. MODEL 에 "!" 가 들어가는 컬럼 조회
SELECT * FROM TBL_CARCO2 
       WHERE MODEL LIKE '%!%';

-- 2. CAR 에 i 가 들어가지만 MODEL 에는 i가 안들어가는 컬럼 조회
SELECT * FROM TBL_CARCO2 
       WHERE CAR LIKE '%i%' and MODEL NOT LIKE '%i%';

-- 3. Hyundai I20 보다 VOLUME이 크고 CO2가 적은 컬럼 조회
SELECT * FROM TBL_CARCO2
        WHERE VOLUME > 1100 and CO2 <99;

-- 4. VOLUME 평균(1615) 이상인 컬럼 조회
SELECT * FROM TBL_CARCO2
        WHERE VOLUME > 1615;

-- 5. MODEL에 -Class가 들어가는 컬럼 조회
SELECT * FROM TBL_CARCO2 
       WHERE MODEL LIKE '%-Class%';

-- 6. CO2 평균(101) 미만인 컬럼 조회
SELECT * FROM TBL_CARCO2
        WHERE CO2 < 101;

-- 7. CAR 에 H로 시작하는 컬럼 조회
SELECT * FROM TBL_CARCO2 
        WHERE CAR LIKE 'H%' ;

-------------------  임정수
-- 1. volume 이 1500 이상인 모든 컬럼 조회
SELECT * FROM TBL_CARCO2 WHERE VOLUME >= 1500;

-- 2. 조건문, F로 시작하고 weight가 1300 이상인 모든 컬럼 조회
SELECT * FROM TBL_CARCO2 WHERE CAR LIKE 'F%' AND WEIGHT >= 1300; 

-- 3. volume 이 1600 인 컬럼을 제외하고 조회
 SELECT * FROM TBL_CARCO2 
        WHERE VOLUME NOT IN (1600); 

-- 4. car에 a 알파벳이 추가된 컬럼을 조회 
SELECT * FROM TBL_CARCO2
       WHERE CAR LIKE '%a%';

-- 5. model에서 Mondeo 이전의 컬럼 조회
SELECT * FROM TBL_CARCO2 
      WHERE MODEL < 'Mondeo';

-- 6. co2가 96 이상 101 이하이고 e 알파벳이 들어간 컬럼을 조회
SELECT * FROM TBL_CARCO2
        WHERE CO2 >= 96 AND CO2 <= 101 AND CAR LIKE '%e%';

-- 7. model 중의 a로 끝나는 컬럼 조회
SELECT * FROM TBL_CARCO2
       WHERE MODEL LIKE '%a';

-------------------  곽수영
 -- 1. volume 이 2100 이상인 모든 컬럼 조회
 SELECT * FROM TBL_CARCO2 WHERE volume >= 2100;

 -- 2. co2 가 110 이상인 모든 칼럼 조회
 SELECT * FROM TBL_CARCO2 WHERE CO2 >= 110;

 -- 3. model 중 'C' 가 들어가는 모든 칼럼 조회
 SELECT * FROM TBL_CARCO2 WHERE MOELD LIKE '%C%';

 -- 4. weight 가 1100 보다 작은 모든 칼럼
 SELECT * FROM TBL_CARCO2 WHERE WEIGHT < 1100;

 -- 5. weight 가 1100 이하인 칼럼 중 co2 가 99 인 칼럼
 SELECT * FROM TBL_CARCO2 WHERE WEIGHT <= 1100 AND CO2 = 99;

 -- 6. car 가 'S' 로 시작하는 칼럼 중 volume 이 1200 보다 큰 칼럼
 SELECT * FROM TBL_CARCO2 WHERE CAR LIKE 'S%' AND VOLUME > 1200;

 -- 7. car 중 T ~ Z 사이 단어로 시작하는 칼럼
 SELECT * FROM TBL_CARCO2 WHERE CAR BETWEEN 'T%' AND 'Z%';

-------------------  임민수
--배기량(Volume) 1500이상인 데이터를 모두 조회
SELECT * FROM TBL_CARCO2 WHERE volume >= 1500;

--배기량(Volume) 1500이상인 차량 모델을 모두 조회
SELECT * FROM TBL_CARCO2 WHERE MODEL LIKE 'A%' AND VOLUME >= 1500;

--Co2배출양 100이하인 모델명 I의 차량을 모두 조회
SELECT * FROM TBL_CARCO2 WHERE MODEL LIKE 'I%' AND CO2 <= 100;

-- 차량 모델들의 글자수를 알아보기
SELECT UPPER(CAR), LENGTH(MODEL) FROM TBL_CARCO2 ;

-- 알파벳 H로 시작하는 차량 모델 모두 조회
SELECT * FROM TBL_CARCO2 WHERE CAR LIKE 'H%';

-- H로 시작하는 차량회사만 빼고 조회
 SELECT * FROM TBL_CARCO2 WHERE CAR NOT LIKE 'H%'; 
 --포드만 조회
SELECT * FROM TBL_CARCO2 WHERE CAR ='Ford';
-------------------  김민재
-- 1. 자동차사가 Audi인 데이터를 나열하시오.
SELECT * FROM TBL_CARCO2
       WHERE CAR = 'Audi';

-- 2. Co2가 100이하인 데이터를 나열하시오.
SELECT * FROM TBL_CARCO2
       WHERE CO2 < 100;

-- 3. WEIGHT가 1500을 초과하는 MODEL을 구하시오.
SELECT MODEL FROM TBL_CARCO2
       WHERE WEIGHT > 1500;

-- 4. MODEL이 A로 시작하거나 A로 끝나는 차량의 VOLUME과 MODEL을 구하시오.
SELECT VOLUME, MODEL FROM TBL_CARCO2
       WHERE MODEL LIKE '%A%';

-- 5. VOLUME이 1600~1900인 차량의 데이터를 구하시오.
SELECT * FROM TBL_CARCO2
       WHERE VOLUME BETWEEN 1600 AND 1900;

-- 6. CO2가 99인 자동차사 명을 구하시오.
SELECT CAR FROM TBL_CARCO2
       WHERE CO2 IN 99;

-- 7. VOLUME이 2000이상이며 WEIGHT가 1500미만 CO2가 100미만인 차량모델을 구하시오.
SELECT MODEL FROM TBL_CARCO2
       WHERE VOLUME >= 2000 AND WEIGHT < 1500 AND CO2 < 100;

-------------------  양상민
--TBL_CARCO2 에 모델이 도요타 데이터 찾기
SELECT * FROM TBL_CARCO2 
WHERE MODEL = 'Aygo';
--카로고에 볼룸이 1500 이하 같은거 찾기
SELECT * FROM TBL_CARCO2 WHERE VOLUME >= 1500;
--  : model 값이 알파벳 d 로 시작하는 행을 조회
SELECT * FROM TBL_CARCO2 WHERE MODEL LIKE 'M%';

--between , in 연산
SELECT * FROM TBL_CARCO2
WHERE CO2 IN(95,99,105);

SELECT * FROM TBL_CARCO2
WHERE MODEL LIKE 'A1%';
-- 조건식 사용 연산 : <, > , <=, >= , and ,or 
SELECT * FROM TBL_CARCO2
WHERE MODEL > 'Audi';
-- 일부 행추출 1)전체 행 (조건이 없을떄)2)조건에 맞는행
SELECT * FROM TBL_CARCO2
WHERE C02 > 95;
SELECT * FROM TBL_CARCO2
WHERE MODEL BETWEEN 6 AND 9;

-------------------  오승현
-- 차량 전체의 평균 CO2 배출량을 구하고, 소수점 둘째 자리까지 반올림하여 출력하시오.
SELECT ROUND(AVG(co2), 2) AS avg_co2 FROM tbl_carco2;

-- 모든 차량의 배기량(volume)을 1000으로 나눈 값을 정수로 출력하시오. 
SELECT car, model, FLOOR(volume / 1000) AS volume_liter FROM tbl_carco2;

-- 모든 차량의 모델명 길이를 계산하여 함께 출력하시오.
SELECT model, LENGTH(model) AS model_length FROM tbl_carco2;

-- 모든 차량의 제조사 이름을 소문자로 변환하여 출력하시오.
SELECT LOWER(car) AS car_lower FROM tbl_carco2;

-- 모든 차량의 CO2 배출량에 대해, 절댓값 기준 100과의 차이를 계산해서 출력하시오.
SELECT car, model, co2, ABS(co2 - 100) AS ANSWER FROM tbl_carco2;

-------------------  박노준(index 컬럼을 정의, 테이블명 )

-- 모든 차량 정보를 조회해오게
SELECT * FROM TBL_CARDATA;

-- 모든 차량의 제조사만 긁어오시게
SELECT car FROM TBL_CARDATA;

-- 차량 제조사와 모델명을 함께 출력하시게
SELECT car, model FROM TBL_CARDATA;

-- 인덱스값이 21인 차량의 정보를 출력해오게
SELECT * FROM TBL_CARDATA WHERE idx = 21;

-- 제조사가 Ford인 차량 정보를 조회해오시게
SELECT * FROM TBL_CARDATA WHERE car = 'Ford';

-- 제조사가 'Mercedes'인 차량을 부분 문자열로 포함한 차량들을 찾아보시게
SELECT * FROM TBL_CARDATA WHERE car LIKE '%Mercedes%';

-- 제조사가 A로 시작하는 차량을 골라오시게
SELECT * FROM TBL_CARDATA WHERE car LIKE 'A%';
