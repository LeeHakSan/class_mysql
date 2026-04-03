-- 각 도서별 대출 통계 (group by 사용)
select * from book;
select * from student;
select * from borrow;
select * from review;

-- 자바 기초 책이 몇 번 대출 됐을까? (각 책에 대한 대출 횟수, 대출 학생수 출력)

select 
	b.title as 도서명, 
    count(br.book_id) as 대출횟수,
	count(distinct br.student_id) as 대출학생수
from book b
left join borrow br on b.id = br.book_id
group by b.id, b.title;

-- 김철수 학생이 같은 책을 한 번 더 빌림
insert into borrow (student_id, book_id) values (1,1);

-- 8번 데이터 다시 삭제.
delete from borrow where id = 8;

-- 행 별로 중복을 제거 하고 싶으면 distict를 사용하면 된다. 
-- 집계 함수 count 경우 중복된 값을 카운트에 제거하고 싶으면 distinct를 사용하면됨 



