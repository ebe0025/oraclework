--한줄 주석
/*
여러줄 주석
*/

-- 나의 계정보기
-- 실행 단축키 : crtl +enter
show user;

-- 사용자 계정 조회

/*-조회시
select 솔성명 from 테이블명*/

SELECT * from dba_users;
SELECT username, user_id from dba_users;

-- 내가 사용할 user를 생성

/*
    오라클 12버전부터 일반사용자는 c##로 시작하는 이름을 가져야 함
    비밀번호는 문자로만 가능
*/
--CREATE USER user1 IDENTIFIED BY 1234
CREATE USER c##user2 IDENTIFIED BY 1234;

-- c##키워드를 회피하는 설정
alter session set "_oracle_script" = true;

/*
    계정명은 대소문자 안가림
    create user 계정명 identified by 비밀번호
*/

Create user tjoeun identified by 1234;

Create user test1 identified by 1234;
-- 권한생성

/*
    [표현법] CRANT 권한1, 권한2, ..... TO 계정명;
*/

GRANT RESOURCE, CONNECT TO test1;


-- USER 삭제
-- DROP USER USER명 CASCAED

-- insert시 생성된 유저에게 테이블스페이스에 얼마만큼의 영역을 할당할 것인지 정해줘야함
alter user test1 default tablespace users quota unlimited on users;

-- 특정 용량만큼 정해서 할당
alter user test1 quota 30M on users;

-- 춘대학교 사용자 만들기
alter session set "_oracle_script" = true;
create user chun identified by 1234;
GRANT RESOURCE, CONNECT TO chun;
alter user chun default tablespace users quota unlimited on users;

-- DDL 사용자 만들기
alter session set "_oracle_script" = true;
create user ddl identified by 1234;
GRANT RESOURCE, CONNECT TO DDL;
alter user DDL default tablespace users quota unlimited on users;

-- DDL 사용자 만들기
alter session set "_oracle_script" = true;
create user JSP identified by 1234;
GRANT RESOURCE, CONNECT TO JSP;
alter user JSP default tablespace users quota unlimited on users;

-- mybatis 사용자 만들기
alter session set "_oracle_script" = true;
create user mybatis identified by 1234;
GRANT RESOURCE, CONNECT TO mybatis;
alter user mybatis default tablespace users quota unlimited on users;

-- SPRINGBOOT 사용자 만들기
alter session set "_oracle_script" = true;
create user springboot identified by 1234;
GRANT RESOURCE, CONNECT TO springboot;
alter user springboot default tablespace users quota unlimited on users;
