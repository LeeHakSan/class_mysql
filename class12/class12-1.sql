-- 쇼핑몰 
drop database if exists shop;
create database shop;
use shop;

-- 회원 테이블  일반, VIP
create table member(
	id bigint primary key auto_increment,
    email varchar(100) not null, 
    name varchar(50) not null, 
    phone varchar(20),
    grade varchar(10) default '일반', 
    created_at datetime  default current_timestamp
);
select * from member;

-- 상품 카테고리 테이블 
create table category(
	id int primary key auto_increment, 
    name varchar(50) not null
);

select * from category;

-- 상품 테이블 
create table product(
	id int primary key auto_increment, 
    category_id int not null, 
    name varchar(100) not null, 
    price decimal(10, 2) not null, 
    stock int default 0, 
    description text, 
    created_at datetime default current_timestamp,
    foreign key(category_id) references category(id)
);

-- 주문 테이블  : 테이블 명에 예약어 사용하려면 백틱(`) 으로 감싸줘야 한다. 
create table orders (
	id int primary key auto_increment, 
    member_id bigint not null, 
    total_price decimal(10, 2) not null, 
    status varchar(20) default '결제대기',
    created_at datetime default current_timestamp, 
    foreign key (member_id) references member(id)
);

select * from orders; 

-- 주문 상세 테이블 (주문 1건에 여러 상품)
create table order_item(
	id int primary key auto_increment, 
    order_id int not null, 
    product_id int not null, 
    quantity int not null, 
    price decimal(10, 2) not null, 
    foreign key (order_id) references orders(id), 
    foreign key (product_id) references product(id)
);

show tables;







USE shop;

-- 카테고리 데이터
INSERT INTO category (name) VALUES
('전자제품'), ('의류'), ('식품'), ('도서'), ('스포츠');

-- 회원 데이터
INSERT INTO member (email, name, phone, grade) VALUES
('hong@test.com',  '홍길동', '010-1111-2222', 'VIP'),
('kim@test.com',   '김영희', '010-2222-3333', '일반'),
('lee@test.com',   '이철수', '010-3333-4444', 'VIP'),
('park@test.com',  '박민지', '010-4444-5555', '일반'),
('choi@test.com',  '최재영', '010-5555-6666', 'GOLD');

-- 상품 데이터
INSERT INTO product (category_id, name, price, stock, description) VALUES
(1, '삼성 갤럭시 S24',  1200000.00,  50, '최신 안드로이드 스마트폰'),
(1, '애플 아이폰 15',   1500000.00,  30, '애플의 플래그십 스마트폰'),
(1, '삼성 노트북',      1300000.00,  20, '가성비 좋은 업무용 노트북'),
(2, '나이키 운동화',      150000.00, 100, '에어 쿠션 운동화'),
(2, '아디다스 티셔츠',     59000.00, 200, '드라이핏 기능성 티셔츠'),
(3, '곰표 밀가루 1kg',      2500.00, 500, '국산 밀 100% 밀가루'),
(4, '자바 완전정복',       35000.00,  80, '자바 기초부터 심화까지'),
(4, '스프링 부트 실전',     42000.00,  60, '스프링 부트 실전 가이드'),
(1, 'LG 모니터 27인치',   450000.00,  40, '4K UHD 모니터'),
(5, '요가 매트',           45000.00, 150, '친환경 TPE 요가 매트');

-- 주문 데이터
INSERT INTO orders (member_id, total_price, status) VALUES
(1, 1200000.00, '배송완료'),
(1,   35000.00, '배송중'),
(2, 1500000.00, '배송완료'),
(3,  150000.00, '결제완료'),
(3,   59000.00, '배송중'),
(4,   42000.00, '결제대기'),
(5,  450000.00, '배송완료');

-- 주문 상세 데이터
INSERT INTO order_item (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200000.00),
(2, 7, 1, 35000.00),
(3, 2, 1, 1500000.00),
(4, 4, 1, 150000.00),
(5, 5, 1, 59000.00),
(6, 8, 1, 42000.00),
(7, 9, 1, 450000.00);

-- 전체 확인
SELECT * FROM member;
SELECT * FROM product;
SELECT * FROM orders;

