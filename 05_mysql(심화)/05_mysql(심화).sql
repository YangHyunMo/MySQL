-- 문제1. 다음 컬럼을 가지는 userTBL과 buyTBL을 정의하세요.
use tabledb;

-- userTBL
drop table if exists usertbl;

create table usertbl(
    userid char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null
);

-- buyTBL(ALTER를 이용해 userID를 외래키로 수정하세요.)
drop table if exists buytbl;

create table buytbl(
	num int not null primary key auto_increment,
    userid char(8) not null,
    prodname char(6) not null
);
alter table buytbl 
	add constraint fk_usertbl_buytbl
    foreign key(userid) 
    references usertbl(userid);
    
-- 문제2. 다음 조건을 만족하는 userTBL 테이블을 정의하세요.(기존 buyTBL, userTBL을 삭제하세요.)
drop table if exists buytbl, usertbl;

create table usertbl(
	userid char(8) not null primary key,
    name varchar(10) not null,
    birthyear int not null,
    email char(30) null unique
);

-- 문제3. 다음 조건을 만족하는 userTBL 테이블을 정의하세요.(기존 userTBL을 삭제하세요. / 기본값 추가를 확인할 수 있는 데이터를 추가하세요.)
drop table if exists usertbl;

create table usertbl(
	userid 		char(8) 	not null primary key,
    name 		varchar(10) not null,
    birthyear 	int 		not null default -1,
    addr 		char(2) 	not null default '서울',
    mobile1 	char(3) 	null,
    mobile2 	char(8) 	null,
    height 		smallint 	null	 default 170,
    mDate 		date 		null
);

insert into usertbl values('LHL', '이혜리', default, default, '011', '1234567', default, '2023.12.12');
insert into usertbl(userid, name) values('KAY', '김아영');
insert into usertbl values('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');
select * from usertbl;

-- 문제4. 앞에서 만든 userTBL에 대해서 다음 조건을 처리하도록 수정하세요.(mobile1 컬럼 삭제 / name 컬럼명을 uName으로 변경 / 기본키 제거)
alter table usertbl
	drop column mobile1;
    
alter table usertbl
	change column name uname varchar(20) null;

alter table usertbl
	drop primary key;
    
-- 문제5. 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요.
use employees;

create view EMPLOYEES_INFO 
as 
select e.*, t.title, t.from_date as t_from, t.to_date as t_to, s.salary, s.from_date as s_from, s.to_date as s_to
from employees e
inner join titles t on e.emp_no = t.emp_no
inner join salaries s on t.emp_no = s.emp_no;

select * from EMPLOYEES_INFO;

-- 문제6. EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.
select * from EMPLOYEES_INFO where s_to = '9999-01-01';

-- 문제7. 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요.
create view EMP_DEPT_INFO 
as 
select de.emp_no, d.*, de.from_date, de.to_date
from dept_emp de
left outer join departments d on de.dept_no = d.dept_no;

select * from EMP_DEPT_INFO;

-- 문제8. EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.
create view EMP_DEPT_INFO 
as
select de.emp_no, d.*, de.from_date, de.to_date
from dept_emp de
inner join departments d on de.dept_no = d.dept_no;

select * from EMP_DEPT_INFO order by emp_no;

-- 문제9. EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.
select * from EMP_DEPT_INFO where to_date = '9999-01-01';