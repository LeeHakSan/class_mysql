-- 별칭 (Alias)

select 
	student_id as 학번,
    name as 이름
from student;

-- AS 생략 가능
select 
	s.student_id 학번, 
    s.name 이름 
from 
	student s;

use shop;

-- 계산 결과에도 많이 씀
select 
	name, 
    price, 
    price * 0.967 as 할인가격 
from 
	product;













