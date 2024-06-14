/*
(') Ȧ����ǥ : ���ڿ�
(") �ֵ���ǥ : �÷���
*/

/*
    <SELECT>
    ������ ��ȸ�� �� ����ϴ� ����
    
    >> RESULT SET : SELECT
    
*/
-- EMPLOYEE���̺��� ��� �÷�(*) ��ȸ
SELECT *
    FROM employee;
    
SELECT *
FROM department;

select * FROM job;

-- EMPLOYEE���̺��� ���, �̸� �޿��� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
    FROM employee;
    
SELECT DEPT_ID, DEPT_TITLE
    FROM department;

--1��    
SELECT JOB_NAME FROM JOB;

--2��
SELECT * FROM department;

--3��
SELECT DEPT_ID, DEPT_TITLE FROM department;

--4��
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY
    FROM employee;
    
/*
    <�÷����� ���� �������>
    SELECT���� �÷��� �ۼ��κп� ������� ��� ����(�̶� �������� ��� ��ȸ)
*/
-- EMPLOYEE���̺��� �����, ��� ����(�޿�*12) ��ȸ
SELECT EMP_NAME, SALARY*12
    FROM employee;
    
-- EMPLOYEE���̺��� �����, �޿�, ���ʽ�
SELECT EMP_NAME, SALARY, BONUS
    FROM employee;
-- EMPLOYEE���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ��� ������ ����
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + bonus * salary)*12 
    FROM employee;
    --> ������� �� NULL���� ������ ��� ��������� ������� ������ NULL�� ��

-- EMPLOYEE���̺��� �����, �Ի��� �ٹ��ϼ�(���ó�¥-�Ի���)
-- DATE���³����� ���� ���� :  ������� �� ����
-- * ���ó�¥ : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
    FROM employee;
    
-----------------------------------------------------

/*
    <�÷��� ��Ī �����ϱ�>
    �������� �÷����� ����� �� ���� �״�� ��. �̶� ��Ī�� �ο��ϸ�
    ��Ī�� �÷����� ��
    
    [ǥ����]
    �÷��� ��Ī
    �÷��� AS ��Ī
    �÷��� "��Ī"
    �÷��� AS "��Ī"
*/

SELECT EMP_NAME, SALARY, BONUS, SALARY * 12 ����, (SALARY + bonus * salary)*12 AS �ѿ��� 
    FROM employee;

