CREATE TABLE TBL_GUEST(
	USERID CHAR(15) PRIMARY KEY,
	USERNM VARCHAR2(20) NOT NULL,
	PASSWD CHAR(10),
	JUMIN CHAR(13),
	GENDER CHAR(1),
	ADDRESS VARCHAR2(50),
	JOBCD NUMBER(1),
	MAILRCV CHAR(1),
	INTRO VARCHAR2(50)
);

INSERT INTO TBL_GUEST VALUES('seojm','서정만','s123!!','7003211157222','1','평택시 비전동 283',3,'Y','한국복지대학 교수');
INSERT INTO TBL_GUEST VALUES('kks','김규성','k345!!','6805011311111','1','수원시 영동구 그린아파트',2,'Y','삼성전자 부장');
INSERT INTO TBL_GUEST VALUES('shm','손흥민','s678!!','920401123222','1','서울시 여의동 23',3,'Y','토트넘 FC');
INSERT INTO TBL_GUEST VALUES('kds','김다솔','k222!!','0202213111222','2','수원시 영통구 111',1,'N','수원공고 학생');
INSERT INTO TBL_GUEST VALUES('khk','김연경','k007!!','970502231111','2','청주시 청원군 향군로 108',5,'N','육군 장교');

SELECT * FROM TBL_GUEST;


-- 회원 목록
SELECT USERID, USERNM,
SUBSTR(JUMIN, 1, 6) AS DATES,
CASE WHEN GENDER = '1' THEN '남'
WHEN GENDER = '2' THEN '여' 
ELSE 'NULL' END AS GENDER,
CASE WHEN JOBCD = 1 THEN '학생'
WHEN JOBCD = 2 THEN '회사원'
WHEN JOBCD = 3 THEN '군인'
WHEN JOBCD = 4 THEN '공무원'
WHEN JOBCD = 5 THEN '기타'
ELSE 'NULL' END AS JOB,
INTRO FROM TBL_GUEST ORDER BY GENDER;

" select userid, usernm, substr(jumin, 1, 6 ) as dates, 
CASE WHEN gender = '1' THEN '남' 
WHEN gender = '2' THEN '여' 
ELSE 'NULL' END as gender, 
CASE WHEN jobcd = 1 THEN '학생' 
WHEN jobcd = 2 THEN '회사원' 
WHEN jobcd = 3 THEN '군인' 
WHEN jobcd = 4 THEN '공무원' 
WHEN jobcd = 5 THEN '기타' 
ELSE 'NULL' END as job, 
intro from tbl_guest order by gender";