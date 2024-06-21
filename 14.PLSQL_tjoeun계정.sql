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
  1.1 ���۷���Ÿ�� ���� ���� �� �ʱ�ȭ
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