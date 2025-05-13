-- tbl_board의 데이터를 모두 출력하세요.
select * from tbl_board;

-- tbl_board의 데이터를 출력하세요. (단, no, title, writer만 출력함)
select no, title, writer from tbl_board;

-- tbl_board의 데이터 중 특정 작성자 한 명의 글만 출력하세요.
select * from tbl_board where writer = '양3';

-- 앞에서 작성한 3개의 SQL 문을 한 번에 실행하세요.