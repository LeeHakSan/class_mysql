-- 출력 목표:
--   회원 이름, 주문 번호, 주문 금액, 주문 상태를 조회하세요.
--   단, 주문이 있는 회원만 출력하세요.
--   (member.name, orders.id, orders.total_price, orders.status)

SELECT 
	m.name AS 회원명, 
    o.id AS 주문번호,
	o.total_price AS 주문금액, 
    o.status AS 상태
FROM orders o
inner JOIN member m ON m.id = o.member_id;

-- school DB 사용
USE school;

-- 데이터 확인
SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM enrollment;

-- enrollment 테이블을 기준으로 student 와 subject 를 INNER JOIN 하여 아래 컬럼을 출력하는 SQL을 작성하세요 
SELECT
    s.name          AS 학생이름,
    su.subject_name AS 과목명,
    e.score         AS 점수
FROM enrollment e
inner JOIN student s  ON s.student_id = e.student_id
inner JOIN subject su ON su.subject_id = e.subject_id;

-- **Q2.** 모든 학생을 조회하되 수강 기록이 없는 학생도 포함해서 출력하는 SQL을 작성하세요.

-- (힌트: student 를 기준으로 LEFT JOIN 사용)


SELECT
    s.name          AS 학생이름,
    su.subject_name AS 과목명,
    e.score         AS 점수
FROM student s
left JOIN enrollment e  ON e.student_id = s.student_id
left JOIN subject su    ON su.subject_id = e.subject_id;


-- **Q3.** shop DB 에서 아래 조건에 맞는 SQL을 작성하세요.

-- 조건: 주문한 회원만 조회. 회원명, 주문번호, 주문금액, 주문상태 출력
USE shop;

SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
FROM orders o
inner JOIN member m ON m.id = o.member_id;

-- Q4. shop DB 에서 주문이 없는 회원도 포함하여 모든 회원의 이름과 주문 정보를 조회하는 SQL을 작성하세요.

SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
FROM member m
left JOIN orders o ON o.member_id = m.id;

-- Q5. shop DB 에서 주문번호, 회원명, 상품명, 수량, 상품가격을 조회하는 SQL을 작성하세요.

SELECT
    o.id        AS 주문번호,
    m.name      AS 회원명,
    p.name      AS 상품명,
    oi.quantity AS 수량,
    oi.price    AS 상품가격
FROM order_item oi
INNER JOIN orders o ON o.id = oi.id
INNER JOIN product p ON p.id = oi.id
INNER JOIN member m ON m.id = o.id;
-- 순서는 상관 없음






