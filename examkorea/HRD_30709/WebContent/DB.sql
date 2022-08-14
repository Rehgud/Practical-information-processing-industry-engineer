-- 학생 테이블 member_tbl
create table member_tbl(
	id varchar2(5) primary key,
	name varchar2(20),
	gender varchar2(3)
);

insert into member_tbl values('10301', '권기현', '남');
insert into member_tbl values('10302', '구지우', '여');
insert into member_tbl values('10303', '권태준', '남');
insert into member_tbl values('10304', '금기연', '여');
insert into member_tbl values('10305', '김영진', '남');
insert into member_tbl values('10401', '김주현', '남');
insert into member_tbl values('10402', '김태민', '여');
insert into member_tbl values('10403', '임수민', '여');
insert into member_tbl values('10404', '남상도', '남');
insert into member_tbl values('10405', '조은호', '여');

select * from member_tbl;


-- 학생 점수 테이블 score_tbl
create table score_tbl(
	id varchar2(5) primary key,
	korean number(3),
	english number(3),
	math number(3),
	history number(3)
);

insert into score_tbl values('10301', 70, 80, 75, 95);
insert into score_tbl values('10302', 80, 73, 80, 85);
insert into score_tbl values('10303', 45, 75, 45, 75);
insert into score_tbl values('10304', 65, 75, 65, 65);
insert into score_tbl values('10305', 90, 100, 68, 95);
insert into score_tbl values('10401', 95, 75, 84, 60);
insert into score_tbl values('10402', 65, 70, 50, 94);
insert into score_tbl values('10403', 80, 60, 100, 80);
insert into score_tbl values('10404', 64, 50, 40, 65);
insert into score_tbl values('10405', 55, 70, 80, 75);

select * from score_tbl;



-- 학생조회
select
id ,
name ,
substr(id, 1, 1) year ,
substr(id, 2, 2) class ,
substr(id, 4, 2) no ,
gender
from member_tbl;

-- 학생 성적 조회
select
m.id ,
m.name ,
substr(id, 1, 1) year ,
substr(id, 2, 2) class ,
substr(id, 4, 2) no ,
m.gender
s.korean ,
s.math ,
s.english ,
s.history ,
(s.korean + s.english + s.math + s.hisory) as sum ,
(s.korean + s.english + s.math + s.history) / 4 as avg ,
rank() over (order by(s.korean + s.math + s.english + s.history) desc) as rank
from member_tbl m, score_tbl s
where
m.id = s.id and m.id = sch_id
order by 11 desc;

SELECT 
	  A.ID
	, A.NAME
	, SUBSTR(A.ID, 1, 1) AS YEAR
	, SUBSTR(A.ID, 2, 2) AS CLASS
	, SUBSTR(A.ID, 4, 2) AS NO
	, A.GENDER
	, B.KOREAN
	, B.MATH
	, B.ENGLISH
	, B.HISTORY
	, (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) AS SUM
	, (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) / 4 AS AVG
	, RANK() OVER (ORDER BY (B.KOREAN + B.MATH + B.ENGLISH + B.HISTORY) DESC) AS RANK
FROM 
	MEMBER_TBL A, SCORE_TBL B
WHERE
	A.ID = B.ID AND A.ID = sch_id
ORDER BY
	11 DESC;

