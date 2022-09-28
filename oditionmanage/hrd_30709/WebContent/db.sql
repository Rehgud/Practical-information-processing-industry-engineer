--tbl_artist
create table tbl_artist(
	artist_id char(4) primary key,
	artist_name varchar2(20),
	artist_birth char(8),
	artist_gender char(1),
	talent char(1),
	agency varchar2(30)
);

insert into tbl_artist values('AA01', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist values('AA02', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist values('AA03', '왕스타', '19990301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist values('AA04', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist values('AA05', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

select * from tbl_artist;

--tbl_mento
create table tbl_mento(
	mento_id char(4) primary key,
	mento_name varchar2(20)
);

insert into tbl_mento values('J001', '함멘토');
insert into tbl_mento values('J002', '박멘토');
insert into tbl_mento values('J003', '장멘토');

select * from tbl_mento;

--tbl_point
create table tbl_point(
	serial_no number(8) primary key,
	artist_id char(4),
	mento_id char(4),
	point number(3)
);

insert into tbl_point values(2019001, 'AA01', 'J001', 78);
insert into tbl_point values(2019002, 'AA01', 'J002', 76);
insert into tbl_point values(2019003, 'AA01', 'J003', 70);
insert into tbl_point values(2019004, 'AA02', 'J001', 80);
insert into tbl_point values(2019005, 'AA02', 'J002', 72);
insert into tbl_point values(2019006, 'AA02', 'J003', 78);
insert into tbl_point values(2019007, 'AA03', 'J001', 90);
insert into tbl_point values(2019008, 'AA03', 'J002', 92);
insert into tbl_point values(2019009, 'AA03', 'J003', 88);
insert into tbl_point values(2019010, 'AA04', 'J001', 96);
insert into tbl_point values(2019011, 'AA04', 'J002', 90);
insert into tbl_point values(2019012, 'AA04', 'J003', 98);
insert into tbl_point values(2019013, 'AA05', 'J001', 88);
insert into tbl_point values(2019014, 'AA05', 'J002', 86);
insert into tbl_point values(2019015, 'AA05', 'J003', 86);

select * from tbl_point;

-- 참가자목록조회
select
artist_id,
artist_name,
substr(artist_birth, 1, 4) as year,
substr(artist_birth, 5, 2) as month,
substr(artist_birth, 7, 2) as day,
case
when artist_gender = 'F' then '여'
when artist_gender = 'M' then '남'
else 'NULL' end as artist_gender,
case
when talent = '1' then '보컬'
when talent = '2' then '댄스'
when talent = '3' then '랩'
else 'NULL' end as talent,
agency
from tbl_artist;

-- 멘토점수조회
select
p.serial_no,
a.artist_id,
a.artist_name,
substr(a.artist_birth, 1, 4) as year,
substr(a.artist_birth, 5, 2) as month,
substr(a.artist_birth, 7, 2) as day,
p.point,
case
when p.point >= 90 then 'A'
when p.point >= 80 then 'B'
when p.point >= 70 then 'C'
when p.point >= 60 then 'D'
else 'F' end as gradepoint,
m.mento_name
from tbl_artist a, tbl_mento m, tbl_point p
where a.artist_id = p.artist_id and m.mento_id = p.mento_id
order by 1;

-- 참가자 등수 조회
select
a.artist_id,
a.artist_name,
to_char(sum(p.point)) as sum_point,
to_char(sum(p.point)/count(*) , '999.00') as avg_point,
rank() over(order by sum(p.point) desc) as rank
from tbl_artist a, tbl_point p
where a.artist_id = p.artist_id
group by a.artist_id, a.artist_name ;