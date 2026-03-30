use school;

-- 학번 1001 학생의 학년을 3 으로 수정
select * from student where student_id = 1001 ;

update student
set grade = 3
where student_id = 1001;

-- 여러 컬럼 동시 수정
-- 1004 학번의 garde를 3 학년으로 바꾸고, phone을 = 010-7777-7777
select * from student where student_id = 1004;

update student
set grade = 3, phone = '010-7777-7777'
where student_id = 1004;

-- 수강 테이블
select * from enrollment;
select * from subject;

-- 수강 취소는 삭제 처리함. enrollment 데이터에서의 의미.
delete from enrollment
where enrollment_id = 8;

select * from enrollment;

delete from enrollment
where student_id = 1004;

select * from student where major = '경영학';

update student
set grade = grade + 1 
where major = '경영학';

CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

CREATE TABLE product (
    product_id  INT           PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    category    VARCHAR(30)   NOT NULL,
    price       DECIMAL(10,2) NOT NULL,
    stock       INT           DEFAULT 0,
    is_sale     BOOLEAN       DEFAULT FALSE
);

INSERT INTO product (name, category, price, stock, is_sale) VALUES
('삼성 갤럭시 S24',  '휴대폰',    1200000, 50,  FALSE),
('애플 아이폰 15',  '휴대폰',    1500000, 30,  FALSE),
('자바 완전정복',    '도서',       32000,   100, FALSE),
('나이키 티셔츠',    '의류',       59000,   200, TRUE),
('삼성 노트북',   '노트북',   1300000, 20,  FALSE),
('요가 매트',        '운동',       45000,   150, TRUE),
('마우스 로지텍',  '주변기기',  89000,   80,  FALSE),
('파이썬 기초',       '도서',       25000,   300, FALSE);

-- 1.
select * from product where product_id = 1;

update product
set price = 1100000
where product_id = 1;

select * from product where product_id = 1;

-- 2. 
select * from product where category = '도서';

update product
set is_sale = true
where category = '도서'; 

select * from product where category = '도서';

-- 3.
select * from product where product_id = 6;

delete from product 
where product_id = 6;

select * from product where product_id = 6;

-- 4.
INSERT INTO product (name, category, price, stock)
VALUES ('포스트졼 쓰레드 3', '논멀피터 ', 150000, 0);

select * from product where stock = 0;

delete from product
where stock = 0;

select * from product where stock = 0;

-- 5.

UPDATE product
SET price = price * 0.9;

-- 문제점 : product 테이블에 있는 모든 상품의 가격에 0.9 를 곱해 전체 가격이 달라지기 때문에 
-- where 절을 추가해 범위를 지정한다.

select * from product where category = '휴대폰';

update product
set price = price * 0.9
where category = '휴대폰';

select * from product where category = '휴대폰';


