create database library;

-- id, isbn_id, author_id, publisher_id, title, create_date
create table book(
	id int primary key auto_increment not null,
    isbn_id int not null,
    author_id int not null,
    publisher_id int not null,
    title varchar(100) not null,
    stock int not null,
    create_date datetime default current_timestamp,
    foreign key (isbn_id) references isbn(isbn_id),
    foreign key (author_id) references author(author_id),
    foreign key (publisher_id) references publisher(publisher_id)
); 

-- isbn, name 
create table isbn(
	isbn_id int primary key not null,
    genre varchar(20) not null
); 

-- id, name, birth_date
create table author(
	author_id int primary key auto_increment not null,
    name varchar(50) not null,
    birth_date date not null
);
-- id, name
create table publisher(
	publisher_id int primary key auto_increment not null,
    name varchar(50) unique key not null
); 

insert into publisher (name) values
('한빛미디어'),
('길벗'),
('이지스퍼블리싱'),
('인사이트'),
('위키북스'),
('제이펍'),
('영진닷컴');
select * from publisher;

insert into author(name, birth_date) values
('김영한', '1980-05-15'),
('남궁성', '1975-12-01'),
('조영호', '1982-03-22'),
('마틴 파울러', '1963-12-18'),
('로버트 C. 마틴', '1952-12-05'),
('조슈아 블로크', '1961-08-28'),
('윤성우', '1978-10-10'),
('임종권', '1985-02-14'),
('최범균', '1981-07-30'),
('유시진', '1990-11-20');
select * from author;

create table users (
	users_id int primary key auto_increment,
    users_name varchar(50) not null
);









create database korea_it;
use  korea_it;

-- 1. 강의실 테이블 (장소 정보만 관리)
CREATE TABLE companyroom (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    computers INT NOT NULL
);

-- 2. 강의 테이블 (어느 강의실에서 하는지 연결)
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    price DECIMAL(20,2),
    start_date DATE, -- 타입을 DATE로 변경
    end_date DATE,
    class_time VARCHAR(30),
    face_to_face BOOLEAN DEFAULT TRUE,
    classroom_id INT, 
    FOREIGN KEY (classroom_id) REFERENCES companyroom(classroom_id)
);

-- 3. 강사 테이블 (전화번호 타입 수정)
CREATE TABLE instructor (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(20) NOT NULL, -- INT에서 VARCHAR로 변경
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- 4. 학생 테이블
CREATE TABLE academy_st (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    is_active BOOLEAN DEFAULT FALSE -- 현재 수강 여부
);

-- 5. 수강 신청 테이블 (학생과 강의를 연결하는 중간 테이블)
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    class_id INT,
    enroll_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES academy_st(id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- 6. 멘토 테이블 (기존 동일)
CREATE TABLE mento (
    mento_id INT PRIMARY KEY AUTO_INCREMENT,
    mento_name VARCHAR(50) NOT NULL,
    mento_phone VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO companyroom (name, capacity, computers) VALUES
('A', 20, 20),
('B', 15, 15),
('C', 50, 0),
('D', 10, 10),
('E', 12, 12);

INSERT INTO class (class_name, price, start_date, end_date, class_time, face_to_face, classroom_id) VALUES
('Java 마스터', 500000, '2025-04-01', '2025-06-30', '09:00-13:00', true, 1),
('파이썬 데이터분석', 450000, '2025-04-15', '2025-07-15', '14:00-18:00', true, 2),
('UI/UX 디자인', 300000, '2025-05-01', '2025-06-01', '10:00-12:00', false, 3),
('AWS 클라우드', 600000, '2025-04-10', '2025-08-10', '19:00-22:00', true, 4),
('React 웹풀스택', 550000, '2025-05-10', '2025-09-10', '09:00-13:00', false, 5);

INSERT INTO instructor (class_id, name, age, phone) VALUES
(1, '홍길동', 42, '010-1111-2222'),
(2, '김영희', 38, '010-3333-4444'),
(3, '이철수', 45, '010-5555-6666'),
(4, '박지민', 33, '010-7777-8888'),
(5, '최코딩', 29, '010-9999-0000');

INSERT INTO academy_st (name, age, phone, is_active) VALUES
('이진혁', 22, '010-1234-5678', true),
('박서윤', 25, '010-2345-6789', true),
('정재호', 28, '010-3456-7890', false),
('한소희', 23, '010-4567-8901', true),
('김민수', 30, '010-5678-9012', true);

INSERT INTO enrollment (student_id, class_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);





