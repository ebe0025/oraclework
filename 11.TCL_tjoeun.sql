/*
    * TCL (TRANSACTION CONTROL LANGUAGE): Ʈ������ ���� ���
    
    * Ʈ�����
      - �����ͺ��̽��� ���� �������
      - �������� �������(DML)���� �ϳ��� Ʈ����ǿ� ��� ó��
      DML�� �Ѱ��� ������ �� Ʈ������� �����ϸ� �ش� Ʈ������� ���� ���ó��
                                   �������� ������ Ʈ����Ǥ��� ���� ��� ó��
     COMMIT�ϱ� �������� ������׵��� �ϳ��� Ʈ����ǿ� ��Ƶ�
     - Ʈ������� ����� �Ǵ� SQL�� : INSERT, UPDATE, DELETE
     
     COMMIT(Ʈ����� ���� ó�� �� Ȯ��)
     ROLLBACK (Ʈ����� ���)
     SAVEPOINT (�ӽ�����)
     
     - COMMIT : �� Ʈ����ǿ� ����ִ� ������׵��� ���� DB�� �ݿ���Ű�ڴٴ� �ǹ�(���Ŀ� Ʈ������� �����)
     - ROLLBACK : �� Ʈ����� ����ִ� ������׵��� ����(���)�� �� ������ COMMIT�������� ���ư�
     - SAVEPOINT : ���� �� ������ �ش� ���θ����� �ӽ��������� ������ �δ� ��
                   ROLLBACK����� ��ü ��������� �����ϴ� ���� �ƴ϶� �Ϻθ� ����
*/
SELECT * FROM EMP_01;

-- ����� 303���� ��� ����
DELETE FROM EMP_01 
WHERE EMP_ID = 303;

-- ����� 302���� ��� ����
DELETE FROM EMP_01 
WHERE EMP_ID = 302;
ROLLBACK;

---------------------------------------------------------------------
-- ����� 214���� ��� ����
DELETE FROM EMP_01 
WHERE EMP_ID = 214;

SELECT * FROM EMP_01;

INSERT INTO EMP_01
VALUES(500, '��̿�', '�λ������');

COMMIT;

ROLLBACK; -- COMMIT�� �Ǿ��� ������ �ȵ�

---------------------------------------------------------------------
-- ����� 200, 201, 202���� ��� ����
DELETE FROM EMP_01
WHERE EMP_ID IN (200, 201, 202);

-- �ӽ����� ����
SAVEPOINT SP;

-- ����߰�
INSERT INTO EMP_01
VALUES(501, '�̼���','�ѹ���');

-- 220�� ��� ����
DELETE FROM EMP_01
WHERE EMP_ID = 220;

ROLLBACK TO SP;

SELECT * FROM EMP_01 ORDER BY EMP_ID;

COMMIT;

--------------------------------------------------------------------------
/*
    * �ڵ� COMMIT�� �Ǵ� ���
    - ���� ����
    - DCL�� DDL���� ����� ���
    
    * �ڵ� ROLLBACK�� �Ǵ� ���
    - ������ ����
    - ������ ����  ��ǻ�� DOWN
    
*/

-- 303 ��� ����
DELETE FROM EMP_01
WHERE EMP_ID = 303;

-- 500 ��� ����
DELETE FROM EMP_01
WHERE EMP_ID = 500;

-- DDL ����
CREATE TABLE TEST(
   TID NUMBER
);
-- DDL ������ �����ϴ� ���� COMMIT�� ��

ROLLBACK;