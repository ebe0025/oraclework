/*
    *VIEW
    SELECT���� �����صѼ� �ִ� ��ü
    (���� ���̴� �� SELECT���� ������ �ξ��ٰ� ȣ���Ͽ� ����� �� �ִ�)
    �ӽ����̺� ���� ����(���� �����Ͱ� ����ִ°� �ƴ�-> ���� ���̺�)
*/

-- �ѱ� �ٹ��ϴ� ����� ���, �����, �μ���, �޿�, �ٹ�������
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�ѱ�';

-- ���þ� �ٹ��ϴ� ����� ���, �����, �μ���,�޿�, �ٹ�������
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '���þ�';

-- �Ϻ� �ٹ��ϴ� ����� ���, �����, �μ���,�޿�, �ٹ�������
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�Ϻ�';

---------------------------------------------------------------------------------
/*
    1. VIEW ����
    [ǥ����]
    CREATE VIEW ���
    AS ��������;
*/
-- �����ڰ���
GRANT CREATE VIEW TO TJOEUN;

-- VIEW ����
CREATE VIEW VM_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING (NATIONAL_CODE);

SELECT * FROM VM_EMPLOYEE;

-- �ѱ����� �ٹ��ϴ� ��� �˻�
SELECT *
FROM VM_EMPLOYEE
WHERE NATIONAL_NAME = '�ѱ�';

-- ���þƿ��� �ٹ��ϴ� ��� �˻�
SELECT *
FROM VM_EMPLOYEE
WHERE NATIONAL_NAME = '���þ�';

-- �Ϻ����� �ٹ��ϴ� ��� �˻�
SELECT *
FROM VM_EMPLOYEE
WHERE NATIONAL_NAME = '�Ϻ�';

---------------------------------------------------------------------------------
/*
   * ���÷��� ��Ī �ο�
     ���������� ���������� �Լ���, ������� ����Ǹ� �ݵ�� ��Ī�� �ο��� ��� ��
*/
-- �� ����� ���, �����, ���޸�, ����(��/��), �ٹ������ ��ȸ�� �� �ִ� ��(VM_EMP_JOB) ����
-- CREATE OR REPLACE VIEW : �̹� ���� �̸��� �䰡 ������ ����� ��. ������ ����

CREATE OR REPLACE VIEW VM_EMP_JOB
AS SELECT EMP_ID, EMP_NAME, JOB_NAME, 
DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��')
, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);
-- ���� : �Լ����� �� �÷��� ��Ī �ο� ����

CREATE OR REPLACE VIEW VM_EMP_JOB
AS SELECT EMP_ID, EMP_NAME, JOB_NAME, 
DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��') ����
, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) �ٹ����
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);

-- ��Ī�� �ٸ� ������ε� �ο�����
CREATE OR REPLACE VIEW VM_EMP_JOB(���, �����, ���޸�, ����, �ٹ����)
AS SELECT EMP_ID, EMP_NAME, JOB_NAME, 
DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��')
, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);

-- ��������� �����, �ٹ���� �˻�
SELECT �����, �ٹ����
 FROM VM_EMP_JOB
 WHERE ���� = '��';
 
 -- 30�� �̻� �ٹ��� ��������� �����, ���޸� �˻�
 SELECT �����, ���޸�
 FROM VM_EMP_JOB
 WHERE �ٹ���� >= 30;
 
----------------------------------------------------------------------------------
/*
   * �� ����
   DROP VIEW ���
*/
DROP VIEW VM_EMP_JOB;

----------------------------------------------------------------------------------
/*
   * ������ VIEW�� ���� DML��밡��
   VIEW���� INSERT, UPDATE. DELETE�� �����ϸ� ���� �����ͺ��̽��� �ݿ���
*/
-- ��(VM_JOB)JOB���̺��� ��������
CREATE OR REPLACE VIEW VM_JOB
AS SELECT * FROM JOB;

--�信 �߰�
INSERT INTO VM_JOB VALUES('J8', '����');

SELECT * FROM JOB;
SELECT * FROM VM_JOB;

