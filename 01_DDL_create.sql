
-- 스키마 (데이터베이스 생성)
CREATE SCHEMA sqldb DEFAULT CHARACTER SET utf8;
CREATE SCHEMA sqldb2 DEFAULT CHARACTER SET utf8mb4;

-- 스키마 (데이터베이스 삭제)
DROP SCHEMA sqldb2;

use sqldb;

-- 상품 테이블 생성
-- 제약조건 
	-- 기본키 : prdNo, NOT NULL
    -- prdName : NOT NULL로 설정

CREATE TABLE product(
prdNo CHAR(10) NOT NULL PRIMARY KEY,
prdName VARCHAR(30) NOT NULL,
prdPrice INT,
prdCompany VARCHAR(30)
);

-- 기본키 제약조건 설정 방법 2
CREATE TABLE product2(
prdNo CHAR(10) NOT NULL,
prdName VARCHAR(30) NOT NULL,
prdPrice INT,
prdCompany VARCHAR(30),
PRIMARY KEY (prdNo)
);

-- 기본키 제약조건 설정 방법 3
CREATE TABLE product3(
prdNo CHAR(10) NOT NULL,
prdName VARCHAR(30) NOT NULL,
prdPrice INT,
prdCompany VARCHAR(30),
CONSTRAINT PK_procuct_prdNo PRIMARY KEY(prdNo)
);

-- 복합키 : CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo, prdName)
-- --------------------------------------------------------
-- 외래키 제약조건 설정
/*
출판사 (출판사번호, 출판사명, 전화, … )
도서 (도서번호, 도서명, 가격, 발행일, 출판사번호(FK))

(1) 출판사 테이블 생성
	-- 제약 조건
		- 기본키 : pubNo, NOY NULL
        - pubName : NOT NULL
(2) 도서 테이블 생성
	-- 제약조건
		- bookNo, NOT NULL
        - 외래키 : pubNo (참조 테이블과 기본키 지정)
        - bookPrice : 기본값 10000, 1000보다 크게 설정
*/

create table publiser(
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

-- 외래키 생성 방법 1
CREATE TABLE book (
	bookNO CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice>1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publiser FOREIGN KEY (pubNo) REFERENCES publiser (pubNo)
    
);

-- 외래키 생성 방법 2
CREATE TABLE book2 (
	bookNO CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice>1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publiser (pubNo)
    
);

-- 테이블 상제 정보 확인 : describe
describe book;

-- 테이블 생성 연습문제 1
create table student (
	stuNo char(10) NOT NULL PRIMARY KEY,
    stuName varchar(30),
    stuGrade INT DEFAULT 4 CHECK(stuGrade>=1 and stuGrade<=4),
    stuBd date,
    departmentCode CHAR(10) NOT NULL,
    CONSTRAINT dk_departmentCode_department FOREIGN KEY (departmentCode) REFERENCES department (departmentCode)
);

create table department(
	departmentCode CHAR(10) NOT NULL PRIMARY KEY,
    departmentName VARCHAR(30) NOT NULL,
    departmentCall CHAR(10) NOT NULL
);

-- 테이블 생성 연습문제 추가
create table professor (
	professorNo char(10) NOT NULL PRIMARY KEY,
    professorName varchar(30),
    professorCall CHAR(30) NOT NULL,
    departmentCode CHAR(10) NOT NULL,
    FOREIGN KEY (departmentCode) REFERENCES department (departmentCode)
);

create table course (
courseCode char(10) NOT NULL PRIMARY KEY,
courseName varchar(30) not null,
courseCredit CHAR(10) NOT NULL,
professorNo char(10) NOT NULL,
FOREIGN KEY (professorNo) REFERENCES professor (professorNo)
);

-- 자동 증가 
create table board(
	boardNo int auto_increment not null primary key,
    boardTitle varchar(30) not null,
    boardAuthor varchar(20),
    boardContent varchar(200) not null
);

create table board2(
	boardNo int auto_increment not null primary key,
    boardTitle varchar(30) not null,
    boardAuthor varchar(20),
    boardContent varchar(200) not null
);

alter table board2 auto_increment = 100;
set @@auto_increment_increment=3;

set sql_safe_updates=0;

set @count = 0;
update board2 set boardNo = @count:=@count+1;

alter table board2 auto_increment = 1;





    
