use school;

-- 테이블 끝에 primary key 선언이 가능 하지만 보통 복합 키를 등록할 때 많이 사용함
create table tb_student2 (
	student_id int,
    name varchar(50) not null,
    primary key (student_id)
);

select * from tb_student2;

-- 수강 테이블에 복합키 적용
create table tb_enrollment2 (
    student_id int,
    subject_id int,
	reg_date date,
    primary key(student_id, subject_id) -- 복합키 라고 한다 (여러개 쓸 때??)
);
desc tb_enrollment2;


use shop;

-- 정상 데이터 입력
select * from member;
insert into member (email, name) values ('hong@test.com', '홍길동');
insert into member (email, name) values ('kim@test.com', '김영희');

-- unique 위반 : 이미 있는 이메일 입력시 발생
insert into member (email, name) values ('hong@test.com', '이순신');
-- 오류 발생 : Duplicate entry

-- 상품 테이블에 insert 를 하려면 먼저 카테고리 테이블에 값이 있어야함
desc category;
insert into category(name) values 
('전자제품'), ('의류'), ('식품');

select * from category;

desc product;
insert into product(category_id, name, price, stock) values
(1, '삼성갤럭시 S26', 1200000.00, 50),
(1, '애플 아이폰 16', 15100000.00, 50),
(2, '나이키 티셔츠', 55000.00, 50),
(1, '삼성갤럭시 노트북', 2200000.00, 50);

select * from product;

-- foreign key 위반
insert into product(category_id, name, price, stock) values
(999, '비트코인', 90000000.00, 1);




