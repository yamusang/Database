/*
NCS 교재 - 응용SW 기초기술 활용.pdf(page 81~86)
VS CODE 확장 : ERD Editor 설치
ERD 작성한 후 자동 생성된 SQL
*/

CREATE TABLE tbl_contract
(
  cont_no      NUMBER       NOT NULL,
  t_no         VARCHAR2(20) NOT NULL,
  cust_no      NUMBER       NOT NULL,
  rentOff_no   CHAR(3)      NOT NULL,
  start_hist   NUMBER       NOT NULL,
  returnOff_no CHAR(3)      NOT NULL,
  return_hist  NUMBER      NOT NULL,
  CONSTRAINT PK_tbl_contract PRIMARY KEY (cont_no)
);


CREATE TABLE tbl_customer
(
  cust_no    NUMBER         NOT NULL,
  cust_ident VARCHAR2(20)   NOT NULL,
  cust_type  VARCHAR2(20)  ,
  cust_tel   VARCHAR2(20)  ,
  cust_addr  NVARCHAR2(100),
  CONSTRAINT PK_tbl_customer PRIMARY KEY (cust_no)
);

CREATE TABLE tbl_office
(
  off_no  CHAR(3)       NOT NULL,
  address VARCHAR2(200) NOT NULL,
  tel     VARCHAR2(20)  NOT NULL,
  CONSTRAINT PK_tbl_office PRIMARY KEY (off_no)
);

CREATE TABLE tbl_truck
(
  t_no        VARCHAR2(20) NOT NULL,
  t_size      VARCHAR2(20) NOT NULL,
  t_lastMdate DATE        ,
  t_outdate   DATE        ,
  CONSTRAINT PK_tbl_truck PRIMARY KEY (t_no)
);



ALTER TABLE tbl_customer
  ADD CONSTRAINT UQ_cust_ident UNIQUE (cust_ident);
-- 외래키를 alter table로 한 이유 :
-- create table 안에서 foreign key 설정하면
-- 테이블 작성 순서 부모 테이블(사무소,차량,고객) -> 자식테이블(계약)

ALTER TABLE tbl_contract
  ADD CONSTRAINT FK_tbl_office_TO_tbl_contract
    FOREIGN KEY (rentOff_no)
    REFERENCES tbl_office (off_no);

ALTER TABLE tbl_contract
  ADD CONSTRAINT FK_tbl_office_TO_tbl_contract1
    FOREIGN KEY (returnOff_no)
    REFERENCES tbl_office (off_no);

ALTER TABLE tbl_contract
  ADD CONSTRAINT FK_tbl_truck_TO_tbl_contract
    FOREIGN KEY (t_no)
    REFERENCES tbl_truck (t_no);

ALTER TABLE tbl_contract
  ADD CONSTRAINT FK_tbl_customer_TO_tbl_contract
    FOREIGN KEY (cust_no)
    REFERENCES tbl_customer (cust_no);


COMMENT ON TABLE tbl_contract IS '계약';

COMMENT ON COLUMN tbl_contract.t_no IS '차량번호';

COMMENT ON COLUMN tbl_contract.cust_no IS '고객번호';

COMMENT ON COLUMN tbl_contract.rentOff_no IS '시작사무소번호';

COMMENT ON COLUMN tbl_contract.start_hist IS '시작주행거리';

COMMENT ON COLUMN tbl_contract.returnOff_no IS '종료사무소번호';

COMMENT ON COLUMN tbl_contract.return_hist IS '종료주행거리';




COMMENT ON TABLE tbl_customer IS '고객';

COMMENT ON COLUMN tbl_customer.cust_no IS '고객번호';

COMMENT ON COLUMN tbl_customer.cust_ident IS 'HP/사업자번호';

COMMENT ON COLUMN tbl_customer.cust_type IS '개인/법인';

COMMENT ON COLUMN tbl_customer.cust_tel IS '연락처';

COMMENT ON COLUMN tbl_customer.cust_addr IS '주소';



COMMENT ON TABLE tbl_office IS '사무소';

COMMENT ON COLUMN tbl_office.off_no IS '사무소번호';

COMMENT ON COLUMN tbl_office.address IS '사무소주소';

COMMENT ON COLUMN tbl_office.tel IS '사무소 전화번호';



COMMENT ON TABLE tbl_truck IS '차량';

COMMENT ON COLUMN tbl_truck.t_no IS '차량번호';

COMMENT ON COLUMN tbl_truck.t_size IS '차량유형';

COMMENT ON COLUMN tbl_truck.t_lastMdate IS '마지막정비일';

COMMENT ON COLUMN tbl_truck.t_outdate IS '등록말소일';

