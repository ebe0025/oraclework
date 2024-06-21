/*
   *DDL(DATE DEFINITION LANGUAGE): ������ ���� ���
   :����Ŭ���� �����ϴ� ��ü(OBJECT)�� �����(CREATE), 
   ������ ����(ALTER), ���� ��ü�� ����(DROP)�ϴ� ���
   ��, ���� ������ ���� �ƴ� ���� ��ü�� �����ϴ� ���
   �ַ� DB������, �����ڰ� �����
   
   - ����Ŭ���� ��ü(����):���̺�(TABLE), ��(VIEW),������(SEQUENCE),�ε���(INDEX), ��Ű��(PACKAGE)
                        Ʈ����(TRIGGER), ���ν���(PROCEDURE), �Լ�(FUNCTION), ���Ǿ�(SYNONYM), �����(USER)
                        
*/
--=============================================================================
/*
   * CREATE
    : ��ü�� �����ϴ� ����
*/
-----------------------------------------------------------------------------------
/*
   1. ���̺� ����
     - ���̺��̶� : ��(ROW)�� ��(COLUME)���� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü
                  ��� �����͵��� ���̺��� ���� �����
                  (ǥ ���¸� DB������ ���̺�)
                  
    [ǥ����]
    CREATE TABLE ���̺��(
       �÷��� �ڷ���(ũ��), 
       �÷��� �ڷ���(ũ��), 
       �÷��� �ڷ���,
       .....
       );
       
       * �ڷ���
       - ���� (CHAR(����Ʈũ��)|VARCHAR2(����Ʈũ��))-> �ݵ�� ũ�� ���� �ؾߵ�
        > CHAR : �ִ� 2000byte���� ��������
                 ��������(������ ũ�⺸�� �� �������� ���͵� �������ζ� ä���� ó�� ������ ũ�⸸ŭ ����)
                 ������ �����͸� ���� �� ���
        > VARCHAR2:�ִ� 4000Byte���� ��������
                   ��������(���� ���� ũ�⿡ ���� �޶���)
                   ����� ������ �� �� ���
        - ����(NUMBER)
        - ��¥(DATE)
*/

-- ȸ���� ���� �����ͷ� ������� ���̺� MEMBER����
CREATE TABLE MEMBER(
   MEM_NO NUMBER,
   MEM_ID VARCHAR2(20),
   MEM_PWD VARCHAR2(20),
   MEM_NAME VARCHAR2(20),
   GENDER CHAR(3),
   PHONE VARCHAR(13),
   EMAIL VARCHAR(50),
   MEM_DATE DATE
);

SELECT * FROM MEMBER;

-- ����ڰ� ������ �ִ� ���̺� ����
-- ������ ��ųʸ� : �پ��� ��ü���� ������ �����ϰ� �ִ� �ý��� ���̺��
-- [����] USER_TABLES: �� ����ڰ� ������ �ִ� ���̺��� �������� ������ Ȯ���� �� �ִ� �ý��� ���̺�
SELECT * FROM USER_TABLES;

-- [����] USER_TAB_COLUMNS : �� ����ڰ� ������ �ִ� ���̺��� ��� �÷��� �������� ������ Ȯ���� �� �ִ� �ý��� ���̺�
SELECT * FROM USER_TAB_COLUMNS;

---------------------------------------------------------------------------------------------------------------
/*
   2. �÷��� �ּ��ޱ�
   
   [ǥ����]
   COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�����';
   
   >> �߸� �ۼ��� ���� �� ������ �� �ٽ� �����ϸ� ��
*/

COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.MEM_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.GENDER IS 'ȸ������(��, ��)';
COMMENT ON COLUMN MEMBER.PHONE IS 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS 'ȸ���̸���';
COMMENT ON COLUMN MEMBER.MEM_DATE IS 'ȸ��������';

COMMENT ON COLUMN MEMBER.MEM_DATE IS '������';

-- ���̺� �����͸� �߰���Ű�� ����
-- INSERT INTO ���̺�� VALUES();
INSERT INTO MEMBER VALUES(1, 'user01', 'pass01', 'ȫ�浿', '��', '010-1234-5678', 'user01@naver.com', '24/06/01');
INSERT INTO MEMBER VALUES(2, 'user02', 'pass02', '���浿', '��', null, null, SYSDATE);

