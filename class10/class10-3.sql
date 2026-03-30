use shop;
show tables;

-- member 회원가입
-- orders 테이블에 1번 회원이 주문한 목록 데이터가 있다고 가정
-- 두 테이블이 fk 관계일 때 member 테이블을 작성해서 1번 회원을 삭제할 수 있을까?

select * from member;				
select * from orders;

insert into orders(member_id, total_price) values (4, 10000); 

-- FK 위반 why? orders 테이블에 member_id 1번 데이터가 존재 하기 때문에
-- member 테이블 1번에 회원을 삭제하면 orders 테이블에 member_id 1번은 무의미한 데이터가 된다.
delete from member where id = 1;

-- 2번은 바로 삭제 되는가?
delete from member where id = 2;

-- 결론 orders 테이블에 존재하는 member_id 의 값을 먼저 삭제하고 member 테이블에 pk 1번 회원을 삭제 할 수 있다
-- orders 테이블 데이터 삭제

delete from orders where member_id = 1;

-- 현재 orders 테이블에 걸린 정확한 fk 이름을 확인 (명령문 혹은 GUI로 확인)
show create table orders;

-- 1단계 기존의 제약 조건을 삭제함
-- (보통 지동 셍성된 이름은 orders_ibfk_1 같은 형태입니다)
alter table orders drop foreign key orders_ibfk_1;

-- 2단계 cascade 옵션을 추가하여 제약조건을 추후 새로 저으이할 수 있음
-- 기존에는 테이블 생성시 키 제약을 추가했다면 테이블 생성 후에도 키를 변경 수정 삭제 가능
alter table orders
add constraint fk_orders_member
foreign key(member_id) references member(id)
on delete cascade -- 부모 삭제시 자식도 삭제됨
on update cascade; -- 부모 pk 수정시 fk도 같이 수정 

-- 테스트
select * from member;

-- 연쇄 수정 확인
update member 
set id = 99 
where id = 4;

-- 연쇄 삭제 확인
delete from member
where id = 99;






CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 저자 테이블 (PK + UNIQUE)
CREATE TABLE author (
    author_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(20)  UNIQUE
);

-- 도서 테이블 (PK + FK)
CREATE TABLE book (
    book_id    INT           PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100)  NOT NULL,
    author_id  INT           NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    isbn       VARCHAR(20)   UNIQUE,
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 저자 데이터 입력
INSERT INTO author (name, email, phone) VALUES
('김자바',   'java@test.com',   '010-1111-1111'),
('이디비',   'db@test.com',     '010-2222-2222'),
('박스프링', 'spring@test.com', '010-3333-3333');

-- 도서 데이터 입력
INSERT INTO book (title, author_id, price, isbn) VALUES
('자바 완전정복',      1, 32000, 'ISBN-001'),
('MySQL 입문',          2, 28000, 'ISBN-002'),
('스프링 부트 실전',    3, 35000, 'ISBN-003'),
('자바 심화학습',        1, 29000, 'ISBN-004');

show tables;
select * from book;
select * from author;

-- 1. 이메일이 unique key 라서 중복이 안됨
-- 2. author_id 를 fk 로 author 테이블과 연결 했는데, author 테이블에 999번 id를 가진 값이 없기 때문  
INSERT INTO book (title, author_id, price, isbn)
VALUES ('신규 도서', 1, 20000, 'ISBN-005');

-- 3. unique key 중복은 오류 발생함
-- 3. unique key 는 null 사용 가능
INSERT INTO book (title, author_id, price, isbn)
VALUES ('염리는 책', 2, 18000, NULL);

-- 4. author 테이블에 있는 author_id는 book 테이블과 fk로 연결 되어 있기 때문에 
-- 먼저 book 테이블의 author_id 1번 값을 다 지워야 delete 문 실행 가능 
-- 또 다른 방법은 cascade 사용해서 같이 지움
-- alter table book
-- add constraint foreign key book_ibfk_1
-- foreign key (author_id) references author (id)
-- on delete cascade;
CREATE TABLE review (
    review_id  int PRIMARY KEY AUTO_INCREMENT,
    book_id    int NOT NULL,
    author_id  int NOT NULL,
    rating     int NOT NULL,
    content    text NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id)   REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);


