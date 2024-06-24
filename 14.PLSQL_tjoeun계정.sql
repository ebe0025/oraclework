/*
    *PL/SQL
    PROCEDURAL LANGUAGE EXTENSION TO SQL
    
    ����Ŭ ��ü�� ����Ǿ� �ִ� ������ ���
    SQL���� ������ ������ ����, ����ó��(IF), �ݺ�ó��(LOOP,��, WHILE)���� 
    �����Ͽ� SQL�� ������ ������
    �ټ��� SQL���� �ѹ��� ���� ����(BLOCK����)
    
    * ����
    - [����� (DECLARE SECTION)]: DECLARE�� ����, ������ ����� ���� �� 
    �ʱ�ȭ�ϴ� �κ� 
    - ����� (EXECUTABLE SECTION):BEGIN�� ����, SQL�� �Ǵ� ���(���ǹ�, �ݺ���)����
    ������ ����ϴ� �κ�
    - [����ó����(EXCEPTION SECTION)]: EXCEPTION���� ����, ���� �߻��� �ذ��ϱ� ���� 
    ���� �̸� ����� �δ� �κ�
    
*/

-- * ȭ�鿡 ����ϱ�
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;
/
/*
  1. DECLARE �����
  ����, ��� �����ϴ� ����(����� ���ÿ� �ʱ�ȭ�� ����)
  �Ϲ�Ÿ�Ժ���, ���۷���Ÿ���� ����, ROWŸ���� ����
  
  1.1 �Ϲ�Ÿ�Ժ��� ���� �� �ʱ�ȭ
      [ǥ����] 
      ������ [CONSTANT]�ڷ���[:= ��]
*/

DECLARE
  EID NUMBER;
  ENAME VARCHAR2(20);
  PI CONSTANT NUMBER := 3.1415;
BEGIN
  EID := 600;
  ENAME := '�Ӽ���';
  DBMS_OUTPUT.PUT_LINE('EID: ' || EID );
  DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME );
  DBMS_OUTPUT.PUT_LINE('PI: ' || PI );
  END;
/
  
-- ����ڷκ��� �Է¹޾Ƽ� ���
DECLARE
  EID NUMBER;
  ENAME VARCHAR2(20);
  PI CONSTANT NUMBER := 3.14;
BEGIN
   EID := &��ȣ;
   ENAME := '&�̸�';
   
   DBMS_OUTPUT.put_line('EID: ' || EID);
   DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME);
   DBMS_OUTPUT.PUT_LINE('PI: ' || PI);
END;
/
-------------------------------------------------------------------------
/*
  1.2 ���۷���Ÿ�� ���� ���� �� �ʱ�ȭ
     : � ���̺��� � �÷��� ������Ÿ���� �����Ͽ� ��Ÿ������ ����
     
      [ǥ����] 
      ������ ���̺��.�÷���%TYPE;
*/

DECLARE
   EID EMPLOYEE.EMP_ID%TYPE;
   ENAME EMPLOYEE.EMP_NAME%TYPE;
   SAL EMPLOYEE.SALARY%TYPE;
BEGIN
   EID := 300;
   ENAME := '���缮';
   SAL := 4000000;

   DBMS_OUTPUT.PUT_LINE('EID: ' || EID);
   DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME);
   DBMS_OUTPUT.PUT_LINE('SAL: ' || SAL);
END;
/

DECLARE
   EID EMPLOYEE.EMP_ID%TYPE;
   ENAME EMPLOYEE.EMP_NAME%TYPE;
   SAL EMPLOYEE.SALARY%TYPE;
BEGIN
   --����� 200���� �����, �̸�, �޿� ��ȸ�Ͽ� �� ������ ����
   SELECT EMP_ID, EMP_NAME,SALARY
   INTO EID, ENAME, SAL
   FROM EMPLOYEE
   WHERE EMP_ID = &���;
   
   DBMS_OUTPUT.PUT_LINE('EID: ' || EID);
   DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME);
   DBMS_OUTPUT.PUT_LINE('SAL: ' || SAL);

END;
/


DECLARE
   EID EMPLOYEE.EMP_ID%TYPE;
   ENAME EMPLOYEE.EMP_NAME%TYPE;
   JCODE EMPLOYEE.JOB_CODE%TYPE;
   SAL EMPLOYEE.SALARY%TYPE;
   DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
   
BEGIN
   SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
   INTO EID, ENAME, JCODE, SAL, DTITLE
   FROM EMPLOYEE
   JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
   WHERE EMP_ID = &���;
   
   DBMS_OUTPUT.PUT_LINE('EID: ' || EID);
   DBMS_OUTPUT.PUT_LINE('ENAME: ' || ENAME);
   DBMS_OUTPUT.PUT_LINE('JCODE: ' || JCODE);
   DBMS_OUTPUT.PUT_LINE('SAL: ' || SAL);
   DBMS_OUTPUT.PUT_LINE('DTITLE: ' || DTITLE);

