/*
     *DML(DATA MANIPULATION LANGUAGE):������ ���� ���
     :���̺� ���� ����(INSERT)�ϰų�, ����(UPDATE), ����(DELETE)�ϴ� ����
*/
--===================================================================================
/*
    *INSERT
    :���̺� ���ο� ���� �߰��ϴ� ����
    
    [ǥ����]
    1)INSERT INTO ���̺�� VALUES(��1, ��2, ��3....);
      ���̺��� ��� �÷��� ���� ���� �ְ��� �Ҷ�(���� �߰�)
      �÷��� ������ ���Ѽ� ���� �־�� ��
      
      ���� ���� �����ϸ� => NOT ENOUGH VALUE ����
      ���� ���� ������ => TOO MANY VALUES ����
*/

SELECT * FROM EMPLOYEE;
INSERT INTO EMPLOYEE_COPY VALUES(301, '�̸���', '030616-4123456', 'sun@naver.com', 
          '01012345678', 'D7', 'J5', 3500000, 0.1, 200, SYSDATE, NULL, 'N');
          
--------------------------------------------------------------------------------
/*
   2)INSERT INTO ���̺��(�÷���, �÷���,...) VALUES(��1, ��2,...);
   : ���̺� ���� ������ �÷����� ���� ������ �� ���
     -> ���� ������ �÷��� �̿��� ������ NULL�� ���� DEFAULT ���� �����Ǿ� ������ DEFAULT���� ��
     
     ** ����
        - �÷��� NOT NULL���������� ������ �ݵ�� ���� �־�ߵ�
          => DEFAULT ���� �����Ǿ� ������ �� �־��
          
*/
INSERT INTO EMPLOYEE_COPY(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE,PHONE)
VALUES('302', '�̰���', '120421-3456789', 'J5', SYSDATE, '0108970987');

INSERT INTO EMPLOYEE_COPY(EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE,PHONE)
VALUES('303', '���糲', '110711-4454579', SYSDATE, '01084330987');

INSERT INTO EMPLOYEE_COPY(EMP_ID, EMP_NAME, HIRE_DATE,PHONE)
VALUES('303', 'ä����',  SYSDATE, '01084330987');
--EMP_NO�� NULL�� ����

INSERT 
   INTO EMPLOYEE_COPY
       (
        EMP_ID
       ,EMP_NAME
       ,EMP_NO
       ,JOB_CODE
       ,HIRE_DATE
       ,PHONE
       )
   VALUES
      (
        '302'
       ,'�̰���'
       ,'120421-3456789'
       ,'J5'
       ,SYSDATE
       ,'0108970987'
      );
      
--------------------------------------------------------------------------------
/*
   3)INSERT INTO ���̺��(��������);
     VALUES�� ���� ���� �ִ� ��� ���������� ��ȸ�� ����� ��� INSERT����
*/
CREATE TABLE EMP_01(
    EMP_ID VARCHAR2(3),
    EMP_NAME VARCHAR2(20),
    DEPT_NAME VARCHAR2(35)
);
DROP TABLE EMP_01;

-- ��ü ������� ���, �����, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
 FROM EMPLOYEE_COPY, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID(+);
 
 INSERT INTO EMP_01 
        (SELECT EMP_ID, EMP_NAME, DEPT_TITLE
         FROM EMPLOYEE_COPY, DEPARTMENT
         WHERE DEPT_CODE = DEPT_ID(+));
         
--------------------------------------------------------------------------------
/*
    * INSERT ALL
    2�� �̻��� ���̺� ���� INSERT�� ��
    ����ϴ� ���������� ������ ���
    
    [ǥ����]
    INSERT ALL
    INTO ���̺��1 VALUE(�÷���, �÷���, ...)
    INTO ���̺��2 VALUE(�÷���, �÷���, ...)
         ��������;
*/
-- �׽�Ʈ�� ���̺� 2�� ����
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
   FROM EMPLOYEE
   WHERE 1=0;
   
CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
   FROM EMPLOYEE
   WHERE 1=0;
   
-- �μ��ڵ尡 D1�� ������� ���, �̸�, �μ��ڵ�, �Ի���, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

INSERT ALL 
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
     SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
     FROM EMPLOYEE
     WHERE DEPT_CODE = 'D1';
     
--------------------------------------------------------------------------------
/*
    * ������ �̿��ϴ� INSERT ALL
    
    [ǥ����[
    INSERT ALL
    WHEN ����1 THEN
         INTO ���̺��1 VALUES(�÷���, �÷���, ...)
    WHEN ����2 THEN
         INTO ���̺��2 VALUES(�÷���, �÷���, ...)
    ��������;
*/
-- 2000�⵵ ������ �Ի��� ������� ������ ���̺� ����
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
     FROM EMPLOYEE
     WHERE 1=0;

