-- 4단계 행 곱셈
-- 서로 아무 관련 없는 두 테이블을 부모 테이블이 
-- 같다고 해서 억지로 조인 하면 경우의 수 (데이터 뻥튀기) 
-- 현상이 발생 함

-- 도서별 대출 수와 리뷰 수를 한 번에 조회 하고 싶다.
select * from borrow where book_id = 1;
select * from review where book_id = 1;
-- 대출 테이블과 서로 아무런 관련이 없는 상태이다.
-- 단지 부모테이블 book_id를 사용하고 있다

-- 두 테이블을 동시에 조인 하면 어떻게 될까?
select 
	br.book_id as book_id,
    rv.id as review_id
from borrow br
left join review rv on br.book_id = rv.book_id
where rv.book_id = 1;

-- 대출이랑 리뷰 테이블은 서로 아무 연결 고리가 없는데 
-- 누가 진짜 짝인지 모르니까 그냥 1번 책에서 나온 기록 끼리 
-- 모든 조합을 다 짝지어줌
-- 3 * 3 = 9행 발생 -> 행 곱세 문제 발생 

-- 데이터 뻥튀기 이후에 집계 함수를 바로 사용하면 대참사 발생 
select 
	b.title as 도서명,
    count(br.id) as 대출수잘못됨,
    count(rv.id) as 리뷰수잘못됨
from book b
left join borrow br on b.id = br.book_id
left join review rv on b.id = rv.book_id
group by b.id, b.title;

-- ---------------------------
-- 뻥 튀기 데이터 해결 
select 
	b.title as 도서명,
    count(distinct br.id) as 대출수_정상,
    count(distinct rv.id) as 리뷰수_정상 
from book b
left join borrow br on b.id = br.book_id
left join review rv on b.id = rv.book_id
group by b.id, b.title;











