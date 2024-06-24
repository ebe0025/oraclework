/*
   * TRIGGER
    : ���̺��� DML���� ���� ��������� ���� ������ 
    �ڵ����� ������ ������ �̸� ������ �� �� �ִ� ��ü
    
    EX)
    ȸ��Ż��� ȸ�����̺����� DELETE�� �� ��, Ż��ȸ���鸸 �����ϴ� ���̺� �ڵ�����
    INSERTó��
    �Ű� Ƚ���� ���� ���� ������ �ڵ����� �ش� ȸ���� ������Ʈ�� ó���ϰ�
    ������� INSERT�ɶ� ���� �ش��ǰ�� �������� UPDATE�� �ؾߵ� ��
    
    * Ʈ������ ����
    - SQL�� �����Ű�� ���� �з�
    > BOFORE TRIGGER : ��õ� ���̺� �̺�Ʈ�� �߻��Ǳ� ���� Ʈ���� ����
    > AFTER TRIGGER : ��õ� ���̺� �̺�Ʈ�� �߻��ǰ� �� �Ŀ� Ʈ���� ����
    
    - SQL���� ���� ������ �޴� �� �࿡ ���� �з�
     > STATEMENT TRIGGER(���� Ʈ����): �̺�Ʈ�� �߻��� SQL���� ���� �� �ѹ��� Ʈ���� ����
     > ROW TRIGGER(�� Ʈ����): �ش� SQL�� ������ �� ���� Ʈ���� ����
                             (FOR EACH ROW �ɼ� ����ؾ� ��)
                             > : OLD- �����÷��� ����ִ� ��
                             > : NEW- ���� ���� ��
     * Ʈ���� ����
     [ǥ����]
     CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
     BEFORE|AFTER INSERT|UPDATE|DELETE ON ���̺��
     [FOR EACH ROW]
     [DECLARE
        ���� ����;]
      BEGIN
       ���೻��
      [EXCEPTION
         ����ó������;]
      END;
      /
      
      * Ʈ���� ����
      DROP TRIGGER Ʈ���Ÿ�;
*/

--EMPLOYEE ���̺� INSERT�߻��ϰ� �� �� ȯ���λ� Ʈ����
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT ON EMPLOYEE
BEGIN
  DBMS_OUTPUT.PUT_LINE('���Ի���� ������ ���Ű� ȯ���մϴ�');
END;
/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE) 
VALUES(223, '�����', '021010-3145758', 'J1');

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE) 
VALUES(224, '���糲', '071010-4145758', 'J2');

-- ��ǰ �԰� �� ���� �������� ����ǵ��� Ʈ���� ����
-- >> �ʿ��� ���̺�� ������ ����

-- 1. ��ǰ�� ������ ���̺� ��
CREATE TABLE TB_PRODUCT(
  PCODE NUMBER PRIMARY KEY, -- ��ǰ��ȣ
  PNAME VARCHAR2(30) NOT NULL, -- ��ǰ��
  BRAND VARCHAR2(30) NOT NULL,
  STOCK_QUANT NUMBER DEFAULT 0 -- ��� ���� 
);
-- 1.2 ��ǰ��ȣ�� ���� ������ ����
CREATE SEQUENCE SEQ_PCODE
START WITH 200
INCREMENT BY 5;

-- 1.3 ��ǰ �߰�
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������ ����4','�Ｚ', DEFAULT);
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������17','apple', 10);
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, 'ȫ�̳�Ʈ10','������', 20);

-- 2. ��ǰ �԰� ���̺� ����
CREATE TABLE TB_PROSTOCK (
    TCODE NUMBER PRIMARY KEY,                     -- �԰��ȣ
    PCODE NUMBER REFERENCES TB_PRODUCT NOT NULL,  -- ��ǰ��ȣ
    TDATE DATE,                                   -- �԰�¥
    STOCK_COUNT NUMBER NOT NULL,                        -- ����
    STOCK_PRICE NUMBER NOT NULL                   -- �԰�ܰ�
);
-- 2.2 �԰��ȣ�� ���� ������ ����
CREATE SEQUENCE SEQ_TCODE;

-- 3. ��ǰ �Ǹ� ���̺� ����
CREATE TABLE TB_PROSALE (
    SCODE NUMBER PRIMARY KEY,                     -- �ǸŹ�ȣ
    PCODE NUMBER REFERENCES TB_PRODUCT NOT NULL,  -- ��ǰ��ȣ
    SDATE DATE,                                   -- �Ǹų�¥
    SALE_COUNT NUMBER NOT NULL,                        -- ����
    SALE_PRICE NUMBER NOT NULL                   -- �ǸŴܰ�
);

