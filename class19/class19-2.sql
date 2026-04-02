-- 좋아요가 2개 이상인 게시글만 조회 
-- 좋아요 개수 --> like_log 7개의 좋아요가 저장 되어있음 
-- 예제 1번
select 
	post_id, count(*) as 좋아요수
from like_log
group by post_id
having count(*) >= 2;

-- 예제 2번
-- where 와 having은 역할이 달라서 한 쿼리에 함께 쓸 수 있다.
-- 조회수 120 이상인 게시글 중 좋아요 2개 이상인 게시들만 출력 
-- 게시글 타이틀, 좋아요 수 

-- where 120 이상 조회수
-- 남은 게시글로 group by
-- having 으로 좋아요 2개 이상 그룹만 출력 

select 
	p.title,
    count(l.id) as 좋아요수
from post p
join like_log l on p.id = l.post_id
where p.view_count >= 120
group by p.id, p.title
having count(l.id) >= 2
order by 좋아요수 desc;














