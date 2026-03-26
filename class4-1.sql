-- 데이터 베이스 구축 하기 
CREATE DATABASE school;
-- 어떤 데이터 베이스를 사용 하겠다
use school;
-- 학생테이블
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL,
	phone VARCHAR(20)
);

select * from student;

-- 과목 테이블
CREATE TABLE subject (
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    professor VARCHAR(30) NOT NULL
);

-- 수강 테이블 (student 테이블과 subject 코드를 연결 함) --> foreign key
create table enrollment (
	enrollment_id int primary key,
    student_id int not null, -- 일반적으로 pk 선언시 비어 있으면 안됨 not null로 설정함
    subject_id int not null,
	score 		decimal(5, 2), -- 123.99 
	enrolled_at date not null,
    foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subject(subject_id)
);


-- 테이블 목록 확인
show tables
