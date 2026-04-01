-- member_id=2 인 회원이 product_id=3 인 상품을 2개 주문합니다.
--   (total_price = 상품가격 × 수량으로 계산)

--   1. orders 테이블에 주문 INSERT (status = '결제완료')
--   2. order_item 에 주문 상세 INSERT
--   3. product 의 stock 을 2 감소

--   모두 성공하면 COMMIT

use shop;

select * from orders;
select * from order_item;
select * from product;

start transaction;

insert into orders (member_id, total_price, status)
values(2, 1300000.00 * 2, '결제완료');

insert into order_item (order_id, product_id, quantity, price)
values(12, 3, 3, 1300000.00*2);

update product 
set stock = stock - 2
where id = 3;

commit;


-- shop db 에서 카테고리와 상품 이름, 남은 재고, 가격을 표시하시오 (컬럼명을 제시한 바와 같이 맞추시오).




