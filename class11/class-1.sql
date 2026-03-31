create database demo2;

-- 테이블 생성 시 인덱스를 추가하는 방법

create table product(
	id int primary key auto_increment,
    category_id int not null,
    name varchar(100) not null,
    price decimal(10,2) not null,
    stock int default 0,
	index idx_category (category_id), -- 테이블 추가 시 인덱스 할당
    index idx_name (name)
);
select * from product;
desc product;

-- 테이블 생성 이후에 인덱스 추가하는 방법
alter table product add index idx_price (price);

-- 또는 create를 사용해도 됨
create index idx_price on product (price);

-- 인덱스를 확인 하는 방법
show index from product;

-- 인덱스 삭제
drop index idx_price on product;


-- 인덱스 실습
use shop;

-- 문제 1. product, orders, member 테이블의 현재 인덱스 확인
show index from product;
show index from orders;
show index from member;

desc member;

-- 문제 2. member 테이블에 grade 컬럼에 인덱스 추가 (VIP 회원 조회시 자주 사용)
alter table member add index idx_grade(grade);
show index from member;

-- 문제 3. orders 테이블에 status 인덱스 추가 (주문 상태별로 조회시 자주 사용)
alter table orders add index idx_status(status);
show index from orders;

-- 문제 4. member 테이블에 grade에 걸린 인덱스 삭제
drop index idx_grade on member;










