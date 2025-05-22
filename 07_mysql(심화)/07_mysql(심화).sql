-- [문제 1] 다음과 같이 데이터베이스를 준비하세요
CREATE DATABASE jdbc_ex;

drop user 'scoula'@'localhost';
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON jdbc_ex.* TO 'scoula'@'%';
FLUSH PRIVILEGES;
SELECT * FROM mysql.user;