END;
/

-------------------------------------------------------------------------
/*
  1.3 ROWŸ���� ����
     : � ���̺��� �� �࿡ ���� ��� �÷����� �Ѳ����� ���� �� �ִ� ����
     
      [ǥ����] 
      ������ ���̺��%ROWTYPE;
*/

DECLARE
  E EMPLOYEE%ROWTYPE;
BEGIN
   SELECT * 
   INTO E
   FROM EMPLOYEE
   WHERE EMP_ID = &���;
   
   DBMS_OUTPUT.PUT_LINE('�����: ' || E.EMP_NAME);
   DBMS_OUTPUT.PUT_LINE('�޿�: ' || E.SALARY);
   --DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || NVL(E.BONUS); �����̱� ������ ���� ����
   --DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || NVL(E.BONUS, '����')); �ڷ����� ���� �ʾƼ� ����
   DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || NVL(E.BONUS, 0));
END;
/

DECLARE
  E EMPLOYEE%ROWTYPE;
BEGIN
  SELECT EMP_NAME, SALARY, BONUS -- ������ *�� ����ؾ� ��
  INTO E
  FROM EMPLOYEE
  WHERE EMP_ID = &���;
  
   DBMS_OUTPUT.PUT_LINE('�����: ' || E.EMP_NAME);
   DBMS_OUTPUT.PUT_LINE('�޿�: ' || E.SALARY);
   DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || NVL(E.BONUS, 0));
  
END;
/

-------------------------------------------------------------------------
/*
  2. �����
    <���Ǻ�>
    1) IF ���ǽ� THEN ���೻�� END IF; (���� IF��)
*/

-- ����� �Է¹޾� ���, �̸�, �޿�, ���ʽ�(%) ���
-- ��, ���ʽ��� ���� �ʴ� �����'���ʽ��� ���޹��� �ʴ� ����Դϴ�' ���

DECLARE
  EID EMPLOYEE.EMP_ID%TYPE;
  ENAME EMPLOYEE.EMP_NAME%TYPE;
  SALARY EMPLOYEE.SALARY%TYPE;
  BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
  SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS, 0)
  INTO EID, ENAME, SALARY, BONUS
  FROM EMPLOYEE
  WHERE EMP_ID = &���;
  

DBMS_OUTPUT.PUT_LINE('���: ' || EID);
DBMS_OUTPUT.PUT_LINE('�����: ' || ENAME);
DBMS_OUTPUT.PUT_LINE('�޿�: ' || SALARY);
IF BONUS = 0
THEN DBMS_OUTPUT.PUT_LINE('���ʽ��� ���޹��� �ʴ� ����Դϴ�');
END IF;

DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || BONUS * 100 || '%');

END;
/

-- 2) IF ���ǽ� THEN ���೻�� ELSE ���೻�� END IF; (IF-ELSE)
DECLARE
  EID EMPLOYEE.EMP_ID%TYPE;
  ENAME EMPLOYEE.EMP_NAME%TYPE;
  SALARY EMPLOYEE.SALARY%TYPE;
  BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
  SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS, 0)
  INTO EID, ENAME, SALARY, BONUS
  FROM EMPLOYEE
  WHERE EMP_ID = &���;
  

DBMS_OUTPUT.PUT_LINE('���: ' || EID);
DBMS_OUTPUT.PUT_LINE('�����: ' || ENAME);
DBMS_OUTPUT.PUT_LINE('�޿�: ' || SALARY);
IF BONUS = 0
THEN DBMS_OUTPUT.PUT_LINE('���ʽ��� ���޹��� �ʴ� ����Դϴ�');
ELSE DBMS_OUTPUT.PUT_LINE('���ʽ�: ' || BONUS * 100 || '%');
END IF;

END;
/



---------------------------- �ǽ� ����---------------------------------
/*
   ���۷��� ����: EID, ENAME, DTITLE, NCODE
       �����÷�: EMP_ID, EMP_NAME, DEPT_TITLE. NATIONAL_CODE
       
    �Ϲݺ��� : TEAM(�Ҽ�)
    
    ���� : ����ڰ� �Է��� ����� ���, �̸�, �μ���, �ٹ������ڵ带 ������ ����
          ��) NCODE���� KO�� ��� => TEAM ������ '������'
              NCODE���� KO�� �ƴ� ��� => TEAM ������ '�ؿ���;
              
              ��� : ���, �̸�, �μ���, �Ҽ�
*/

