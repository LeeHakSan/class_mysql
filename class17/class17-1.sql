use employees;
show tables;

desc employees;
desc salaries;
desc titles;
desc departments;
desc dept_emp;
desc dept_manager;

select * from salaries;
-- employees, salaries : 현재 유효한 연봉 기준으로 연봉이 높은 순서대로 출력하세요
select 
	e.emp_no, 
    e.first_name, 
    e.last_name,
    s.salary
from employees e
inner join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
order by s.salary desc;

-- JOIN 후 WHERE 필터를 사용할 수 있음 (사후 필터) 

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no and t.to_date = '9999-01-01'
join salaries s on e.emp_no = s.emp_no and s.to_date = '9999-01-01';

-- JOIN 문법에서 ON 절 뒤에 AND 를 붙여 조인 조건과 필터를 한 번에 걸 수 있음
-- (사전 필터), 인라인 필터
-- 공식 명칭 : 조인 조건

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no 
join salaries s on e.emp_no = s.emp_no
where t.to_date = '9999-01-01'
	and s.to_date = '9999-01-01';

-- inner join 에서는 사전 필터 결과 값과 사후 필터 결과 값이 동일함

select * from departments;
select * from dept_manager;
select * from dept_emp;

-- 한 사원이 여러 부서의 관리자가 될 수 있다(드물지만), 
-- 한 부서에는 시간의 흐름에 따라서 여러명의 사원이 거쳐갈 수 있다
-- 문제 3번
-- employees 테이블 필요
-- departments d 

-- left join 에서 사전 필터링 사용
select 
	e.emp_no,
    e.first_name
   -- d.dept_name,
   -- dm.from_date
from employees e 
left join dept_manager dm on e.emp_no = dm.emp_no and dm.to_date = '9999-01-01'
inner join departments d on dm.dept_no = d.dept_no;


-- 사후 필터로 수정
select 
	e.emp_no,
    e.first_name
   -- d.dept_name,
   -- dm.from_date
from employees e 
left join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01';

-- 아우터 조인을 사용할 때 (left join) 사후 필터로 적용 하게 되면 left join의 의미가 없어짐 
-- 즉 inner join을 사용한 결과와 같다 
-- 실무에서 90% 이상 실수 하는 부분

-- 즉 아우터 필터를 적용할 때는 사후필터(x) 사전 필터(O) 를 사용해서 아우터 조인의 특성을 살림 


select * from titles;
select * from employees;
select * from salaries;
select * from titles;
select * from titles;



-- 4.

select * 
from employees
where gender = 'F' and hire_date > '1991-01-01'
order by hire_date asc;

-- 5.

select 
	e.emp_no,
	e.first_name,
    e.last_name,
    s.salary,
    t.title
from employees e
	join titles t on e.emp_no = t.emp_no
	join salaries s on e.emp_no = s.emp_no
where 
	t.title like '%Senior%' 
	and s.salary > 100000 
	and e.first_name like 'Ram%'
    and t.to_date = '9999-01-01';

-- 6.

select 
	e.emp_no,
	e.first_name,
    e.last_name,
    t.from_date,
    t.to_date
from 
	employees e
	join titles t on e.emp_no = t.emp_no
where 
	e.first_name like 'S%'
	and t.to_date <= '1990-01-01';

-- 7.

select *
from 
	employees e
where 
	e.birth_date between '1960-01-01' and '1969-12-31'
	and gender = 'F';

-- 8.

select 
	e.emp_no,
	e.first_name,
    e.last_name,
    s.salary
from 
	employees e
	join salaries s on e.emp_no = s.emp_no
where 
	e.last_name like 'J%'
	and s.to_date = '9999-01-01';

-- 9. 

select 
	e.emp_no 사원번호,
    e.gender 성별,
    s.salary 현재연봉
from 
	employees e
join 
	salaries s on e.emp_no = s.emp_no
where 
	e.emp_no <= 10020 
	and s.to_date = '9999-01-01' 
order by 
	e.emp_no asc;
    
-- 10. 

select 
	e.emp_no,
	e.first_name,
    d.dept_name
from 
	employees e
	join dept_emp de on e.emp_no = de.emp_no
	join departments d on de.dept_no = d.dept_no
where 
	de.to_date = '9999-01-01';




