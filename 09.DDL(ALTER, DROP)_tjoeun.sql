/*
    * ALTER
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    ALTER TABLE ���̺�� �����ҳ���;
    
*/

-------------------------------------------------------------------------
/*
    1) �÷� �߰�/ ����/ ����
*/
/*
   1.1 �÷� �߰�(ADD)
   
   [ǥ����]
   ADD �÷��� ������Ÿ�� [DEFAULT �⺻��]
*/ 
-- DEPT_COPY�� CNAME �÷� �߰�
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);

-- DEPT_COPY�� LNAME�÷� �߰� �⺻������ '�ѱ�'
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT '�ѱ�';
CREATE TABLE DEPT_COPY
AS SELECT *
FROM DEPT_CORY;

/*
   1.2 �÷� ����(MODIFY)
   
   [ǥ����]
   -������ Ÿ�� ����
    MODIFY �÷��� �ٲ����ϴµ�����Ÿ�� [DEFAULT �⺻��]
    
    - DEFAULT �� ����
     MODIFY �÷��� DEFAULT �ٲ����ϴ� �⺻��
*/ 
-- DEPT_COPY ���̺��� DEPT_ID�� �ڷ����� CHAR(3) ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);


-- DEPT_COPY ���̺��� DEPT_ID�� �ڷ����� NUMBER ����
-- ���� : ���ڷ� ������ �� ���� ���� �������
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;

-- DEPT_COPY ���̺��� DEPT_TITLE�� �ڷ����� VARCHAR2(10) ����
-- ���� : ����ִ� �����Ͱ��� �����ϰ����ϴ� �ڷ������� ū ���� ��� �ֱ� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(10);

-- DEPT_COPY ���̺��� DEPT_TITLE�� �ڷ��� VARCHAR2(40) ����
-- DEPT_COPY ���̺��� LOCATION_ID �ڷ��� VARCHAR2(2) ����
-- DEPT_COPY ���̺��� LNAME�÷��� �⺻���� '�̱�'���� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(40);
ALTER TABLE DEPT_COPY MODIFY LOCATION_ID VARCHAR2(2);
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT '�̱�';

-- ���ߺ��� ����
ALTER TABLE DEPT_COPY 
      MODIFY DEPT_TITLE VARCHAR2(40)
      MODIFY LOCATION_ID VARCHAR2(2)
      MODIFY LNAME DEFAULT '�̱�';
      
/*
   1.3 �÷� ����(DROP COLUMN)
   
   [ǥ����]
   DROP COLUMN �÷���
    
*/ 
ALTER TABLE DEPT_COPY DROP COLUMN CNAME;
-- DROP�� ���� ���� �ȵ�
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;
ALTER TABLE DEPT_COPY DROP COLUMN LNAME;

-- ���̺��� �ּ��� 1���� �÷��� �����ؾ� �Ѵ�
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_ID; -- ����

------------------------------------------------------------------------------
/*
   2. ���̺� ���� �� �������� �߰� /����
   2.1 �������� �߰�
   ALTER TABLE ���̺�� ������ ����
   - PRIMARY KEY:ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���)
   - FOREIGN KEY:ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFERENCES ���������̺��[(�������÷���)]
   - UNIQUE:ALTER TABLE ���̺�� ADD UNIQUE(�÷���)
   - CHECK:ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�)
   - NOT NULL:ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL
   
   + �������Ǹ��� �����Ϸ��� CONSTRAINT �������Ǹ� ��������
   
   2.2 �������� ����
     DROP CONSTRAINT ��������
     MODIFY �÷��� NULL(NOT NULL ���������� NULL �ٲܶ�)
*/
-- DEPARTMENT ���̺��� �����Ͽ� DEPT_COPY ���̺����
CREATE TABLE DEPT_COPY AS 
SELECT * 
FROM DEPARTMENT;

-- DEPT_COPY���̺� �������� �߰�
-- 1) DEPT_ID�÷��� �⺻Ű
-- 2) DEPT_TITLE �÷��� UNIQUE
-- 3) LNAME�÷��� NOT NULL
ALTER TABLE DEPT_COPY ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
                      ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_NAME);
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(10) DEFAULT '�ѱ�' NOT NULL;
ALTER TABLE DEPT_COPY MODIFY LNAME VARCHAR2(30) DEFAULT '�̱�';

-- �������� ����
ALTER TABLE DEPT_COPY
      DROP CONSTRAINT SYS_C007546;

ALTER TABLE DEPT_COPY
      DROP CONSTRAINT SYS_C007547
      MODIFY LNAME NULL;
      
------------------------------------------------------------------------------
/*
   3. �÷���/ �������Ǹ�/ ���̺�� ����
     3.1 �÷��� ����
     
        [ǥ����]
        RENAME COLUMN �����÷��� TO �ٲ��÷���
        
*/
-- DEPT_COPY���̺��� DEPT_TITLE �÷����� DEPT_NAME���� ����
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

/*
     3.2 �������Ǹ� ����
     
        [ǥ����]
        RENAME CONSTRAINT �����������Ǹ� TO �ٲ����Ǹ��
        
*/
ALTER TABLE DEPT_COPY ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
                      ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_NAME);
ALTER TABLE DEPT_COPY 
       MODIFY LNAME VARCHAR2(30) DEFAULT '�̱�' CONSTRAINT DCOPY_NN NOT NULL;

ALTER TABLE DEPT_COPY 
  RENAME CONSTRAINT DCOPY_PK TO COPY_UQ;
  
/*
     3.3 ���̺�� ����
     
        [ǥ����]
        RENAME [�������̺��] TO �ٲ����̺��
        
*/
--
ALTER TABLE DEPT_COPY
      RENAME TO DEPT_TEST;
      
--------------------------------------------------------------------------------
--���̺� ����
DROP TABLE DEPT_TEST;

/*
    - ���̺� ������ �ܷ�Ű�� �θ����̺��� ���� �ȵ�
      �׷��� �����ϰ� �ʹٸ�
      * ���1 : �ڽ����̺� ���� ������ �� �θ����̺� ����
      * ���2 : �θ����̺� �����ϴµ� �������� ���� �����ϴ� ���
               DROP TABLE �θ����̺�� CACADE CONSTRAINT;
*/