--���� �ּ�
/*
������ �ּ�
*/

-- ���� ��������
-- ���� ����Ű : crtl +enter
show user;

-- ����� ���� ��ȸ

/*-��ȸ��
select �ּ��� from ���̺��*/

SELECT * from dba_users;
SELECT username, user_id from dba_users;

-- ���� ����� user�� ����

/*
    ����Ŭ 12�������� �Ϲݻ���ڴ� c##�� �����ϴ� �̸��� ������ ��
    ��й�ȣ�� ���ڷθ� ����
*/
--CREATE USER user1 IDENTIFIED BY 1234
CREATE USER c##user2 IDENTIFIED BY 1234;

-- c##Ű���带 ȸ���ϴ� ����
alter session set "_oracle_script" = true;

/*
    �������� ��ҹ��� �Ȱ���
    create user ������ identified by ��й�ȣ
*/

Create user tjoeun identified by 1234;

Create user test1 identified by 1234;
-- ���ѻ���

/*
    [ǥ����] CRANT ����1, ����2, ..... TO ������;
*/

GRANT RESOURCE, CONNECT TO test1;


-- USER ����
-- DROP USER USER�� CASCAED

-- insert�� ������ �������� ���̺����̽��� �󸶸�ŭ�� ������ �Ҵ��� ������ ���������
alter user test1 default tablespace users quota unlimited on users;

-- Ư�� �뷮��ŭ ���ؼ� �Ҵ�
alter user test1 quota 30M on users;

-- ����б� ����� �����
alter session set "_oracle_script" = true;
create user chun identified by 1234;
GRANT RESOURCE, CONNECT TO chun;
alter user chun default tablespace users quota unlimited on users;

-- DDL ����� �����
alter session set "_oracle_script" = true;
create user ddl identified by 1234;
GRANT RESOURCE, CONNECT TO DDL;
alter user DDL default tablespace users quota unlimited on users;

-- DDL ����� �����
alter session set "_oracle_script" = true;
create user JSP identified by 1234;
GRANT RESOURCE, CONNECT TO JSP;
alter user JSP default tablespace users quota unlimited on users;

-- mybatis ����� �����
alter session set "_oracle_script" = true;
create user mybatis identified by 1234;
GRANT RESOURCE, CONNECT TO mybatis;
alter user mybatis default tablespace users quota unlimited on users;

-- SPRINGBOOT ����� �����
alter session set "_oracle_script" = true;
create user springboot identified by 1234;
GRANT RESOURCE, CONNECT TO springboot;
alter user springboot default tablespace users quota unlimited on users;