-- �信�� UPDATE
UPDATE VM_JOB 
SET JOB_NAME = '�˹�'
WHERE JOB_CODE = 'J8';

-- �信�� ����
DELETE FROM VM_JOB
WHERE JOB_CODE = 'J8';

/*
    * ��, DML��ɾ�� ������ �Ұ����� ��찡 �� ����
    1) �信 ���ǵ��� �ʴ� �÷��� �����ϰ��� �ϴ� ���
    2) �信 ���ǵǾ� �ִ� �÷� �߿� �������̺� �� NOT NULL���������� �����Ǿ� �ִ� ���
    3) ����� �Լ������� ���ǵǾ� �ִ� ���
    4) �׷��Լ��� GROUP BY���� ���ԵǾ� �ִ� ���
    5) DISTINCT ������ ���Ե� ���
    6) JOIN�� �̿��Ͽ� ���� ���̺��� ������ѳ��� ���
*/

-- 1)�信 ���ǵǾ� ���� ���� �÷��� �����ϰ��� �ϴ� ���
CREATE OR REPLACE VIEW VM_JOB
AS SELECT JOB_CODE
   FROM JOB;
   
SELECT * FROM JOB;
SELECT * FROM VM_JOB;

-- INSERT(����)
INSERT INTO VM_JOB(JOB_CODE, JOB_NAME) VALUES('J8');

-- UPDATE(����)
UPDATE VM_JOB
SET JOB_NAME = '����'
WHERE JOB_CODE = 'J7';

-- DELETE(����)
DELETE 
 FROM VM_JOB
 WHERE JOB_NAME = '���';


-- 2) ���� ���ǵǾ� ���� ���� �÷� �߿��� �������̺� �� NOT NULL���������� �����Ǿ� �ִ� ���
CREATE OR REPLACE VIEW VM_JOB
AS SELECT JOB_NAME
   FROM JOB;
   
SELECT * FROM JOB;
SELECT * FROM VM_JOB;

-- INSERT(����)
INSERT INTO VM_JOB VALUES('����');
-- ���� �������̺��� (NULL, '����'); -- JOB_CODE�� NULL ���� ������� ����

-- UPDATE(����)
UPDATE VM_JOB
  SET JOB_NAME = '����'
  WHERE JOB_NAME = '���';
  
ROLLBACK;

-- DELETE �� �� �θ����̺��� VIEW�� ������ٸ� �ܷ�Ű �������ǵ� ������ �Ѵ�.
-- �ڽ����̺� ���� �ִ� �����Ͷ�� ���� �ȵ�

-- 3) ����� �Լ������� ���ǵǾ� �ִ� ���
CREATE OR REPLACE VIEW VM_EMP_SAL
AS SELECT EMP_ID, EMP_NAME, SALARY ,SALARY * 12 ����
   FROM EMPLOYEE;
   
-- INSERT (����) : ������ �������̺� ���� �÷�
INSERT INTO VM_EMP_SAL VALUES(300, '�����', 3000000, 36000000); 

-- UPDATE (����) : ������ �������̺� ���� �÷�
UPDATE VM_EMP_SAL
SET ���� = 20000000
WHERE EMP_ID = 214;

-- UPDATE(����)
UPDATE VM_EMP_SAL
   SET SALARY = 2000000
WHERE EMP_ID = 214;

ROLLBACK;

-- 4) �׷��Լ��� GROUP BY���� ���ԵǾ� �ִ� ���
CREATE OR REPLACE VIEW VM_GROUP_DEPT
AS SELECT DEPT_CODE, SUM(SALARY) �հ�, CEIL(AVG(SALARY)) ���
   FROM EMPLOYEE
   GROUP BY DEPT_CODE;

--INSERT(����)
INSERT INTO VM_GROUP_DEPT 
VALUES('D3', 80000000, 40000000);

--UPDATE(����)
UPDATE VM_GROUP_DEPT 
SET DEPT_CODE = 'D1';

--DELETE(����)
DELETE  VM_GROUP_DEPT 
WHERE DEPT_CODE = 'D1';


