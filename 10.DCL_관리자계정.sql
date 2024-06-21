/*
   *DCL(DATA CONTROL LANGUAGE):������ ���� ���
   ����(�����)���� �ý��� ���� �Ǵ� ��ü���ٱ��� �ο�(GRANT)�ϰų� ȸ��(REVOKE)�ϴ� ����
   
   >> �ý��� ����:DB�� �����ϴ� ����, ��ü�� ������ �� �ִ� ����
      �ý��� ������ ����
      - CREATE SESSION: ������ �� �ִ� ����
      - CREATE TABLE: ���̺��� ������ �� �ִ� ����
      - CREATE VIEW: �並 ������ �� �ִ� ����
      - CREATE SEQUENCE: �������� ������ �� �ִ� ����
      ...
      
   >> ��ü ���� ����: Ư�� ��ü���� ������ �� �ִ� ����
      ��ü ���� ������ ����
      
      ��������
      SELECT           TABLE, VIEW, SEQUENCE
      INSERT           TABLE, VIEW
      UPDATE           TABLE, VIEW
      DELETE           TABLE, VIEW
      ...
*/

-----------------------------------------------------------------
-- �ý��� ����
-- 1.SAMPLE /1234 ��������
ALTER SESSION SET "_oracle_script" = true;
CREATE USER SAMPLE IDENTIFIED BY 1234;

-- 2. ������ ���� ���� �ο�
GRANT CREATE SESSION TO SAMPLE;

-- 3. ���̺��� ������ �� �ִ� ���� �ο�
GRANT CREATE TABLE TO SAMPLE;

-- 4. tablespace �Ҵ�
ALTER USER SAMPLE QUOTA 2M ON USERS;
ALTER USER SAMPLE DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-----------------------------------------------------------------------
-- ��ü ����
-- 4. SAMPLE�������� TJOEUN������ EMPLOYEE�� SELECT�� �� �ִ� ����
GRANT SELECT ON TJOEUN.EMPLOYEE TO SAMPLE;

-- 5. SAMPLE������ TJOEUN������ EMPLOYEE�� INSERT�� �� �ִ� ����
GRANT INSERT ON TJOEUN.EMPLOYEE TO SAMPLE;

-----------------------------------------------------------------------
-- ���� ȸ��
-- REVOKE ȸ���� ���� ON ���̺�� FROM ������;
REVOKE SELECT ON TJOEUN.EMPLOYEE FROM SAMPLE;
REVOKE INSERT ON TJOEUN.EMPLOYEE FROM SAMPLE;

--------------------------------------------------------------------------
/*
    *ROLE
    : Ư�� ���ѵ��� �ϳ��� �������� ��Ƴ�����
    
    CONNET:CREATE + SESSION
    RESOURCE: CREATE TABLE + CREATE SEQUENCE + ...
    DBA : �ý��� �� ��ü������ ���� ��� ������ ���� �ִ� ��
    
    GRANT CONNECT, RESOURCE TO ������;
*/