INSERT INTO MEMBER VALUES(NULL, NULL, NULL, NULL, NULL, null, null, NULL);

-------------------------------------------------------------------------------------------
/*
    * ��������(CONSTRAINTS)
       - ���ϴ� �����Ͱ�(��ȿ�� �ͽ��� ��)�� �����ϰ� ���� Ư�� �÷��� �����ϴ� ����
       - ������ ���Ἲ ������ �������� �Ѵ�
        : �������� ������ ���� ����, �� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����
        1. ��ü ���Ἲ ���� ����: NOT NULL, UNIQUE, PRIMARY KEY ���� ����
        2. ���� ���Ἲ ���� ����: FOREIGN KEY(�ܷ�Ű) ���� ����
        
        ���� : NOT NULL, UNIQUE, PRIMARY KEY, CHECK(����), FOREIGN KEY
        
        - ���� ������ �ο��ϴ� ��� 2����
          1) �÷� ���� ���: �÷��� �ڷ��� ���� ���
          2) ���̺� ���� ���: ��� �÷����� ������ �� �������� ���
*/

/*
     * NOT NULL ��������
     �ش� �÷��� �ݵ�� ���� �����ؾ߸� �� ���(��, �÷����� NULL�� ������ �ȵ�)
     ����/���� NULL���� ������� �ʵ��� ����
     
     ���������� �ο��ϴ� ��� 2����
     1 ) �÷� ���� ���
     2) ���̺� ���� ���
*/

-- �÷� ���� ��� : NOT NULL ���������� �÷� ��ĸ� ��밡��



-- NOT NULL ���� ����
CREATE TABLE MEM_NOTNULL(
    MEM_NO NUMBER NOT NULL UNIQUE,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
);





INSERT INTO MEM_NOTNULL VALUES(1, 'user01', 'pass01', '�̰���', '��', '010-1234-5678', 'user01@gmail.com');
INSERT INTO MEM_NOTNULL VALUES(2, 'user01', null, '�����', '��', null, 'user01@gmail.com'); --��й�ȣ�� null�� ������
-- NOT NULL �������ǿ� ����Ǵ� ����

INSERT INTO MEM_NOTNULL VALUES(1, 'user01', 'pass03', '��غ�', '��', '010-1234-0000','user03@gmail.com');

-------------------------------------------------------------------------------------------
/*
    * UNIQUE ��������
     : �ش� �÷��� �ߺ��� ���� ������ �ȵǴ� ���
       ����/ ������ ������ �ִ� �������� �ߺ����� ���� ��� ���� �߻�
*/
-- �÷� ���� ���
CREATE TABLE MEM_UNIQUE(
  MEM_NO NUMBER NOT NULL,
  MEM_ID VARCHAR(20) NOT NULL,
  MEM_PWD VARCHAR(20) NOT NULL,
  MEM_NAME VARCHAR(20) NOT NULL,
  GENDER CHAR(3),
  PHONE VARCHAR(13),
  EMAIL VARCHAR(50)
);

-- ���̺� ���� ���
CREATE TABLE MEM_UNIQUE2(
  MEM_NO NUMBER NOT NULL,
  MEM_ID VARCHAR(20) NOT NULL,
  MEM_PWD VARCHAR(20) NOT NULL,
  MEM_NAME VARCHAR(20) NOT NULL,
  GENDER CHAR(3),
  PHONE VARCHAR(13),
  EMAIL VARCHAR(50),
  UNIQUE(MEM_ID)
);

-- ���̺� ���� ���
CREATE TABLE MEM_UNIQUE3(
  MEM_NO NUMBER NOT NULL,
  MEM_ID VARCHAR(20) NOT NULL,
  MEM_PWD VARCHAR(20) NOT NULL,
  MEM_NAME VARCHAR(20) NOT NULL,
  GENDER CHAR(3),
  PHONE VARCHAR(13),
  EMAIL VARCHAR(50),
  UNIQUE(MEM_NO),
  UNIQUE(MEM_ID)    
);

