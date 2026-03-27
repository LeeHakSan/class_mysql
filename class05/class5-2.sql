select * from student;

-- 데이터 추가
insert into student (student_id, name, grade, major, phone) 
values  (1002, '이영희', 3, '경영학', '010-2222-2222'),
		(1003, '박민준', 1, '전자공학', '010-3333-3333');
        
-- 데이터 조회
select * from student;

-- 이름 전공을 student 테이블에서 확인
select name, major from student;

-- 조건 절 추가 where
select name, major, grade from student where grade = 2;

-- 데이터 수정 UPDATE (주의 - 조건절이 없으면 전체 수정 됨)
update student set grade = 3; -- where student_id = 1001;

-- 데이터 삭제 DELETE (주의 - 조건절(where)이 없으면 전체 삭제 됨)
DELETE FROM student where student_id = 1003;
-- DELETE FROM student;
