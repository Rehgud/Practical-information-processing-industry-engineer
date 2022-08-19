-- 투표이력테이블 명세서 tbl_vote_202005
create table tbl_vote_202005(
	v_jumin char(13) primary key,
	v_name varchar2(20),
	v_no char(1),
	v_time char(4),
	v_area char(20),
	v_confirm char(1)
);

insert into TBL_VOTE_202005 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');

insert into TBL_VOTE_202005 values('99010110002', '김유권', '1', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values('89010110003', '이유권', '2', '0930', '제1투표장', 'N');
insert into TBL_VOTE_202005 values('69010110004', '박유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('59010110005', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110006', '조유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110007', '최유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('59010110008', '지유권', '1', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('49010110009', '장유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110010', '정유권', '3', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110011', '강유권', '5', '0930', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110012', '신유권', '4', '1330', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110013', '오유권', '1', '1330', '제1투표장', 'Y');
insert into TBL_VOTE_202005 values('69010110014', '현유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110015', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110016', '유유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110017', '한유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('89010110018', '문유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110019', '양유권', '2', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('99010110020', '구유권', '4', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110021', '황유권', '5', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('69010110022', '배유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('79010110023', '진유권', '3', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('90101100024', '고유권', '1', '1330', '제2투표장', 'Y');
insert into TBL_VOTE_202005 values('59010110025', '권유권', '3', '1330', '제2투표장', 'Y');

select * from tbl_vote_202005;

alter table tbl_vote_202005 modify v_area char(25);

-- 후보자테이블 명세서 TBL_MEMBER_202005
create table tbl_member_202005(
	m_no char(1) primary key,
	m_name varchar2(20),
	p_code char(2),
	p_school char(1),
	m_jumin char(13),
	m_city varchar2(20)
);

insert into tbl_member_202005 values('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202005 values('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

select * from tbl_member_202005;

-- 정당코드테이블 명세서 tbl_party_202005
create table tbl_party_202005(
	p_code char(2) primary key,
	p_name varchar2(20),
	p_indate date,
	p_reader varchar2(20),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4)
);

insert into tbl_party_202005 values('P1', 'A정당', '20100101', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values('P2', 'B정당', '20100201', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values('P3', 'C정당', '20100301', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values('P4', 'D정당', '20100401', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values('P5', 'E정당', '20100501', '임대표', '02', '1111', '0005');

select * from tbl_party_202005;


-- 휴보조회

select * from TBL_VOTE_202005;

						select
						m.m_no ,
						m.m_name ,
						p.p_name ,
						case
						when m.p_school = '1' then '고졸'
						when m.p_school = '2' then '학사'
						when m.p_school = '3' then '석사'
						when m.p_school = '4' then '박사'
						else 'NULL' end as school ,
						substr(m.m_jumin, 1, 6) as jumin1 ,
						substr(m.m_jumin, 7, 7) as jumin2 ,
						m.m_city ,
						p.p_tel1, p.p_tel2, p.p_tel3
						from tbl_member_202005 m, tbl_party_202005 p
						where m.p_code = p.p_code ;
						
						select
						v_name, v_jumin, m_no, v_time, v_confirm 
						from tbl_vote_202005 
						where v_area = '제1투표장';
						

select
m.m_no ,
m.m_name ,
count(case when v.v_confirm = 'Y' then '확인' end ) as rank
from tbl_member_202005 m, tbl_vote_202005 v
where m.m_no = v.v_no
group by m.m_no , m.m_name
order by rank desc;