-- 3.2 �ǸŹ�ȣ�� ���� ������ ����
CREATE SEQUENCE SEQ_SCODE;

------------------------------- �Ա�
-- ��ǰ��ȣ 200�� ��ǰ 10��
INSERT INTO TB_PROSTOCK
VALUES(SEQ_TCODE.NEXTVAL, 200, SYSDATE, 10, 2100000); 
-- ��ǰ���̺� ������ 10�� UPDATE
UPDATE TB_PRODUCT
  SET STOCK_QUANT = STOCK_QUANT + 10
  WHERE PCODE = 200;

COMMIT;

-- 210�� ��ǰ�� 5�� �ǸŵǾ���
INSERT INTO tb_prosale
VALUES(SEQ_SCODE.NEXTVAL, 210, SYSDATE, 5, 350000);

-- ��ǰ���̺� ������ 10�� UPDATE
UPDATE TB_PRODUCT
  SET STOCK_QUANT = STOCK_QUANT - 5
  WHERE PCODE = 210;
COMMIT;

--TB_PRODUCT ���̺� �Ź� �ڵ����� ������ UPDATE�ϴ� Ʈ���� ����

--TB_PROSTCK ���̺� INSERT�̺�Ʈ �߻���
UPDATE TB_PRODUCT
   SET STOCK_QUANT = STOCK_QUANT + 10
WHERE PCODE = 200;

/*
UPDATE TB_PRODUCT
   SET STOCK_QUANT = STOCK_QUANT + �԰�� ����(INSERT�� �ڷ��� STOCK_COUNT)
WHERE PCODE = �԰�� ��ǰ��ȣ(INSERT�� �ڷ��� PCODE��)
*/

CREATE OR REPLACE TRIGGER TRG_STOCK
AFTER INSERT ON TB_PROSTOCK
FOR EACH ROW
BEGIN
   UPDATE TB_PRODUCT
     SET STOCK_QUANT = STOCK_QUANT + :NEW.STOCK_COUNT
     WHERE PCODE = :NEW.PCODE; 
END;
/

-- 205�� 3�� �԰�
INSERT INTO TB_PROSTOCK
VALUES(SEQ_TCODE.NEXTVAL, 205, SYSDATE, 3, 1900000);

-- 210�� 5�� �԰�
INSERT INTO TB_PROSTOCK
VALUES(SEQ_TCODE.NEXTVAL, 210, SYSDATE, 5, 350000);



CREATE OR REPLACE TRIGGER TRG_SALE
AFTER INSERT ON TB_PROSALE
FOR EACH ROW
BEGIN
  UPDATE TB_PRODUCT
    SET STOCK_QUANT = STOCK_QUANT - :NEW.SALE_COUNT
    WHERE PCODE = :NEW.PCODE;
END;
/
ROLLBACK;

-- 210�� 10�� �Ǹ�
INSERT INTO TB_PROSALE 
VALUES(SEQ_SCODE.NEXTVAL, 210, SYSDATE, 10, 400000);

-- 200�� 3�� �Ǹ�
INSERT INTO TB_PROSALE 
VALUES(SEQ_SCODE.NEXTVAL, 200, SYSDATE, 3, 2200000);

-- �ǸŽ� ���������� �� ���� �Ǹ����� ���ϵ��� �ϴ� Ʈ���� ����
-- �ǸŵǱ����� Ʈ���� ���� �Ǿ�� ��
/*
   *����� ���� EXCEPTION
    RAISE_APPLICATION_ERROR([�����ڵ�], [�����޼���])
    - �����ڵ� : -20000 ~ -20999 ������ �ڵ�
*/

CREATE OR REPLACE TRIGGER TRG_SALE
BEFORE INSERT ON TB_PROSALE
FOR EACH ROW
DECLARE
  SCOUNT NUMBER;
BEGIN
  SELECT STOCK_QUANT
  INTO SCOUNT
  FROM TB_PRODUCT
  WHERE PCODE = :NEW.PCODE;
  
  IF (SCOUNT >= :NEW.SALE_COUNT) 
  THEN 
    UPDATE TB_PRODUCT
    SET STOCK_QUANT = STOCK_QUANT - :NEW.SALE_COUNT
    WHERE PCODE = :NEW.PCODE;
  ELSE
    RAISE_APPLICATION_ERROR(-20001, '������ ����');
  END IF;
END;
/

-- 200�� 5�� �Ǹ�
INSERT INTO TB_PROSALE 
VALUES(SEQ_SCODE.NEXTVAL, 200, SYSDATE, 5, 2200000);

-- 205�� 15�� �Ǹ�
INSERT INTO TB_PROSALE 
VALUES(SEQ_SCODE.NEXTVAL, 205, SYSDATE, 15, 2100000);