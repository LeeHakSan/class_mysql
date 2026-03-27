-- 테이블　복사　쿼리
use employees;
select * from employees;

-- 기본 데이터를 테스트 할 때 값을 마구 변경하면 상용 서비스에 문제
-- 테스트를 먼저 하기 위해 복사를 하고 사용

-- 테이블 복사시 구조만 복사
create table tb_employees
AS select * from employees where 1 = 0;

select * from tb_employees;
drop table tb_employees;

-- 테이블 복사 시 구조 + 데이터 까지
create table tb_employees
AS select * from employees;

-- 1. employees DB 각 테이블 어떤 의미 인지 파악
-- 2. 스스로 배운 것에 한해 직접 문제 만들기 공유 (코드 공유에 올림)


-- employees 테이블에 있는 성별이 남자인 사람의 first_name, last_name을 조회 하시오
select 
	first_name, last_name
from 
	tb_employees
where 
	gender = 'M';

















