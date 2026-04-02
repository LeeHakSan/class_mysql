use sns;
select * from post;


-- 전체 게시글 수 
select count(*) as '게시글 수' from post;
select count(id) as '게시글 수' from post;

select count(*) as '총 좋아요 수' from like_log; 
select * from like_log; 


select avg(view_count) as '평균 조회수' from post; -- 소수
select round(avg(view_count), 1) as '평균 조회수' from post; -- 소수점 제한


-- 최대 / 최소
select max(view_count) from post;
select min(view_count) from post;


-- 한 번의 쿼리에 최대 조회수 최소 조회수 를 출력 
select 
	max(view_count) as 최대조회수,
	min(view_count) as 최소조회수
from 
	post;

-- 문자열 함수
-- concat, upper, lower
-- select nickname + ('이메일')from user
select concat(nickname, ' (', email, ')') as 회원정보 from user;
select upper(email) as 대문자이메일 from user;
select lower(email) as 소문자이메일 from user;

-- substring, locate
-- locate('찾을문자', '원본문자열') : 특정 문자가 시작되는 위치를 문자로 반환함
-- substring('원본문자열', 시작위치, 가져올 길이) : 원본 문자열에서 정해진 범위만큼 잘라냄 
select '안녕반가워';
-- mysql 에서 글자 순번은 서수적 표현을 쓴다. 즉 1부터 시작함
select locate('@', 'abc@com');
select substring('abc@com', 1, 4);

-- 응용 chulsoo.kim@gmail.com --> chulsoo.kim

select 
	substring(email, 1, (locate('@', email) -1)) as '문자열 @ 앞까지만출력'
from 
	user;

-- length(문자열) : 문자열의 바이트 수를 반환. 한글 한 글자는 (3바이트)
-- char_length(문자열) : 문자열의 글자 수를 반환 (한글 사용시 권장)
select 'hi', length('hi') as 글자길이;
select "자바", length('자바') as 글자길이;

select 'hi', char_length('hi') as 글자길이;
select "자바", char_length('자바') as 글자길이;

-- 조건 함수 - CASE WHEN THEN
-- 조회수에 따라 인기 등급 표시

select title, view_count from post;
-- 50 보다 크다면 인기글 <-- 만약 30 보다 작다면 주목글 

select
	title,
	view_count,
	case 
		when view_count >= 50 then '인기글'
        when view_count >= 30 then '주목글'
        else '일반글'
    end as 인기등급
from post
order by view_count desc;

-- 날짜 함수

-- 오늘 날짜
select curdate() as 오늘;
select current_date() as 오늘;

-- DATEDIFF	- 날짜 차이 계산
-- 가입 후 경과 일수
select * from user;
select 
	nickname,
    created_at,
    datediff(current_date, '2025-04-02') as 가입일수
from user;

-- 가입 년도 / 월 추출 
select 
	nickname,
	year(created_at) as 가입년도,
	month(created_at) as 가입월
from user;


-- mysql 에서 varchar는 변경 불가, char는 가능 
select
	title,
    concat(cast(view_count as char), '회') as 조회수
from post;
 
select
	title,
    concat(view_count, '회') as 조회수
from post;

