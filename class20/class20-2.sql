
-- 1단계 distict
select * from book;
select * from student;
select * from borrow;
select * from review;

-- 문제 : 학생들 중 책을 한 번이라도 빌린 학생의 학번과 이름을 조회 

select 
	s.id, s.name
from 
	student s
join 
	borrow b on s.id = b.student_id;

-- 명단의 중복 없애기
-- distinct 로 중복 제거 가능 
select 
	distinct s.id, 
    s.name
from 
	student s
join 
	borrow b on s.id = b.student_id;

-- 문제 2. 리뷰가 등록된 책 이름만 알고 싶다 
select distinct b.title
from book b
join review r on b.id = r.book_id;