-- ���̺� ���� ���
-- 2���� �÷��� ��� �ߺ��� Ȯ��(ex) (1, user01)!=(1, user02)
CREATE TABLE MEM_UNIQUE4(
  MEM_NO NUMBER NOT NULL,
  MEM_ID VARCHAR(20) NOT NULL,
  MEM_PWD VARCHAR(20) NOT NULL,
  MEM_NAME VARCHAR(20) NOT NULL,
  GENDER CHAR(3),
  PHONE VARCHAR(13),
  EMAIL VARCHAR(50),
  UNIQUE(MEM_NO, MEM_ID) -- �ѽ��� ����ũ�ؾ� ��

);

INSERT INTO mem_unique4 VALUES(1, 'user01', 'pass01', '�̰���', '��', '010-1234-5678', 'user01@gmail.com');
INSERT INTO mem_unique4 VALUES(2, 'user01', 'pass01', 'ä����', '��', '010-1234-5678', 'user01@gmail.com');
-- ���� UNIQUE �������� ����

INSERT INTO MEM_UNIQUE4 VALUES(3, 'user03', 'pass03', '���糲', '��', '010-1234-5678', 'user01@gamil.com');
--> ������ ��ȿ�� ���� �ƴϾ ��

-------------------------------------------------------------------------------------------
/*
    * CHECK(���ǽ�) ��������
     : ����ڰ� ���� ���������� �ְ� ���� ��
*/

-- �÷� ���
CREATE TABLE MEM_CHECK(
   MEM_NO NUMBER NOT NULL,
   MEM_ID VARCHAR2(20) NOT NULL,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3) CHECK(GENDER IN('��','��')),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50)
);

-- ���̺� ���
CREATE TABLE MEM_CHECK2(
   MEM_NO NUMBER NOT NULL,
   MEM_ID VARCHAR2(20) NOT NULL,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50),
   UNIQUE(MEM_ID),
   CHECK(GENDER IN ('��', '��'))
);


INSERT INTO MEM_CHECK VALUES(1, 'user01', 'pass01', '�̰���', '��', '010-1234-5678', 'user01@gmail.com');
INSERT INTO MEM_CHECK VALUES(2, 'user02', 'pass01', '���糲', '��', '010-1234-5678', 'user02@gmail.com');


-------------------------------------------------------------------------------------------
/*
    * PRIMARY KEY(�⺻Ű) ��������
     : ���̺��� �� ����� �ĺ��ϱ� ���� ���� �÷� �ο��ϴ� ��������(�ĺ��� ����)
     
     EX) ȸ����ȣ, �й�, �����ȣ, �ֹ���ȣ, �����ȣ, ����� ��ȣ, ....
     
     -PRIMARY KEY(�⺻Ű) ���������� �ο��ϸ� NOT NULL + UNIQUE ���������� �ǹ�
     >> ��ü������ �˻�, ����, �����Ҷ� �⺻Ű�� �÷����� �̿���
*/


-- �÷� ���
CREATE TABLE MEM_PRIMARY(
   MEM_NO NUMBER PRIMARY KEY,
   MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3) CHECK(GENDER IN('��','��')),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50)
);

-- ���̺� ���
-- �������� �̸�����: CONSTRAINT �����������̸� �������ǽ�
CREATE TABLE MEM_PRIMARY3(
   MEM_NO NUMBER,
   MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT ID_UNIQUE UNIQUE,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3) CONSTRAINT MEM_GENDER CHECK(GENDER IN('��','��')),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50),
   CONSTRAINT MEM_PK PRIMARY KEY (MEM_NO)
);

INSERT INTO MEM_PRIMARY VALUES(1, 'user01', 'pass01', 'ȫ�浿', '��', null, null);
INSERT INTO MEM_PRIMARY VALUES(2, 'user02', 'pass02', '���糲', '��', null, null);
INSERT INTO MEM_PRIMARY VALUES(2, 'user03', 'pass03', '�̰���', '��', null, null);

-- ����Ű
-- �⺻Ű�� 2�� �־��� �� 2���� ��� �ϳ��� �⺻Ű�� ������
-- ���̺� ���� ������θ� ����
CREATE TABLE MEM_PRIMARY4(
   MEM_NO NUMBER,
   MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT ID_UNIQUE UNIQUE,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3) CONSTRAINT MEM_GENDER CHECK(GENDER IN('��','��')),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50),
   CONSTRAINT PK PRIMARY KEY (MEM_NO, MEM_ID)
);
/*
   - ���� Ű ��� ����(�� ���)
   
   1, A // 2���� ��� �ϳ��� �⺻Ű ��Ȱ�� ��
   1, B
   1. A -- ���� ���� ��
   2, A
   2, B
   2, C
*/

