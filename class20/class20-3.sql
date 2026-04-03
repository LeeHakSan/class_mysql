
-- 2 단계 count 와 count(distinct)

select * from book;
select * from student;
select * from borrow;
select * from review;

-- 상황 : 전체 대출 정보 출력 (학생 id, 학생 이름, 책 id, 책 이름)

select 
	s.id as '학생 id' ,
	s.name as '학생 이름' ,
	b.id as '책 id',
	b.title as '책 제목'
from student s
join borrow br on s.id = br.student_id
join book b on b.id = br.book_id
order by s.name asc;

-- 전체 대출이 일어난 횟수 
select count(*) as '총 대출 횟수'
from borrow;

-- 대출한 학생 수만 확인하고 싶다면 (한 학생이 여러번 대출 가능하다) 
select count(distinct student_id) as '대출 학생 수' from borrow;

-- distinct 는 문법적으로 select절 바로 앞에만 사용할 수 있다.
-- 단 count() 함수 안에 distict를 사용할 수 있다. (뭉쳐진 바구니 안에 중복된 데이터는 제거 하고 카운트 한다)

-- 대출 테이블에서 총 대출 횟수 정보, 대출 학생 수 각각 출력 

select 
	count(*) as 총대출횟수,
	count(distinct student_id) as 대출학생수
from borrow;


