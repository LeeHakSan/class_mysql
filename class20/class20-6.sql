use shop;

-- 1페이지에 5 건을 보여줌 
select * from product order by id limit 5 offset 0;

-- 2페이지에 5건을 또 보여줘야함 offset <-- 건너뛰다.
select * from product order by id limit 5 offset 5;

-- 3페이지에 5건을 또 보여줘야함
-- 1 페이지 당 5 건 
-- 3페이지 라면 10건 건너뜀 
select * from product order by id limit 5 offset 10;
-- 4페이지 라면 15 건 



