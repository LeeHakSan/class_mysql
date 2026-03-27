-- DCL - 권한을 관리함

-- 사용자 생성 (사람이나, 시스템에게 권한을 줄 수 있음)
create user 'user1'@'localhost' identified by 'password123';

-- 권한 설정 (조회 권한 부여)
grant SELECT on school.student to 'user1'@'localhost';

-- 권한 회수 (조회 권한 회수 school db에 student 테이블)
revoke select on school.student from 'user1'@'localhost';

-- 도전 문제
-- 외부 사용자가 사용할 계정을 생성하고 조회 권한만 주고 접속 확인
create user 'user'@'192.168.7.240' identified by 'password'; -- 호스트 생성
grant select on school.student to 'user'@'192.168.7.240'; -- 접근 권한 중 조회 권한 부여
revoke select on school.student from 'user'@'192.168.7.240'; -- 접근 권한 중 조회 권한 회수

create user 'tenco'@'localhost' identified by 'asd1234!';
create user 'tenco'@'%' identified by 'asd1234!'; -- %는 모든 IP 접근 허용

-- 2. 권한 부여 select, insert ... (추가 모든 권한 부여) all privileges
grant all privileges on school.* to 'tenco'@'localhost'; -- '*' RDBMS 안에 모든 DB 모든 테이블
grant all privileges on school.* to 'tenco'@'%'; -- '*' RDBMS 안에 모든 DB 모든 테이블

-- 권한 확인
show grants for 'tenco'@'localhost';
show grants for 'tenco'@'%';

-- 참고, 추가된 권한이 바로 적용 안 될 수 있음
flush privileges; -- 바로 적용

-- 3. 권한 회수
-- revoke ALL privileges on school.* from 'tenco'@'localhost';
-- revoke ALL privileges on school.* from 'tenco'@'%';



