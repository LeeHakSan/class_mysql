use shop;

-- 전체 확인
SELECT * FROM member;
SELECT * FROM product;
SELECT * FROM orders;

-- 1. 회원이름 + 주문정보 (주문한 회원만 보고싶음) 기준 테이블 orders
-- 기준 테이블의 상관이 없을 때 작은 양의 데이터를 갖고 있는 데이터를 기준으로 하는 것이 관례
select 
	m.name as 회원명,
	o.id as 주문번호,
	o.total_price as 주문금액,
    o.status as 주문상태
from orders o
inner join member m on o.member_id = m.id;

-- 2. 모든 회원 정보 + 주문 정보 (주문 없는 회원 포함)
select 
	m.*,
    o.status
from member m
left join orders o on o.member_id = m.id;

-- 3. 주문 상세: 주문번호 + 상품명 + 수량 + 가격 + 회원명 
select * from order_item;

select 
	m.name as 회원명,
	oi.id as 주문번호,
    o.total_price as 주문금액,
    o.status as 주문상태
from order_item oi
inner join orders o on oi.order_id = o.id
inner join product p on oi.product_id = p.id
inner join member m on o.member_id = m.id;

-- 카테고리별 상품 전체 목록 출력
select * from category;
select * from product;

-- 카테고리 상품 가격 재고
select c.name as 카테고리,
	p.name as 상품명,
	p.price as 가격,
    p.stock as 재고
from product p
inner join category c on p.category_id = c.id
order by c.name, p.price desc limit 5; -- asc 오름차순



use school;
-- on 없이 join 하면 모든 행의 조합이 나옴 
select * from student;
select * from enrollment;

select * 
from student 
join enrollment;













