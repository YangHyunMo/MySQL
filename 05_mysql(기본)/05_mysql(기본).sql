-- 문제1. tabledb 데이터베이스를 생성하세요.(만일, 이미 존재한다면 삭제하세요.)
drop database if exists tabledb;
create database tabledb;
use tabledb;

-- 문제2. 다음 컬럼을 가지는 usertbl 테이블을 만드세요.
drop table if exists usertbl;

create table usertbl(
	userid 		char(8) 	not null primary key,
    name 		varchar(10) not null,
    birthyear 	int 		not null,
    addr 		char(2) 	not null,
    mobile1 	char(3) 	null,
    mobile2 	char(8) 	null,
    height 		smallint 	null,
    mDate 		date 		null
);

-- 문제3. 다음 컬럼을 가지는 buytbl 테이블을 만드세요.
drop table if exists buytbl;

create table buytbl(
	num int not null primary key auto_increment,
    userid char(8) not null,
    prodname char(6) not null,
    groupname char(4) null,
    price int not null,
    amount smallint not null,
    foreign key(userid) references usertbl(userid)
    );
    
-- 문제4. 회원 테이블에 다음 데이터를 입력하세요.
insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

-- 문제5. 구매 테이블에 다음 데이터를 입력하세요.
insert into buytbl values(null, 'KBS', '운동화', NULL, 30, 2);
insert into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1 );
insert into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);
-- 구매 테이블의 userid는 회원 테이블을 참조하는 외래키인데 회원 테이블 내에 'JYP'가 없다.

-- 문제6. 다음 컬럼을 가지는 usertbl을 정의하세요.(기존 usertbl이 존재하는 경우 삭제함 / 기본키는 테이블 레벨에서 정의하고 제약조건명을 함께 지정함)
drop table if exists buytbl;
drop table if exists usertbl;

create table usertbl(
    userid char(8) not null,
    name varchar(10) not null,
    birthyear int not null,
    constraint primary key pk_usertbl_userid(userid)
    );
    
-- 문제7. 다음 컬럼을 가지는 prodTbl 을 정의하세요.(기존 prodTbl이 존재하는 경우 삭제함)
drop table if exists prodtbl;

create table prodtbl(
	prodCode char(3) not null,
    prodID char(4) not null,
    prodDate datetime not null,
    proCur char(10) null,
    constraint pk_prodtbl_procode_prodid
    primary key(prodcode, prodid)
    );
    
-- 문제8. usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의하세요.
use sqldb;
create view v_usertbl as select u.userid, u.name, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from usertbl u
    inner join buytbl b on u.userid = b.userid;

-- 문제9. 위에서 정의한 뷰에서 userid가 '김범수'인 데이터만 출력하세요.
select * from v_usertbl where name = '김범수';