DECLARE
   EID EMPLOYEE.EMP_ID%TYPE;
   ENAME EMPLOYEE.EMP_NAME%TYPE;
   DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
   NCODE LOCATION.NATIONAL_CODE%TYPE;
   TEAM VARCHAR2(20);
BEGIN
   SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
   INTO EID, ENAME, DTITLE, NCODE
   FROM EMPLOYEE
   JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
   JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)

   WHERE EMP_ID = &���;
   


DBMS_OUTPUT.PUT_LINE('���: ' || EID);
DBMS_OUTPUT.PUT_LINE('�̸�: ' || ENAME);
DBMS_OUTPUT.PUT_LINE('�μ���: ' || DTITLE);

IF NCODE = 'KO'
THEN TEAM := '������';
ELSE TEAM := '�ؿ���';
END IF;
DBMS_OUTPUT.PUT_LINE('�Ҽ�: ' || TEAM);

END;
/

-------------------------------------------------------------------------
/*
    3) IF-ELSE IF ���ǹ�
    IF ���ǽ�1
       THEN ���೻��1
    ELSIF ���ǽ�2
       THEN ���೻��2
    ELSIF ���ǽ�3
       THEN ���೻��3
    ELSE ���೻��4
    END IF;
*/

-- ����ڷκ��� ������ �Է¹޾� ���� ���
DECLARE
  SCORE NUMBER;
  GRADE CHAR(1);
BEGIN
  SCORE := &����;
  IF SCORE >= 90 THEN GRADE := 'A';
  ELSIF SCORE >= 80 THEN GRADE := 'B';
  ELSIF SCORE >= 70 THEN GRADE := 'C';
  ELSIF SCORE >= 60 THEN GRADE := 'D';
  ELSE GRADE := 'F';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('����� ������ ' || SCORE ||'���̰�, ������ ' || GRADE || '�Դϴ�');
END;
/
---------------------------- �ǽ� ����---------------------------------
/*
    ����ڷκ��� ����� �Է� �޾� ����� �޿��� ��ȸ�Ͽ� SAL������ ����
    500���� �̻��̸� '���'
    499-300���� �̸� '�߱�'
    �������� '�ʱ�'
*/

/*
    4) CASE��(SWITCH CASE���� ����)
    CASE �񱳴����
    WHEN ���Ұ�1 THEN ���೻��1
    WHEN ���Ұ�2 THEN ���೻��2
    WHEN ���Ұ�3 THEN ���೻��3
    ELSE ���೻��4
    END;
    
*/

-- ����ڷκ��� ����� �Է¹޾� DEPT_CODE�� ��ȸ
-- DEPT_CODE�� D1�̸� �λ������ .....

DECLARE
  EID EMPLOYEE.EMP_ID%TYPE;
  ENAME EMPLOYEE.EMP_NAME%TYPE;
  DCODE EMPLOYEE.DEPT_CODE%TYPE;
  DNAME VARCHAR2(30);
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE
    INTO EID, ENAME,DCODE
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    DNAME := CASE DCODE
      WHEN 'D1' THEN '�λ������'
      WHEN 'D2' THEN  'ȸ�������'
      WHEN 'D3' THEN  '�����ú�'
      WHEN 'D4' THEN  '����������'
      WHEN 'D5' THEN  '�ؿܿ���1��'
      WHEN 'D6' THEN  '�ؿܿ���2��'
      WHEN 'D7' THEN  '�ؿܿ���3��'
      WHEN 'D8' THEN  '���������'
      ELSE '�ѹ��κ�'
    END;
    
    DBMS_OUTPUT.PUT_LINE(ENAME || '�� ' || DNAME|| '�Դϴ�');
END;
/

DECLARE
    SAL NUMBER;
    
BEGIN
END;
/

-----------------------------------------------------------------------
/*
    <LOOP>
    1) LOOP��
    
    [ǥ����]
    LOOP
      �ݺ������� ������ ����;
      - �ݺ����� �������� ����;
    END LOOP;
    
    * �ݺ����� �������� ���ǹ� 2����
     - IF ���ǽ� THEN EXIT; END IF;
     - EXIT WHEN ���ǽ�;
*/

-- 1) IF ���ǽ� THEN EXIT; END IF;
DECLARE
   N NUMBER := 1;
BEGIN
   LOOP
     DBMS_OUTPUT.PUT_LINE(N);
     N := N+1;
     
     IF N = 6 THEN EXIT;
     END IF;
   END LOOP;
END;
/

--2)EXIT WHEN ���ǽ�;

DECLARE
   N NUMBER := 1;
BEGIN
   LOOP
     DBMS_OUTPUT.PUT_LINE(N);
     N := N+1;
     
     EXIT WHEN N = 6;
    END LOOP;
END;
/

