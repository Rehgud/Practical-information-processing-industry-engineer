-- 피자코드테이블 명세서 TBL_PIZZA_01
CREATE TABLE TBL_PIZZA_01(
	PCODE CHAR(4) PRIMARY KEY,
	PNAME VARCHAR2(30),
	COST NUMBER(7)
);

DROP TABLE TBL_PIZZA_01;

INSERT INTO TBL_PIZZA_01 VALUES('AA01', '고른골졸라피자', 6000);
INSERT INTO TBL_PIZZA_01 VALUES('AA02', '치즈피자', 6500);
INSERT INTO TBL_PIZZA_01 VALUES('AA03', '페페로니피자', 7000);
INSERT INTO TBL_PIZZA_01 VALUES('AA04', '콤비네이션피자', 7500);
INSERT INTO TBL_PIZZA_01 VALUES('AA05', '고구마피자', 6000);
INSERT INTO TBL_PIZZA_01 VALUES('AA06', '포테이토피자', 7000);
INSERT INTO TBL_PIZZA_01 VALUES('AA07', '불고기피자', 8000);
INSERT INTO TBL_PIZZA_01 VALUES('AA08', '나폴리피자', 8000);

SELECT * FROM TBL_PIZZA_01;

-- 지점코드테이블 명세서 TBL_SHOP_01
CREATE TABLE TBL_SHOP_01(
	SCODE CHAR(4) PRIMARY KEY,
	SNAME VARCHAR2(20)
);

INSERT INTO TBL_SHOP_01 VALUES('S001', '강남점');
INSERT INTO TBL_SHOP_01 VALUES('S002', '강서점');
INSERT INTO TBL_SHOP_01 VALUES('S003', '강동점');
INSERT INTO TBL_SHOP_01 VALUES('S004', '영동점');
INSERT INTO TBL_SHOP_01 VALUES('S005', '시청점');
INSERT INTO TBL_SHOP_01 VALUES('S006', '인천점');

SELECT * FROM TBL_SHOP_01;

DROP TABLE TBL_SHOP_01;

-- 매출정보테이블 명세서 TBL_SALELIST_01
CREATE TABLE TBL_SALELIST_01(
	SALENO NUMBER(7) PRIMARY KEY,
	SCODE CHAR(4),
	SALEDATE DATE,
	PCODE CHAR(4),
	AMOUNT NUMBER(5),
	CONSTRAINT TBL_SALELIST_SCODE_FK FOREIGN KEY(SCODE) REFERENCES TBL_SHOP_01(SCODE),
	CONSTRAINT TBL_SALELIST_PCODE_FK FOREIGN KEY(PCODE) REFERENCES TBL_PIZZA_01(PCODE)
);

DROP TABLE TBL_SALELIST_01;

insert into tbl_salelist_01 values(10001, 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA01', 50);
insert into tbl_salelist_01 values(10002, 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA02', 30);
insert into tbl_salelist_01 values(10003, 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA03', 20);
insert into tbl_salelist_01 values(10004, 'S001', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA04', 50);
insert into tbl_salelist_01 values(10005, 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA01', 40);
insert into tbl_salelist_01 values(10006, 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA02', 60);
insert into tbl_salelist_01 values(10007, 'S003', to_date('2018-12-03', 'yyyy-mm-dd'), 'AA04', 60);
insert into tbl_salelist_01 values(10008, 'S003', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA05', 70);
insert into tbl_salelist_01 values(10009, 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA01', 80);
insert into tbl_salelist_01 values(10010, 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA03', 30);
insert into tbl_salelist_01 values(10011, 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA04', 40);
insert into tbl_salelist_01 values(10012, 'S005', to_date('2018-12-02', 'yyyy-mm-dd'), 'AA05', 50);
insert into tbl_salelist_01 values(10013, 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA01', 30);
insert into tbl_salelist_01 values(10014, 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA02', 20);
insert into tbl_salelist_01 values(10015, 'S004', to_date('2018-12-04', 'yyyy-mm-dd'), 'AA06', 50);

SELECT * FROM TBL_SALELIST_01;

-- 통합매출현황조회
CREATE TABLE TBL_PIZZA_01(
	PCODE CHAR(4) PRIMARY KEY,
	PNAME VARCHAR2(30),
	COST NUMBER(7)
);
CREATE TABLE TBL_SHOP_01(
	SCODE CHAR(4) PRIMARY KEY,
	SNAME VARCHAR2(20)
);
CREATE TABLE TBL_SALELIST_01(
	SALENO NUMBER(7) PRIMARY KEY,
	SCODE CHAR(4),
	SALEDATE DATE,
	PCODE CHAR(4),
	AMOUNT NUMBER(5),
	CONSTRAINT TBL_SALELIST_SCODE_FK FOREIGN KEY(SCODE) REFERENCES TBL_SHOP_01(SCODE),
	CONSTRAINT TBL_SALELIST_PCODE_FK FOREIGN KEY(PCODE) REFERENCES TBL_PIZZA_01(PCODE)
);

select * from tbl_pizza_01;
SELECT
SL.SALENO, SP.SCODE, SP.SNAME, 
TO_CHAR(SL.SALEDATE, 'YYYY-MM-DD') SALEDATE,
P.PCODE, P.PNAME, SL.AMOUNT,
TO_CHAR(AMOUNT*COST, '999,999,999,999') COST
FROM TBL_PIZZA_01 P, TBL_SALELIST_01 SL, TBL_SHOP_01 SP
WHERE P.PCODE = SL.PCODE AND SP.SCODE = SL.SCODE
ORDER BY 1;

drop table tbl_salelist_01;

select sp.scode, sp.sname, to_char(sum(sl.amount*p.cost)) cost
from tbl_shop_01 sp, tbl_salelist_01 sl, tbl_pizza_01 p
where sp.scode = sl.scode and p.pcode = sl.pcode
group by sp.scode, sp.sname
order by 1;

select p.pcode, p.pname, 
to_char(sum(sl.amount*p.cost), '999,999,999,999') cost 
from tbl_pizza_01 p, tbl_salelist_01 sl, tbl_shop_01 sp 
where sp.scode = sl.scode
group by p.pcode, p.pname 
order by 3 desc;