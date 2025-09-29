CREATE TABLE persons (
	id INT NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	first_name VARCHAR(255),
	age INT,
	PRIMARY KEY (id)
);

-- 구조/엔진/제약 상태
SHOW CREATE TABLE persons;

SHOW INDEX FROM persons;

-- 스키마 확인
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='persons';

-- 퍼스트 네임을 NOT NULL 로 바꾸기 
ALTER TABLE persons MODIFY first_name VARCHAR(255) NOT NULL;

-- UNIQUE 추가
ALTER TABLE persons ADD CONSTRAINT uq_name UNIQUE (last_name, first_name);
-- UNIQUE 삭제
ALTER TABLE persons DROP INDEX uq_name;

-- CHECK 추가
ALTER TABLE persons ADD CONSTRAINT chk_age CHECK (age >= 0);
-- CHECK 삭제
ALTER TABLE persons DROP CONSTRAINT chk_age;

-- PK 추가
ALTER TABLE persons ADD PRIMARY KEY (id);
-- PK 삭제
ALTER TABLE persons DROP PRIMARY KEY;


-- 부모테이블 : PK(PRIMARY KEY) / UNIQUE가 있어야 함
CREATE TABLE people (
	person_id INT NOT NULL,
	last_name VARCHAR(255),
	first_name VARCHAR(255),
	PRIMARY KEY (person_id)
);

-- 자식테이블 FOREIGN KEY 부모 테이블 연결 PK / FK 컬럼이 '동일' 해야함
CREATE TABLE sales_orders (
	order_id INT NOT NULL,
	person_id INT,
	order_no INT NOT NULL,
	PRIMARY KEY (ORDER_id),
	CONSTRAINT fk_sales_orders_person
	FOREIGN KEY (person_id) REFERENCES people(person_id)
	ON DELETE RESTRICT
);

-- CHECK 제약 조건에 따라 INSERT/UPDATE 거부
ALTER TABLE people
	ADD CONSTRAINT chk_age CHECK (age >= 18);
	
-- CHECK 제약 제거
ALTER TABLE people
	DROP CONSTRAINT chk_age;

-- 확인

SHOW INDEX from people;
SHOW INDEX FROM sales_orders;
SHOW CREATE TABLE people;
SHOW CREATE TABLE sales_orders;

-- 총 정리 반복 복습

CREATE TABLE people_f (
	person_id INT NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	first_name VARCHAR(255),
	age INT,
	PRIMARY KEY (person_id),
	CONSTRAINT chk_age CHECK (age >= 0)
);

CREATE TABLE orders_r (
	order_id INT NOT NULL,
	person_id INT,
	order_no INT NOT NULL,
	PRIMARY KEY (order_id),
	CONSTRAINT fk_orders_person
		FOREIGN KEY (person_id) REFERENCES people_f(person_id)
		ON DELETE restrict
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='people_f';