------------------------------------------------------------------------------
/*
   2. FOR LOOP��
   
   [ǥ����]
   FOR ���� IN [REVERTS] �ʱⰪ.. ������
   LOOP
      �ݺ��� ���๮;
   END LOOP;
*/

-- 1~5���� ���
BEGIN
  FOR I IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END;
/

-- 5~1���� ���
BEGIN
  FOR I IN REVERSE 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END;
/

DROP TABLE TEST;

CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE
);

CREATE SEQUENCE SEQ_TNO;

BEGIN
   FOR J IN 1..100
   LOOP
     INSERT INTO TEST VALUES(SEQ_TNO.NEXTVAL, SYSDATE);
   END LOOP;
END;
/

------------------------------------------------------------------------------
/*
   3) WHILE LOOP��
   
   [ǥ����]
   WHILE �ݺ����� ������ ����
   LOOP
      �ݺ��� ���๮;
   END LOOP;
*/
-- 1~5���� ���
DECLARE
  N NUMBER :=1;
BEGIN
  WHILE N < 6
  LOOP
     DBMS_OUTPUT.PUT_LINE(N);
     N := N+1;
  END LOOP;
END;
/

------------------------------------------------------------------------------
/*
   2. ����ó����
   EXCEPTION : ���ܸ� ó���ϴ� ����
   
   [ǥ����]
   EXCEPTION
     WHEN ���ܸ�1 THEN ����ó�� ����1;
     WHEN ���ܸ�2 THEN ����ó�� ����2;
     WHEN OTHERS THEN ����ó�� ����N;
     
     * �ý��� ����(����Ŭ���� �̸������ص� ����)
     - NO_DATA_FOUND : SELECT�� ����� �� �൵ ���� ���
     - TOO_MANY_ROWS : SELECT�� ����� �������� ���
     - ZERO_DIVEDE : 0���� ���� ��
     - DUP_VAL_ON_INDEX : UNIQUE �������ǿ� ����Ǿ��� ��
     ...........
*/
-- ZERO_DIVEDE 
DECLARE
  RESULT NUMBER;
BEGIN
  RESULT := 10/&����;
  DBMS_OUTPUT.PUT_LINE('���: ' || RESULT);
  
EXCEPTION
  WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('0���� ���� �� �����ϴ�');
END;
/

--DUP_VAL_ON_INDEX
BEGIN
   UPDATE EMPLOYEE
   SET EMP_ID = '&�����һ��'
   WHERE EMP_NAME = '�����';

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('�̹� �����ϴ� ����Դϴ�');
END;
/

-- �����ȣ�� 211���� 1��, 200���� 5��, 202���� ����
-- �����ȣ�� �Է¹޾� ����� ������ �ִ� ����� ���� ���
DECLARE
  EID EMPLOYEE.EMP_ID%TYPE;
  ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
  SELECT EMP_ID, EMP_NAME
  INTO EID, ENAME
  FROM EMPLOYEE
  WHERE MANAGER_ID = &������;
  
  DBMS_OUTPUT.PUT_LINE('��� ' || EID);
  DBMS_OUTPUT.PUT_LINE('����� ' || ENAME);
  
EXCEPTION
  WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('�ʹ� ���� ���� ��ȸ�Ǿ����ϴ�');
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('��ȸ ����� �����ϴ�');
END;
/

--1
DECLARE
  E EMPLOYEE%ROWTYPE;
  YEARSAL NUMBER;
BEGIN
  SELECT *
  INTO E
  FROM EMPLOYEE
  WHERE EMP_ID = &���;
  
  IF E.BONUS IS NULL
    THEN YEARSAL := E.SALARY * 12;
    ELSE YEARSAL := E.SALARY * (1+ E.BONUS) *12;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(E.EMP_NAME ||' ������ ������ ' || TO_CHAR(YEARSAL, 'L999,999,999') || ' �Դϴ�.');
END;
/

-- 2-1)
BEGIN
  FOR I IN 2..9
  LOOP
    IF I MOD 2 = 0 THEN
      FOR J IN 1..9
      LOOP
        DBMS_OUTPUT.PUT_LINE(I || ' * ' || J || ' = ' || (I * J));
      END LOOP;
    END IF;
  END LOOP;
END;
/
-- 2-2
DECLARE
  I NUMBER := 2;
  J NUMBER;
BEGIN 
  WHILE I <= 9
  LOOP
    IF MOD (I, 2) = 0 THEN
    J := 1;
    WHILE J <= 9
        LOOP
        DBMS_OUTPUT.PUT_LINE(I || ' * ' || J || ' = ' || (I * J));
        J := J + 1;
        END LOOP;
    END IF;
    I := I + 1;
  END LOOP;
END;
/

