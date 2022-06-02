
-- alter 테이블 수정

-- alter table add : 열 추가
-- alter table add 열이름 타입(크기);
-- student 테이블에 stuTel 열 추가
alter table student add stuTel varchar(13);

describe student;

-- 여러 개의 열 추가 : stdAge, stdAddress2 열 추가
alter table student add(stdAge varchar(2), stdAddress2 varchar(50));