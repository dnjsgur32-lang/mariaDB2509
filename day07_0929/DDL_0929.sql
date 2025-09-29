SHOW DATABASES;

USE exdb;

SHOW TABLES;

-- 테이블 생성
CREATE TABLE Persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT
);

-- 테이블 필드구조 수정
ALTER TABLE Persons
MODIFY age INT NOT NULL;
DESC Persons;

DROP TABLE persons;
SELECT * FROM persons;

--
CREATE TABLE Persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT,
	UNIQUE (ID)
);

DESC Persons;

DROP TABLE persons;
SELECT * FROM persons;

-- UNIQUE는 INDEX로 삭제한다(중요 포인트)


-- UNIQUE(ID) : 1, 2, 3 ... 즉, ID 값이 중복 불가.
-- 1길동, 2길동, 3길동, 1지매, 2지매, 3지매 ... 중복 불가
-- 숫자가 아이디
-- UNIQUE(ID, LastName)
-- : ID + LastName 두개 필드의 값을 합쳤을 때 값 중복 불가.
-- 1길동, 2길동, 3길동, 1지매, 2지매, 3지매 ... 중복 가능
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE Persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT
);

DESC persons;

ALTER TABLE Persons
ADD UNIQUE (ID);

DROP TABLE persons;
SELECT * FROM persons;


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

DESC persons;

ALTER TABLE persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

-- 제약조건 삭제
ALTER TABLE persons
DROP INDEX UC_Person;

-- CONSTRAINT을 관리하는 테이블에서 확인하는 방법 start --
SHOW INDEX FROM persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

--
SELECT CONSTRAINT_NAME, COLUMN_NAME, ORDINAL_POSITION
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Persons'
	AND CONSTRAINT_NAME = 'UC_Person';
-- CONSTRAINT을 관리하는 테이블에서 확인하는 방법 finish -

-- 

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT,
	PRIMARY KEY(ID)
);
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT,
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT
);
DESC persons;

ALTER TABLE Persons
ADD PRIMARY KEY (ID);
DESC persons;

DROP TABLE persons;
SELECT * FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age INT
);
DESC persons;

ALTER TABLE persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
DESC persons;

ALTER TABLE Persons
DROP PRIMARY KEY;
DESC persons;

-- ----------------------------------------------
SELECT * FROM persons_f;
SELECT * FROM Orders_f;

-- 인원표 (부모)
CREATE TABLE Persons_f(
	PersonID INT PRIMARY KEY,
	LastName VARCHAR(255),
	FristName VARCHAR(255),
	Age INT
);
SELECT * FROM persons_f;

-- 주문표 (자식)
CREATE TABLE Orders_f (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons_f(PersonID)
);
SELECT * FROM Orders_f;
DESC Persons_f;
DESC orders_f;

DROP TABLE orders_f;
DESC orders_f;


-- constraint 등록
CREATE TABLE Orders_f (
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY (OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
	REFERENCES persons_f(PersonID)
);
SHOW INDEX FROM Orders_f;

DROP TABLE Orders_f;

CREATE TABLE Orders_f (
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT
);
DESC orders_f;

ALTER TABLE orders_f
ADD FOREIGN KEY (personID) REFERENCES Persons_f (personID);

ALTER TABLE orders_f
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons_f(PersonID);

SHOW INDEX FROM Orders_f;

ALTER TABLE orders_f
DROP FOREIGN KEY FK_personorder;

-- -----------------------------------------------------------------
DROP TABLE persons;

CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	CHECK (Age>=18)
);
DESC persons;
SHOW CREATE TABLE persons;

DROP TABLE persons;

CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255),
	CONSTRAINT chk_person CHECK (Age >= 18 AND city = 'Sandnes')
);
SHOW create table persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;
CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255)
);
DESC persons;

ALTER TABLE persons
ADD CHECK(Age >= 18);

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons';

DROP TABLE persons;

ALTER TABLE persons
ADD CONSTRAINT CHK_PersonAge CHECK(Age > 18 AND city = 'sandnes');

ALTER TABLE persons
DROP CONSTRAINT CHK_PersonAge;

SELECT VERSION();










