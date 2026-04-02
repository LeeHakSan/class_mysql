-- 실습 1
-- 게시글 별 좋아요 수를 출력. 좋아요 없는 게시글도 출력 
-- 게시글 타이틀, 좋아요 수 

select * from post;

select p.title, count(l.id) as 좋아요수
from post p
left join like_log l on p.id = l.post_id
group by p.id, p.title;
-- having count(*);

-- 실습 2
-- 사용자별 작성 게시글 수, 게시글 하나도 작성 안 한 회원도 나와야함  
-- nickname, 작성글수 

select nickname, count(p.id) as 작성글수
from user u
left join post p on u.id = p.user_id
group by u.id;

-- 실습 3
-- 사용자별 평균 게시글 조회수 (단 2개 이상인 사람만)
-- 닉네임, 게시글 수, 평균 조회수 

select 
	u.nickname,
    count(p.id) as 게시글수,
    avg (view_count) as 조회수평균
from user u
join post p on u.id = p.user_id
group by u.id, u.nickname
having count(p.id) >= 2;

select * from post;



use employees;

-- Senior 직급 중 성씨가 M으로 시작하는 사람들의 연봉 평균을 구하시오

select 
	e.first_name,
    avg(s.salary)
from employees e 
join titles t on e.emp_no = t.emp_no
join salaries s on e.emp_no = s.emp_no
where t.title like 'Senior%'
and e.last_name like 'M%'
GROUP BY e.emp_no;




