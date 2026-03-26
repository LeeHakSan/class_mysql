-- 연습용 db 생성
create database mydb;
use mydb;

-- 학생, 과목, 수강 테이블을 만들고 직접 샘플 값을 넣으시오

create table student (
	student_id int primary key not null,
    student_name varchar(30) not null,
    grade int not null,
    major varchar(30) not null,
    phone varchar(20) not null
);

create table subject (
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR(30) NOT NULL,
    professor_name varchar(30) not null,
    limit_student int not null
);

create table enrollment (
	enrollment_id int primary key not null,
    student_id int not null,
    subject_id int not null,
    scores decimal(5, 2),
    enrolled_at date not null,
	foreign key (student_id) references student(student_id),
    foreign key (subject_id) references subject(subject_id)
);

insert into student (student_id, student_name, grade, major, phone) values
(2024001, '김철수', 1, '컴퓨터공학', '010-1234-5678'),
(2024002, '이영희', 2, '경영학', '010-9876-5432'),
(2024003, '박민준', 3, '디자인', '010-1111-2222'),
(2024004, '최수지', 1, '컴퓨터공학', '010-3333-4444');

insert into subject (subject_id, subject_name, professor_name, limit_student) values
(101, '데이터베이스', '홍길동 교수', 30),
(102, '마케팅 원론', '김영수 교수', 40),
(103, 'UI/UX 디자인', '최지혜 교수', 25),
(104, '알고리즘', '박성진 교수', 30);

insert into enrollment (enrollment_id, student_id, subject_id, scores, enrolled_at) values
(1, 2024001, 101, 95.50, '2026-03-02'),
(2, 2024002, 102, 88.00, '2026-03-03'),
(3, 2024003, 103, 92.25, '2026-03-02'),
(4, 2024001, 104, 78.00, '2026-03-05'),
(5, 2024004, 101, 85.00, '2026-03-02');





select * from enrollment where subject_id = 101;



