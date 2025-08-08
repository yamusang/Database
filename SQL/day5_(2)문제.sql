--선생님꺼 다시 보기
DROP TABLE tbl_customer#;
DROP TABLE tbl_product;
DROP TABLE tbl_buy;
-- 고객 테이블
CREATE TABLE tbl_customer# (
	customer_id varchar2(20) PRIMARY KEY ,    
	name varchar2(20) NOT NULL,		   
	email varchar2(30),
	age number(3) default 0 ,		
	reg_date date 
);
-- 상품 테이블 
CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY ,
	category char(2) ,
	pname varchar2(50) NOT NULL,
	price number NOT NULL 
);
-- 구매테이블
CREATE TABLE tbl_buy(
	buy_seq number PRIMARY KEY ,		
	customer_id varchar2(20) NOT NULL ,			
	pcode varchar2(20) NOT NULL ,
	quantity number NOT NULL ,		
	buy_date timestamp
);
-- 외래키 추가
ALTER TABLE tbl_buy ADD 
CONSTRAINT fk_buy_customer
FOREIGN KEY (customer_id)				
			REFERENCES tbl_customer#(customer_id);	
		
ALTER TABLE tbl_buy ADD 	
CONSTRAINT fk_buy_pcode
	FOREIGN KEY (pcode)
			REFERENCES tbl_product(pcode);
			
--------------------------------내꺼
CREATE TABLE tbl_customer#(
    customer_id VARCHAR(20) NOT NULL PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR2(30) NOT NULL,
    age NUMBER(3,0),
    reg_date DATE DEFAULT sysdate
);

CREATE TABLE tbl_product(
    pcode VARCHAR2(20) PRIMARY KEY,
    category CHAR(2) NOT NULL,
    pname VARCHAR2(50),
    price NUMBER
);

CREATE TABLE tbl_buy(
    buy_seq NUMBER NOT NULL PRIMARY KEY,
    customer_id VARCHAR2(20) NOT NULL,
    pcode VARCHAR2(20) NOT NULL,
    quantity NUMBER NOT NULL,
    buy_date TIMESTAMP NOT NULL
);
CREATE SEQUENCE seq_tblbuy START WITH 2001;

ALTER TABLE tbl_buy ADD FOREIGN KEY (customer_id) REFERENCES tbl_customer#(customer_id);
ALTER TABLE tbl_buy ADD FOREIGN KEY (pcode) REFERENCES tbl_product(pcode);

INSERT INTO tbl_customer# VALUES ('mina012',  '김미나',  'kimm@gmail.com',  20,  TO_DATE('2025-03-10 14:23:25','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_customer# VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, TO_DATE('2023-10-21 11:12:23','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_customer# VALUES ('twice', '박모모', 'momo@daum.net', 29, TO_DATE('2024-12-25 19:23:45','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_customer# VALUES ('wonder', '이나나', 'lee@naver.com',NULL ,TO_DATE('2024-12-31 23:58:59','yyyy-mm-dd hh24:mi:ss'));

INSERT INTO tbl_product VALUES ('DOWON123a', 'B2', '동원참치선물세트', 54000);
INSERT INTO tbl_product VALUES ('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO tbl_product VALUES ('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO tbl_product VALUES ('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO tbl_product VALUES ('MANGOTK4r', 'A2', '애플망고 1kg', 32000);

INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'mina012' , 'CJBAb12g' , 5,TO_DATE('2024-07-15 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'mina012' , 'APLE5kg' , 2,TO_DATE('2024-11-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'mina012' , 'JINRMn5' , 2,TO_DATE('2025-02-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'twice' , 'JINRMn5' , 3 ,TO_DATE('2023-12-21 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'twice' , 'MANGOTK4r' , 2 ,TO_DATE('2025-01-10 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'hongGD' , 'DOWON123a' , 1 ,TO_DATE('2025-01-13 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'hongGD' , 'APLE5kg' , 1 ,TO_DATE('2024-09-09 14:33:15','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES (seq_tblbuy.nextval,'hongGD' , 'DOWON123a' , 1 ,TO_DATE('2025-01-13 09:33:15','yyyy-mm-dd hh24:mi:ss'));
commit;