/*
    * �������� �ο��� �������Ǹ���� �����ִ� ���
    
    >> �÷� ���� ���
    CREATE TABLE ���̺��(
        �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] ��������,
        �÷��� �ڷ���
    );
    
    >> ���̺� ���� ���
    CREATE TABLE ���̺��(
        �÷��� �ڷ���,
        �÷��� �ڷ���,
        [CONSTRAINT �������Ǹ�] ��������(�÷���)
    );
*/

CREATE TABLE TB_LIKE(
   MEM_NO NUMBER,
   MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT ID_UNIQUE UNIQUE,
   MEM_PWD VARCHAR2(20) NOT NULL,
   MEM_NAME VARCHAR2(20) NOT NULL,
   GENDER CHAR(3) CONSTRAINT MEM_GENDER CHECK(GENDER IN('��','��')),
   PHONE VARCHAR2(13),
   EMAIL VARCHAR2(50),
   CONSTRAINT PK PRIMARY KEY (MEM_NO, MEM_ID)
);

INSERT INTO TB_LIKE VALUES(1, 'A', SYSDATE);
INSERT INTO TB_LIKE VALUES(2, 'B', SYSDATE);

-- ����Ű �������� ����
INSERT INTO TB_LIKE VALUES(1, 'A', SYSDATE);
INSERT INTO TB_LIKE VALUES(2, 'B', SYSDATE);

-- ����Ű�� �⺻Ű�̱� ������ NOT NULL + UNIQUE
-- �� �÷��� NULL�� �ȵǰ�, 2���� �÷��� ���ļ� �����ؾ� ��
INSERT INTO TB_LIKE VALUES(3, NULL, SYSDATE);