--��Ī�� Ư����ȣ�� ���Ⱑ ���� �ݵ�� �ֵ���ǥ(")�� ���������
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12 "\����(��)", (SALARY + bonus * salary)*12 AS �ѿ��� 
    FROM employee;
    
-- ���� �������� �����, �޿�, ���ʽ�, ���� (��), �� ����
SELECT EMP_NAME �����, SALARY �޿�, BONUS ���ʽ�, SALARY * 12 "\����(��)", (SALARY + bonus * salary)*12 AS �ѿ��� 
    FROM employee;
    
------------------------------------------------------------------
/*
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�(')
    
    SELECT���� ���ͷ��� ������ ��ġ ���̺�� �����ϴ� �����ͷ� ��ȸ ����
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ���
*/
-- EMPLOYEE ���, �����, �޿� ��ȸ - �÷��� �ϳ� ���� ���� �־��ֵ�����
SELECT EMP_ID, EMP_NAME, SALARY, '��' AS ����
    FROM employee;
    
---------------------------------------------------------------------
/*
    <���� ������ : ||>
    ���� �÷����� ��ġ �ϳ��� �÷����ΰ�ó�� �����ϰų�, �÷����� ���ͷ��� ������ �� ����
*/
-- EMPLOYEE ���, �����, �޿��� �ϳ��� �÷����� ��ȸ
SELECT EMP_ID || ' '|| EMP_NAME || ' '|| SALARY AS "����� �޿�"
    FROM employee;

-- �÷����� ���ͷ��� ����
SELECT EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�.'
    FROM employee;
    
SELECT EMP_ID, EMP_NAME, SALARY || '��'
    FROM employee;
    
-- EMPLOYEE�� �μ��ڵ� �ߺ����� ��ȸ
SELECT DISTINCT DEPT_CODE
FROM employee;

-- EMPLOYEE�� �����ڵ� �ߺ����� ��ȸ
SELECT DISTINCT JOB_CODE
FROM employee;

-- ���ǻ��� : DISTINCT�� SELECT���� �� �ѹ��� ��� ����
SELECT DISTINCT DEPT_CODE, JOB_CODE
    FROM employee;
    
------------------------------------------------------------
/*
    <WHERE ��>
    ��ȸ�ϰ��� �ϴ� ���̺�κ��� Ư�����ǿ� �����ϴ� �����͸� ��ȸ�� ��
    �̶� WHERE���� ���ǽ��� ���� ��
    ���ǽĿ����� �پ��� ������ ��밡��
    
    [ǥ����]
    SELECT �÷���,....
    !=, ^-. <> --> ���� ������ ��
*/

-- EMPLOYEE���� �μ��ڵ尡 'D9'�� ������� ��� �÷� ��ȸ
SELECT *
    FROM employee
    WHERE DEPT_CODE = 'D9';
    
-- EMPLOYEE���� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
    FROM employee
    WHERE DEPT_CODE = 'D1';
    
-- EMPLOYEE���� �μ��ڵ尡 'D1'�� �ƴ� ������� �����, �̸���, �μ��ڵ� ��ȸ
SELECT EMP_NAME, EMAIL, DEPT_CODE
    FROM employee
    WHERE DEPT_CODE != 'D1';
    
-- EMPLOYEE���� �޿��� 4�鸸�� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM employee
    WHERE SALARY >= '4000000';
    
-- EMPLOYEE���� �������� ����� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE AS ��ȭ��ȣ
    FROM employee
    WHERE ENT_YN = 'N';
    
SELECT EMP_NAME �����, SALARY �޿�, HIRE_DATE �Ի���, SALARY * 12 AS "����"
    FROM employee
    WHERE SALARY >= 3000000;

SELECT EMP_NAME �����, SALARY �޿�, SALARY * 12 AS ����, DEPT_CODE
    FROM employee
    WHERE SALARY * 12 >= 50000000;
    
SELECT EMP_ID ,EMP_NAME, JOB_CODE, ENT_YN ��翩��
    FROM employee
    WHERE JOB_CODE != 'J3';    
    
-----------------------------------------------------------------
/*
    <�� ������>
    AND (�׸���, ~�̸鼱)
    OR (�Ǵ�, ~DLRJSK)
*/

-- �μ��ڵ尡 'D9'�̸鼭 �޿��� 500���� �̻��� ����� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;
    
-- �μ��ڵ尡 'D9'�̰ų� �޿��� 300���� �̻��� ����� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' OR SALARY >= 3000000;
    
-- EMPLOYEE���� �޿��� 350���� �̻� 600���� ������ ������� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
    FROM EMPLOYEE
    WHERE SALARY <= 6000000 AND SALARY >= 3500000;
    
---------------------------------------------------------------
/*
    <BETWEEN AND>
    ���ǽĿ��� ���Ǵ� ����
    ~�̻� ~������ ���� ���� ������ ������ ����ϴ� ������
    
    [ǥ����[
    �񱳴���÷� BETWEEN ���Ѱ� AND ���Ѱ�
*/
SELECT EMP_NAME, EMP_ID, SALARY
    FROM EMPLOYEE
    WHERE SALARY BETWEEN 3500000 AND 6000000;
    
-- �Ի����� 2000�� ������ ���� ����� ��� �÷� ��ȸ
SELECT EMP_NAME, HIRE_DATE
    FROM EMPLOYEE
 --   WHERE hire_date BETWEEN '90/01/01' AND '00/01/01';
 WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '99/12/31';
 
 -------------------------------------------------------------
 
 /*
    <LIKE>
    ���ϰ����ϴ� �÷����� ���� ������ Ư�� ���Ͽ� �����ϴ� ��� ��ȸ
    
    [ǥ����]
    �񱳴���÷� LIKE 'Ư������'
    : Ư������ ���ý� '%''_'�� ���ϵ�ī��� �� �� ����
    
    >> '%' : 0�����̻�
    EX) �񱳴���÷� LIKE '����%'=> �񱳴���� �÷����� '����'�� ���۵Ǵ� ������ ��ȸ
    �񱳴���÷� LIKE '%����'=> �񱳴���� �÷����� '����'�� ������ ������ ��ȸ
        �񱳴���÷� LIKE '%����%'=> �񱳴���� �÷����� '����'�� ���ԵǾ� �ִ� ������ ��ȸ
        
    >> '_' : 1�����̻�
        EX) �񱳴���÷� LIKE '_����'=> �񱳴���� �÷����� '����'�տ� ������ �ѱ��ڰ� ����ִ� ������ ��ȸ
    �񱳴���÷� LIKE '_ _����'=> �񱳴���� �÷����� '����'�ڿ� ������ 2���ڰ� ����ִ� ������
        �񱳴���÷� LIKE '_����_'=> �񱳴���� �÷����� '����' �յڿ� �ѱ����̻� ���ԵǾ� �ִ� ������
    
 */
 
 --EMPLOYEE���� ��� ���� ������ ������� �����, �޿�, �Ի��� ��ȸ
 SELECT EMP_NAME, SALARY, HIRE_DATE
    FROM employee
    WHERE EMP_NAME LIKE '��%';
    
 --EMPLOYEE���� ����� �̸��� '��'�ڰ� ��� �ִ� ����� �����, �̸���, ��ȭ��ȣ
 SELECT EMP_NAME, EMAIL, PHONE
    FROM employee
    WHERE EMP_NAME LIKE '%��%';
 --EMPLOYEE���� ����� �̸��� '��'�ڰ� �߰��� ��� �ִ� ����� �����, �̸���, ��ȭ��ȣ
  SELECT EMP_NAME, EMAIL, PHONE
    FROM employee
    WHERE EMP_NAME LIKE '_��_';

--EMPLOYEE���� ��ȭ��ȣ�� 3��° �߰� '1'�� ����� �����, ��ȭ��ȣ ��ȸ

SELECT EMP_NAME, PHONE
    FROM employee
    WHERE PHONE LIKE '__1%';

--�̸����� _(�����) �տ� ���ڰ� 3������ ������� �����, �Ƹ��� ��ȸ
SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '____%';
-- ���ϵ�ī��� ����ϴ� ���ڿ� �÷����� ����ִ� ���ڰ� �����ϱ� ������ ��ȸ�� �ȵ�
-- ��δ� ���ϵ�ī��� �ν�
/*
   > ���ϵ�ī��� ���ڸ� ��������� ��
   > ������ ���ϵ�ī��� ESCAPE�� ���
    - �����Ͱ����� ����ϰ����ϴ� �� �տ� ������ ���ϵ�ī��(����,����,Ư������)�� �־���
    - Ư����ȣ '&'�� �Ⱦ��°��� ����. ����ڷκ��� �Է¹��� �� &�����
*/

SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '___$_%' ESCAPE '$';
  
SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '___d_%' ESCAPE 'd';
 
SELECT EMP_NAME, HIRE_DATE
  FROM employee
  WHERE EMP_NAME LIKE '%��';

SELECT EMP_NAME, PHONE
  FROM employee
  WHERE PHONE NOT LIKE '010%';

SELECT EMP_NAME, SALARY
  FROM EMPLOYEE
  WHERE EMP_NAME LIKE '%��%' AND SALARY >= 2400000;

SELECT DEPT_ID, DEPT_TITLE
 FROM department
 WHERE DEPT_TITLE LIKE '%�ؿܿ���%';
 
-------------------------------------------------------------------
/*
    <IS NULL/IS NOT NULL>
    �÷����� NULL�� ���� ��� NULL�� �񱳿� ����ϴ� ������
*/
-- EMPLOYEE���� ���ʽ��� ���� �ʴ� ����� �����,  �޿� ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS
  FROM employee
  --WHERE BONUS = NULL; -- ��ȸ�ȵ�
  WHERE BONUS IS NULL;
  
-- EMPLOYEE���� ���ʽ��� �޴� ����� �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS
  FROM employee
  WHERE BONUS IS NOT NULL;

-- EMPLOYEE���� ����� ����(MANAGER_ID���� NULL��) ����� �����, �μ��ڵ� ��ȸ
SELECT EMP_NAME, DEPT_CODE, MANAGER_ID
  FROM employee
  WHERE MANAGER_ID IS NULL;
  
-- EMPLOYEE���� �μ���ġ�� ���� �ʾ����� ���ʸ� �޴� ����� �����, ���ʽ�, �μ��ڵ�
SELECT EMP_NAME, BONUS, DEPT_CODE
  FROM EMPLOYEE
  WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
  
-------------------------------------------------------------
/*
    <IN/ NOT IN>
    IN : �÷����� ���� ������ ��� �߿� ��ġ�ϴ� �͸� ������ ��ȸ
    NOT IN : �÷����� ���� ������ ��� �߿� ��ġ�ϴ� ���� �����ϰ� ��ȸ
    
    [ǥ����]
    �񱳴���÷� IN ('��1', '��2', '��3',...)
*/
-- EMPLOYEE���� �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ����帣�� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
  FROM employee
  --WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5'; 
  WHERE DEPT_CODE IN ('D6','D8', 'D5');
  
-- EMPLOYEE���� �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� �ƴ� ����帣�� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
  FROM employee
  --WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5'; 
  WHERE DEPT_CODE NOT IN ('D6', 'D8', 'D5');

----------------------------------------------------------
/*
   <������ �켱����>
   1.()
   2. ���������
   3. ���Ῥ����
   4. �񱳿�����
   5. IS NULL / LIKE 'Ư������' /IN
   6. BETWEEN AND
   7. NOT(��������)
   8. AND(��������)
   9. OR(��������)
*/
-- ** AND�� OR���� ���� �� ����
-- �����ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ������� �����, �޿�, �����ڵ� ��ȸ
SELECT EMP_NAME, SALARY, JOB_CODE
  FROM employee
  WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >= 2000000;
  
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
  FROM employee
  WHERE DEPT_CODE IS NULL AND MANAGER_ID IS NULL;
  
SELECT EMP_ID, EMP_NAME, SALARY*12 ����, BONUS
  FROM EMPLOYEE
  WHERE SALARY * 12 >= 30000000 AND BONUS IS NULL;
  
SELECT EMP_ID, EMP_NAME, HIRE_DATE, DEPT_CODE
  FROM EMPLOYEE
  WHERE HIRE_DATE >= '95/01/01' AND DEPT_CODE IS NOT NULL;
  
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, BONUS
  FROM EMPLOYEE
  WHERE SALARY BETWEEN '2000000' AND '5000000' 
  AND HIRE_DATE >= '01/01/01'
  AND BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY, (SALARY + SALARY * BONUS) * 12 "���ʽ����Կ���" 
  FROM EMPLOYEE
  WHERE SALARY IS NOT NULL AND EMP_NAME LIKE '%��%';
  
----------------------------------------------------------------------------
/*
    <ORDER BY��>
    �����͸� �����Ͽ� ������
    SELECT���� ���� ������ �ٿ� �ۼ� �Ӹ� �ƴ϶� ���� ������ �������� ����
    
    [ǥ����]
    SELECT ��ȸ�� �÷�1, �÷�2,...
    FROM ���̺��
    WHERE ���ǽ�
    ORDER BY ���ı��� �÷��� | ���� | �÷� ����[ASC|DESC][NULLS FIRST | NULLS LAST]
    - ASC : �������� ����(������ �⺻��)
    - DESC : �������� ����
    
    - NULLS FIRST : �÷����� NULL�� ���� ��� �Ǿտ� ��ġ(������ DESC �϶��� �⺻��)
    - NULLS LIST : �÷����� NULL�� ���� ��� �ǵڿ� ��ġ(������ ASC �϶��� �⺻��)
*/
SELECT *
  FROM EMPLOYEE
--ORDER BY BONUS;              -- �������� ���� NULL�� LAST
--ORDER BY BONUS ASC;
--ORDER BY BONUS NULLS FIRST;
--ORDER BY BONUS DESC;           -- �������� ���� NULL�� FIRST
ORDER BY BONUS DESC, SALARY;     -- ���ı��� �������� ��, ���� �������� �����ϰ� ���� ������ �ڿ� �������� ����

-- ��� ����� �����, ���� ��ȸ(�̶�, ������ �������� ���� ��ȸ)
SELECT EMP_NAME, SALARY * 12 "����"
  FROM employee
--ORDER BY SALARY*12 DESC;
--ORDER BY ���� DESC; -- ��Ī��밡��
ORDER BY 2 DESC; -- 2��° �÷�

--------------------------------���� ����-----------------------
--1
SELECT *
  FROM JOB;
--2
SELECT JOB_CODE, JOB_NAME
  FROM JOB;
--3
SELECT *
  FROM department;
--4
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
  FROM EMPLOYEE;
--5
SELECT HIRE_DATE, EMP_NAME, SALARY
  FROM EMPLOYEE;
--6
SELECT EMP_NAME, SALARY *12 ����, (SALARY + SALARY * BONUS)*12 �Ѽ��ɾ�,(SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 AS �Ǽ��ɾ�
  FROM EMPLOYEE;
--7
SELECT EMP_NAME, SALARY, HIRE_DATE, PHONE
  FROM EMPLOYEE
  WHERE JOB_CODE = 'J1';
--8
SELECT EMP_NAME, SALARY,(SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 "�Ǽ��ɾ�", HIRE_DATE
  FROM EMPLOYEE
  WHERE (SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 >= 50000000;
--9
SELECT *
  FROM employee
  WHERE SALARY >= 4000000 AND job_code = 'J2';
--10
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
  FROM EMPLOYEE
  WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5') AND HIRE_DATE > '02/01/01';
--11
SELECT *
  FROM EMPLOYEE
  WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
--12
SELECT EMP_NAME
  FROM EMPLOYEE
  WHERE EMP_NAME LIKE '%��';
--13
SELECT EMP_NAME, PHONE
  FROM EMPLOYEE
  WHERE PHONE NOT LIKE '010%';
--14
SELECT *
  FROM EMPLOYEE
  WHERE EMAIL LIKE '____$_%' ESCAPE '$'
  AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6')
  AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
  AND SALARY >= 2700000;

  