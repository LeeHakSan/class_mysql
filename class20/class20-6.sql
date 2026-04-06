use shop;

-- 1페이지에 5 건을 보여줌 
select * from product order by id limit 5 offset 0;

-- 2페이지에 5건을 또 보여줘야함 offset <-- 건너뛰다.
select * from product order by id limit 5 offset 5;

-- 3페이지에 5건을 또 보여줘야함
-- 1 페이지 당 5 건 
-- 3페이지 라면 10건 건너뜀 
select * from product order by id limit 5 offset 10;
-- 4페이지 라면 15 건 

-- shop db 에서 등급이 같은 사람들의 주문 횟수와 등급별 구매가격의 평균을 구하라.
select 
	m.grade,
	count(m.grade) as 총주문수,
    avg (oi.price) as 구매가격평균
from member m
join orders o on m.id = o.member_id
join order_item oi on o.id = oi.order_id
group by m.grade;

-- 문제9.
-- library DB에서 학생들의 후기 개수와 평균 리뷰점수를 출력하시오
-- 속성은 이름, 후기작성개수, 평균후기점수 로 설정하시오

use library;

select 
	s.name
from 
	student s
join 
	review rv on s.id = rv.student_id;