--====================================================================================
-- ȸ����� ���̺�� ȸ�����̺� 2�� ����
-- ȸ�� ��� ���̺�
CREATE TABLE MEM_GRADE(
   GRADE_CODE NUMBER PRIMARY KEY,
   GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO MEM_GRADE VALUES(10, '�Ϲ�ȸ��');
INSERT INTO MEM_GRADE VALUES(20, '���ȸ��');
INSERT INTO MEM_GRADE VALUES(30, 'Ư��ȸ��');

-- ȸ�� ���̺�
CREATE TABLE MEM(
   MEM_NO NUMBER CONSTRAINT PK PRIMARY KEY,
   MEM_ID VARCHAR(20) NOT NULL UNIQUE,
   MEM_PW VARCHAR(20) NOT NULL,
   MEM_NAME VARCHAR(20) NOT NULL,
   GENDER CHAR(3) CONSTRAINT GEN CHECK(GENDER IN('��', '��')),
   GRADE_ID NUMBER
);

INSERT INTO MEM VALUES(1, 'user01', 'pass01', '�̰���', '��', 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', '���糲', '��', 30);
INSERT INTO MEM VALUES(3, 'user03', 'pass03', 'ä����', '��', 100);
-- ��ȿ�� ȸ����޹�ȣ�� �ƴԿ��� �ұ��ϰ� �Էµ�

-------------------------------------------------------------------------------------------
/*
   * �ܷ�Ű(FOREIGN KEY) ��������
   : �ٸ� ���̺� �����ϴ� ���� ���;� �Ǵ� Ư���÷��� �ο��ϴ� ��������
   --> �ٸ� ���̺��� �����Ѵٰ� ǥ��
   --> �ַ� �ܷ�Ű �������ǿ� ���� ���̺� ���� ���谡 ������
   
   >> �÷� ���� ���
      �÷��� �ڷ��� [CONSTRAINT �������Ǹ�]REFERENCES ������ ���̺��[(�������÷���)]
      
   >> ���̺� ���� ���
    [CONSTRAINT �������Ǹ�]FOREIGN KEY(�÷���) REFERENCES ������ ���̺��[(�������÷���)]   
*/

CREATE TABLE MEM2(
   MEM_NO NUMBER PRIMARY KEY,
   MEM_ID VARCHAR(20) NOT NULL UNIQUE,
   MEM_PW VARCHAR(20) NOT NULL,
   MEM_NAME VARCHAR(20) NOT NULL,
   GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
   GRADE_ID NUMBER REFERENCES MEM_GRADE(GRADE_CODE)    -- �÷� ���� ���
 --  FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) --���̺� ���� ���
);

INSERT INTO MEM2 VALUES(1, 'user01', 'pass01', '�̰���', '��', 10);
INSERT INTO MEM2 VALUES(2, 'user02', 'pass02', '���糲', '��', 30);
INSERT INTO MEM2 VALUES(3, 'user03', 'pass03', 'ä����', '��', NULL);
-- �ܷ�Ű ���������� �⺻������ NULL���� �����

INSERT INTO MEM2 VALUES(3, 'user03', 'pass03', 'ä����', '��', 100);
-- �ܷ�Ű �������� ����
-- MEM_GRADE(�θ����̺�) -|---------------<-- MEM2(�ڽ����̺�)

--> �̶� �θ����̺��� �����Ͱ��� ������ ��� ���� �߻�
-- �����ͻ���: DELETE FROM ���̺�� WHERE ����;

-- �ڽ����̺��� ������� �ʴ� ���� �÷����� ���� ����
DELETE FROM MEM_GRADE 
WHERE GRADE_CODE = 20;

-- �ڽ����̺��� ������� �ʴ� ���� �÷����� ���� �Ұ�
DELETE FROM MEM_GRADE 
WHERE GRADE_CODE = 10;

--------------------------------------------------------------------------------
/*
    * �ڽ����̺� ������ �ܷ�Ű �������� �ο��� �� �����ɼ� ���� ����
    - ���� �ɼ� : �θ����̺��� ������ ������ �ڽ����̺��� ����ϰ� �ִ� ���� ��� ó������
    
    1)ON DELETE RESTRICTED(�⺻��): ���� ���� �ɼ�����, �ڽ����̺��� ���� �ִ� ���̸� �θ����̺��� ���� �ȵ�
    2)ON DELETE SET NULL: �θ����̺� ������ ������ �ڽ����̺��� ���� �ִ� ������ NULL�� �����ϰ� ����
    3)ON DELETE CASCADE: �θ����̺� ������ ������ �ڽ����̺��� ���� �ִ� �൵ ����
*/
DROP TABLE MEM;
DROP TABLE MEM2;

-- �ܷ�Ű ������ �������̺�� ������ �������̺��� �⺻Ű�� �÷��� �ڵ����� ������

CREATE TABLE MEM(
   MEM_NO NUMBER PRIMARY KEY,
   MEM_ID VARCHAR(20) NOT NULL UNIQUE,
   MEM_PW VARCHAR(20) NOT NULL,
   MEM_NAME VARCHAR(20) NOT NULL,
   GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
   GRADE_ID NUMBER REFERENCES MEM_GRADE ON DELETE SET NULL
);

INSERT INTO MEM VALUES(1, 'user01', 'pass01', '�̰���', '��', 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', '���糲', '��', 30);
INSERT INTO MEM VALUES(3, 'user03', 'pass03', '�۹̿�', '��', 20);
INSERT INTO MEM VALUES(4, 'user04', 'pass04', '��غ�', '��', 30);
INSERT INTO MEM VALUES(5, 'user05', 'pass05', 'ä����', '��', NULL);

DELETE FROM MEM_GRADE WHERE GRADE_CODE = 30;
--������ �ڽ��� NULL������ �ٲ�

DROP TABLE MEM;

CREATE TABLE MEM(
   MEM_NO NUMBER PRIMARY KEY,
   MEM_ID VARCHAR(20) NOT NULL UNIQUE,
   MEM_PW VARCHAR(20) NOT NULL,
   MEM_NAME VARCHAR(20) NOT NULL,
   GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
   GRADE_ID NUMBER REFERENCES MEM_GRADE ON DELETE CASCADE
);

INSERT INTO MEM_GRADE VALUES(1, 30, 'Ư��ȸ��');
INSERT INTO MEM VALUES(1, 'user01', 'pass01', '�̰���', '��', 10);
INSERT INTO MEM VALUES(2, 'user02', 'pass02', '���糲', '��', 30);
INSERT INTO MEM VALUES(3, 'user03', 'pass03', '�۹̿�', '��', 20);
INSERT INTO MEM VALUES(4, 'user04', 'pass04', '��غ�', '��', 30);
INSERT INTO MEM VALUES(5, 'user05', 'pass05', 'ä����', '��', NULL);

DELETE FROM MEM_GRADE WHERE GRADE_CODE = 30;

--------------------------------------------------------------------------------
/*
    * DEFAULT �� �����ϱ�
    �÷��� ���� ������ �ʾ��� �� �⺻������ �־���
    
    �÷��� �ڷ��� DEFAULT �⺻�� [��������]
*/
CREATE TABLE MEMBER2(
   MEM_NO NUMBER PRIMARY KEY,
   MEM_ID VARCHAR2(20) NOT NULL,
   MEM_AGE NUMBER,
   HOBBY VARCHAR2(20) DEFAULT '����',
   MEM_DATE DATE DEFAULT SYSDATE
);
INSERT INTO MEMBER2 VALUES(1, 'user01', 25, '���ڱ�', '24/06/13');
INSERT INTO MEMBER2 VALUES(2, 'user02', null, null, null);
INSERT INTO MEMBER2 VALUES(3, 'user03', 27, default, default);

INSERT INTO MEMBER2 (MEM_NO, MEM_ID, MEM_AGE) VALUES(4, 'user04', 25);

--============================================================================================
----------------------- tjoeun �������� ���� ----------------------------------------
/*
   * SUBQUERY�� �̿��� ���̺� ����
   ���̺����ϴ� ����
   
   [ǥ����]
   CREATE TABLE ���̺�� AS ��������;
*/
-- EMPLOYEE ���̺��� ����(�÷�������)�� ���ο� ���̺� ����
CREATE TABLE EMPLOYEE_COPY
AS SELECT *
   FROM EMPLOYEE;
-- �÷�, �����Ͱ� ���� ��
-- ���������� NOT NULL�� �����. �������� �ȵ�
--   FRIMARY KEY, DEFAULT, COMMENT...�� ����ȵ�

-- EMPLOYEE ���̺��� ����(�÷������� ������)�� ���ο� ���̺� ����
CREATE TABLE EMPLOYEE_COPY3
AS SELECT *
   FROM EMPLOYEE
   WHERE 1 = 0;

-- EMPLOYEE ���̺��� ����(�÷������� ������)�� �÷��� ���� ���ϴ� �÷������� ���ο� ���̺� ����
CREATE TABLE EMPLOYEE_COPY3
AS SELECT EMP_ID, EMP_NAME, SALARY
   FROM EMPLOYEE
   WHERE 1 = 0;
   
-- EMPLOYEE ���̺��� ����(�÷������� ������)�� �÷��� �������̺� ���� �÷��� ����
CREATE TABLE EMPLOYEE_COPY4
AS SELECT EMP_ID, EMP_NAME, SALARY, SALARY*12 ����
   FROM EMPLOYEE;
   --�������� SELECT���� ����� �Ǵ� �Լ����� ����� ��� �ݵ�� ��Ī�� �����ؾ� ��

-----------------------------------------------------------------------------
/*
   * ���̺� ���� �� �������� �߰�
   ALTER TABLE ���̺�� ������ ����
   - PRIMARY KEY:ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���)
   - FOREIGN KEY:ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFERENCES ���������̺��[(�������÷���)]
   - UNIQUE:ALTER TABLE ���̺�� ADD UNIQUE(�÷���)
   - CHECK:ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�)
   - NOT NULL:ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL
*/
-- EMPLOYEE_COPY ���̺� PRIMARY KEY ���� ���� �߰�
ALTER TABLE EMPLOYEE_COPY ADD PRIMARY KEY(EMP_ID);

-- EMPLOYEE_COPY ���̺� �ܷ�Ű ���� ���� �߰�
ALTER TABLE EMPLOYEE_COPY ADD FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT;

-- COMMENT
COMMENT ON COLUMN EMPLOYEE_COPY.EMP_ID IS '������̵�';


-------------------------------��������---------------------------------
--  DDL ��������
/*
�������� ���α׷��� ����� ���� ���̺�� �����
�̶�, �������ǿ� �̸��� �ο��� ��.
       �� �÷��� �ּ��ޱ�

1. ���ǻ�鿡 ���� �����͸� ������� ���ǻ� ���̺�(TB_PUBLISHER)
   �÷�  :  PUB_NO(���ǻ��ȣ) NUMBER -- �⺻Ű(PUBLISHER_PK) 
	PUB_NAME(���ǻ��) VARCHAR2(50) -- NOT NULL(PUBLISHER_NN)
	PHONE(���ǻ���ȭ��ȣ) VARCHAR2(13) - �������� ����

   - 3�� ������ ���� ������ �߰��ϱ�
*/

CREATE TABLE TB_PUBLISHER (
    PUB_NO NUMBER CONSTRAINT PUBLISHER_PK PRIMARY KEY,
    PUB_NAME VARCHAR2(50) CONSTRAINT PUBLISHER_NN NOT NULL,
    PHONE VARCHAR2(13)
);

COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '���ǻ��ȣ';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '���ǻ��̸�';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '���ǻ� ��ȭ��ȣ';

INSERT INTO TB_PUBLISHER VALUES(1, '�ƹ���', '010-1234-5678');
INSERT INTO TB_PUBLISHER VALUES(2, '�𸣰�', '010-5654-4678');
INSERT INTO TB_PUBLISHER VALUES(3, '�ƹ���', '010-1654-7478');

DROP TABLE TB_PUBLISHER;

/*
2. �����鿡 ���� �����͸� ������� ���� ���̺�(TB_BOOK)
   �÷�  :  BK_NO (������ȣ) NUMBER -- �⺻Ű(BOOK_PK)
	BK_TITLE (������) VARCHAR2(50) -- NOT NULL(BOOK_NN_TITLE)
	BK_AUTHOR(���ڸ�) VARCHAR2(20) -- NOT NULL(BOOK_NN_AUTHOR)
	BK_PRICE(����) NUMBER
	BK_PUB_NO(���ǻ��ȣ) NUMBER -- �ܷ�Ű(BOOK_FK) (TB_PUBLISHER ���̺��� �����ϵ���)
			         �̶� �����ϰ� �ִ� �θ����� ���� �� �ڽ� �����͵� ���� �ǵ��� �ɼ� ����
   - 5�� ������ ���� ������ �߰��ϱ�
*/

CREATE TABLE TB_BOOK(
  BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
  BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
  BK_AUTHOR VARCHAR2(50) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
  BK_PRICE NUMBER,
  BK_PUB_NO NUMBER CONSTRAINT BOOK_FK REFERENCES TB_PUBLISHER ON DELETE CASCADE
);



COMMENT ON COLUMN TB_BOOK.BK_NO IS 'å��ȣ';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS 'å�̸�';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS 'å����';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS 'å����';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '���ǻ��ȣ';


INSERT INTO TB_BOOK VALUES(111, '�ظ�����', '�蹹��', '15000', 1);
INSERT INTO TB_BOOK VALUES(222, '������', 'ȫ�浿', '14000', 3);
INSERT INTO TB_BOOK VALUES(333, '����', '�ƹ���', '12000', 2);
INSERT INTO TB_BOOK VALUES(444, '������', '������', '10000', 1);
INSERT INTO TB_BOOK VALUES(555, '���ũŻ��', '��', '13000', 2);
/*
3. ȸ���� ���� �����͸� ������� ȸ�� ���̺� (TB_MEMBER)
   �÷��� : MEMBER_NO(ȸ����ȣ) NUMBER -- �⺻Ű(MEMBER_PK)
   MEMBER_ID(���̵�) VARCHAR2(30) -- �ߺ�����(MEMBER_UQ)
   MEMBER_PWD(��й�ȣ)  VARCHAR2(30) -- NOT NULL(MEMBER_NN_PWD)
   MEMBER_NAME(ȸ����) VARCHAR2(20) -- NOT NULL(MEMBER_NN_NAME)
   GENDER(����)  CHAR(1)-- 'M' �Ǵ� 'F'�� �Էµǵ��� ����(MEMBER_CK_GEN)
   ADDRESS(�ּ�) VARCHAR2(70)
   PHONE(����ó) VARCHAR2(13)
   STATUS(Ż�𿩺�) CHAR(1) - �⺻������ 'N' ���� ����, �׸��� 'Y' Ȥ�� 'N'���θ� �Էµǵ��� ��������(MEMBER_CK_STA)
   ENROLL_DATE(������) DATE -- �⺻������ SYSDATE, NOT NULL ��������(MEMBER_NN_EN)

   - 5�� ������ ���� ������ �߰��ϱ�
   
*/
CREATE TABLE TB_MEMBER(
   MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
   MEMBER_ID VARCHAR2(30) CONSTRAINT MEMBER_UQ UNIQUE,
   MEMBER_PWD VARCHAR2(30) CONSTRAINT MEMBER_NN_PWD NOT NULL,
   MEMBER_NAME VARCHAR2(20) CONSTRAINT MEMBER_NN_NAME NOT NULL,
   GENDER CHAR(1) CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN('M', 'F')),
   ADDRESS VARCHAR2(70),
   PHONE VARCHAR2(13),
   STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN('Y','N')) ,
   ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL 
);
DROP TABLE TB_MEMBER;

COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS '���̵�';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME IS 'ȸ����';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '����';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS '�ּ�';
COMMENT ON COLUMN TB_MEMBER.PHONE IS '����ó';
COMMENT ON COLUMN TB_MEMBER.STATUS IS 'Ż�𿩺�';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '������';

INSERT INTO TB_MEMBER VALUES(1111, 'id001', 'pw001', 'vince', 'M', '����� ������', '010-4354-3562', 'N', DEFAULT);
INSERT INTO TB_MEMBER VALUES(1142, 'id002', 'pw002', 'hello', 'F', '����� ���α�', '010-4454-5562', 'Y', DEFAULT);
INSERT INTO TB_MEMBER VALUES(4333, 'id003', 'pw004', 'hi', 'M', '����� �߶���', '010-4334-3562', 'N', DEFAULT);
INSERT INTO TB_MEMBER VALUES(5434, 'id004', 'pw004', 'yeah', 'F', '����� ������', '010-4364-7562', 'N', DEFAULT);
INSERT INTO TB_MEMBER VALUES(3255, 'id005', 'pw005', 'oh', 'M', '����� �����', '010-4114-3212', 'N', DEFAULT);

/*
4. � ȸ���� � ������ �뿩�ߴ����� ���� �뿩��� ���̺�(TB_RENT)
   �÷�  :  RENT_NO(�뿩��ȣ) NUMBER -- �⺻Ű(RENT_PK)
	RENT_MEM_NO(�뿩ȸ����ȣ) NUMBER -- �ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���
			�̶� �θ� ������ ������ �ڽ� ������ ���� NULL�� �ǵ��� �ɼ� ����
	RENT_BOOK_NO(�뿩������ȣ) NUMBER -- �ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���
			�̶� �θ� ������ ������ �ڽ� ������ ���� NULL���� �ǵ��� �ɼ� ����
	RENT_DATE(�뿩��) DATE -- �⺻�� SYSDATE

   - 3�� ���� ���õ����� �߰��ϱ�
*/

CREATE TABLE TB_RENT(
   RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
   RENT_MEM_NO NUMBER CONSTRAINT RENT_FK_ME REFERENCES TB_MEMBER ON DELETE SET NULL,
   RENT_BOOK_NO NUMBER CONSTRAINT RENT_FK_BOOK REFERENCES TB_BOOK ON DELETE SET NULL,
   RENT_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_RENT.RENT_NO IS '�뿩��ȣ';
COMMENT ON COLUMN TB_RENT.RENT_MEM_NO IS '�뿩ȸ����ȣ';
COMMENT ON COLUMN TB_RENT.RENT_BOOK_NO IS '�뿩������ȣ';
COMMENT ON COLUMN TB_RENT.RENT_DATE IS '�뿩��';

INSERT INTO TB_RENT VALUES(1, 4333, 111, '22/11/23');
INSERT INTO TB_RENT VALUES(2, 5434, 444, '22/05/11');
INSERT INTO TB_RENT VALUES(3, 3255, 333, '23/01/05');