--5) DISTINCT ������ ���Ե� ���
CREATE OR REPLACE VIEW VM_JOB
AS SELECT DISTINCT JOB_CODE
    FROM EMPLOYEE;
    
--INSERT
INSERT INTO VM_JOB VALUES('J8');

--UPDATE(����)
UPDATE VM_JOB
   SET JOB_CODE = 'J8'
   WHERE JOB_CODE = 'J2';

--DELETE(����)
DELETE VM_JOB
WHERE JOB_CODE = 'J2';


--6) JOIN�� �̿��Ͽ� ���� ���̺��� ������ѳ��� ���
CREATE OR REPLACE VIEW VM_JOIN
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
       FROM EMPLOYEE
       JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
       
-- INSERT
INSERT INTO VM_JOIN VALUES(600, 'Ȳ�̿�', 'ȸ�������');

-- UPDATE(����)
UPDATE VM_JOIN
  SET EMP_NAME = '�����'
  WHERE EMP_ID = 201;
  
-- UPDATE(����)
UPDATE VM_JOIN
  SET DEPT_TITLE = '�λ������'
  WHERE EMP_ID = 200;
----------------------------------------------------------------------------------
/*
   * VIEW �ɼ�
   CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW ���
   AS ��������
   [WITH CHECK OPTION]
   [WITH READ ONLY];
   
   1) OR REPLACE : ������ ������ �䰡 �ִٸ� �����, ���ٸ� ���� ����
   2) FORCE | NOFORCE
      > FORCE :���������� ����� ���̺��� �������� �ʾƵ� �䰡 ������
      > NOFORCE : ���������� ����� ���̺��� ���� �����ؾ߸� �䰡 ������
   3) WITH CHECK OPTION: DML�� ���������� ����� ���ǿ� ������ �����θ� DML�� �����ϵ��� ��
   4) WITH READ ONLY : �並 ��ȸ�� ����(DML�� ����Ұ�)
*/
-- 2) FORCE|NOFORCE
--    NOFORCE
CREATE OR REPLACE NOFORCE VIEW VM_EMP
AS SELECT TCODE, TNAME, TCONTENT
     FROM IT;

-- FORCE
CREATE OR REPLACE FORCE VIEW VM_EMP
AS SELECT TCODE, TNAME, TCONTENT
     FROM IT;
     
-- INSERT INTO VM_EMP VALUES(1, 'NAME', 'CONTENT'); ����
-- ���� �並 ����Ϸ��� IT��� �������̺��� �־�� ��밡��
CREATE TABLE IT(
   TCODE NUMBER,
   TNAME VARCHAR2(20),
   TCONTENT VARCHAR2(100)
);

-- 3) WITH CHECK OPTION
-- WITH�� ������� �ʾ��� ��
CREATE OR REPLACE VIEW VM_EMP
AS SELECT *
   FROM EMPLOYEE
   WHERE SALARY >= 3000000;
   
--UPDATE 204���� �޿��� 2000000���� ����
UPDATE VM_EMP
SET SALARY = 2000000
WHERE EMP_ID = 204;

ROLLBACK;

--WITH�� ����Ͽ� VIEW ����
CREATE OR REPLACE VIEW VM_EMP
AS SELECT *
   FROM EMPLOYEE
   WHERE SALARY >= 3000000
WITH CHECK OPTION;

--UPDATE 204���� �޿��� 2000000���� ����
UPDATE VM_EMP
SET SALARY = 2000000
WHERE EMP_ID = 202;
-- ���� : WITH CHECK OPTION (3000000�̸����δ� ���� �Ұ�)
UPDATE VM_EMP
SET SALARY = 4000000
WHERE EMP_ID = 204;

ROLLBACK;

-- 4) WITH READ ONLY

CREATE OR REPLACE VIEW VM_EMP
AS SELECT EMP_ID, EMP_NAME, BONUS
   FROM EMPLOYEE
   WHERE BONUS IS NOT NULL
WITH READ ONLY;

-- ����(DML���� �Ұ�)
DELETE FROM VM_EMP WHERE EMP_ID = 204;

UPDATE VM_EMP
SET BONUS = 0.4
WHERE EMP_ID = 200;