-- 2000�⵵ ���Ŀ� �Ի��� ������� ������ ���̺� ����
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
     FROM EMPLOYEE
     WHERE 1=0;
     
INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE;

--============================================================================
/*
   * UPDATE
     ���̺��� �����͸� �����ϴ� ����
     
     [ǥ����]
     UPDATE ���̺��
     SET �÷��� = �ٲܰ�,
         �÷��� = �ٲܰ�,
         ...
     [WHERE ����]; --> ** ����:������ �����ϸ� ��� ���� �����Ͱ� �����
*/

CREATE TABLE DEPT_CORY
AS SELECT * FROM DEPARTMENT;

-- D9 �μ����� ������ȹ�η� ����
UPDATE DEPT_CORY
SET DEPT_TITLE = '������ȹ��'
WHERE DEPT_ID = 'D9';

ROLLBACK;

-- EMPLOYEE_COPY ���̺��� �������� �޿��� 1,500,000DMFH DLSTKD
UPDATE EMPLOYEE_COPY
SET SALARY = 1500000
WHERE EMP_NAME = '������';

-- EMPLOYEE_COPY���̺��� �������� �޿��� 1800000���� �λ��ϰ� ���ʽ��� 10%
UPDATE EMPLOYEE_COPY
SET SALARY = 1800000,
    BONUS = 0.1
WHERE EMP_NAME = '������';

-- ��ü ����� �޿��� ������ �޿��� 10% �λ��� �޿�
UPDATE EMPLOYEE_COPY
SET SALARY = SALARY * 1.1;

--------------------------------------------------------------------------------
/*
    * ���������� ����� UPDATE
     [ǥ����]
     UPDATE ���̺��
     SET �÷��� = (��������)
     [WHERE ����];
*/

-- �̰��� ����� �޿��� ���ʽ��� ����������� �޿��� ���ʽ������� ����
UPDATE EMPLOYEE_COPY
SET SALARY = (SELECT SALARY
              FROM EMPLOYEE_COPY
              WHERE EMP_NAME = '������'),
    BONUS = (SELECT BONUS
              FROM EMPLOYEE_COPY
              WHERE EMP_NAME = '������')
WHERE EMP_NAME = '�̰���';
ROLLBACK;
-- ���߿� �������� ����
UPDATE EMPLOYEE_COPY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                       FROM EMPLOYEE_COPY
                       WHERE EMP_NAME = '������')
WHERE EMP_NAME = '�̰���';

-- �������� �޿��� ���ʽ� ������, ������, ������, ������
UPDATE EMPLOYEE_COPY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                       FROM EMPLOYEE_COPY
                       WHERE EMP_NAME = '������')
WHERE EMP_NAME IN ('������', '������', '������', '������');

-- ASIA �������� �ٹ��ϴ� ������� ���ʽ����� 0.3���� ����(EMPLOYEE_COPY, DEPARTMENT, LOCATION)
UPDATE EMPLOYEE_COPY
SET BONUS = 0.3
WHERE EMP_ID IN (SELECT EMP_ID 
       FROM DEPARTMENT
       JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
       JOIN EMPLOYEE_COPY ON (DEPT_CODE = DEPT_ID)
       WHERE LOCAL_NAME LIKE 'ASIA%');
ROLLBACK;
-- UPDATE�ÿ����� �������ǿ� ����Ǹ� �ȵ�
-- �������� DEPT_CODE�� D10���� ����
-- �θ����̺� D0 ��� �������� ����
UPDATE EMPLOYEE_COPY
SET DEPT_CODE = 'D0'
WHERE EMP_NAME = '������';

-- NOT NULL �������� ����
UPDATE EMPLOYEE_COPY
SET EMP_NO = NULL
WHERE EMP_NAME = '������';

---------------------------------------------------------------------------
/*
   *DELETE
     :���̺��� �����͸� �����ϴ� ����(�� �� ������ ����)
     
     [ǥ����]
     DELETE FROM ���̺��
     [WHERE ���Ǹ�]       --> **���� : ������ ������ ��� ������ ����
*/
DELETE FROM EMPLOYEE_COPY;
ROLLBACK;

DELETE FROM EMPLOYEE_COPY
WHERE EMP_NAME = '������';

DELETE FROM EMPLOYEE_COPY
WHERE DEPT_CODE IS NULL;
ROLLBACK;

/*
TRUNCATE : ���̺��� ��ü���� ������ �� ����ϴ� ����
            DELETE���� ����ӵ��� ����
            
   TRUNCATE TABLE ���̺��;
*/
TRUNCATE TABLE EMPLOYEE_COPY4;
ROLLBACK; --> �ѹ�ȵ