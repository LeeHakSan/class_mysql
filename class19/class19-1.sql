use sns;

-- group by 없이 전체 좋아요 갯수 출력 

select count(*) as 전체좋아요수
from like_log;

select * from like_log;

-- 게시글 별 좋아요 수
SELECT post_id, count(*) as 좋아요수, user_id
FROM like_log
GROUP BY post_id;

-- group by 와 집계함수 모두 사용
select 
	post_id,
    count(*) as 좋아요수,
    min(created_at) as 첫번째좋아요,
    max(created_at) as 마지막좋아요
from like_log
group by post_id
order by 좋아요수 desc;

-- 그룹 바이 사용시 안되는 쿼리
select user_id, title, count(*)
from post
group by user_id;

select * from post;
-- title 컬럼을 넣는 순간 두 개의 데이터중 무엇을 출력할지 판단 불가  

-- 그룹 바이 사용시 안되는 쿼리 2
select id, count(*)
from post
where count(*) >= 3
group by id;
-- 오류 발생 where 절에는 집계 함수를 사용할 수 없음
-- 이유 : where 절은 구룹이 만들어지기 전에 실행 됨.
-- 즉 아직 count 결과가 존재 하지 않는 시점이라 사용이 불가함. 
-- group by 절에는 where을 못 쓴다
-- 대신 having 절을 사용해야함. 





