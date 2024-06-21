/*
   * SEQUENCE
     �ڵ����� ��ȣ�� �߻���Ű�� ������ �ϴ� ��ü
     �������� ���������� �������� ������Ű�鼭 ��������
     
     EX) ȸ����ȣ, �����ȣ, �Խñ۹�ȣ ....
*/
/*
    1. ������ ��ü ���� ���
     [ǥ����]
     CREATE SEQUENCE ��������
     [START WITH ���ۼ���]    --> ó�� �߻���ų ���۰� ����(�⺻��1)
     [INCREMENT BY ����]     --> � ������ų ������ ����(�⺻��1)
     [MAXVALUE ����]         --> �ִ밪 ����(�⺻�� ��ûŭ)
     [MINVALUE ����]         --> �ּҰ� ����(�⺻�� 1)
     [CYCLE | NOCYCLE]      --> ���� ��ȯ ���� ����(�⺻�� NOCYCLE)
     [CACHE | NOCACHE]      --> ĳ�ø޸� �Ҵ�(�⺻�� CACHE 20)
     
     * ĳ�ø޸� : �̸� �߻��� ������ �����ؼ� �����صδ� ����
                  �Ź� ȣ��� ������ ���Ӱ� ��ȣ�� �����ϴ°� �ƴ϶�
                  ĳ�ø޸� ������ �̸� ������ ��ȣ������ ���� ����(�ӵ��� ������)
                  ���������ϸ� ĳ�ø޸𸮿� �̸� ����� �� ��ȣ���� �� ���ư�
     ���̺� : TB_
     �� : VW_
     ������ : SEQ_
     Ʈ���� : TRG_
*/
-- ������ ����
CREATE SEQUENCE SEQ_TEST;

SELECT * FROM USER_SEQUENCES;

-- �ɼ��� ���� ������ ����
CREATE SEQUENCE SEQ_EMPNO
START WITH 500
INCREMENT BY 5
MAXVALUE 510
NOCYCLE
NOCACHE;
/*
    2. ������ ���
    
    ��������.CURRVAL: ���� �������� ��(���������� ������ NEXTVAL�� ��)
    ��������.NEXTVAL : ���������� ������ ���� �������Ѽ� �߻��� ��
                    ���� ������������ INCREMENT BY����ŭ ������ ��
                    == ��������.CURRVALE + INCREMENT BY ��
*/
SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
-- NEXTVAL�� ���ѹ��� �������� ���� �̻� CURRVAL �Ҽ� ����
-- ���������� ���������� ����� NEXTVAL�� ���� �����ؼ� �����ִ� �ӽð�

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --500
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; --500
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --505
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --510

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --���� : ������ MAXVALUE�� �ѱ� �� ����
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; --510

---------------------------------------------------------------------
/*
    3. ������ ���� ����
    
    ALTER SEQUENCE ��������
    [INCREMENT BY ����]
    [MAXVALUE ����]
    [MINVALUE ����]
    [CYCLE |NOCYCLE]
    [CACHE ����Ʈ ũ��|NOCACHE]

     ** ���� : START WITH�� ���� �Ұ�    
*/

-- SEQ_EMPNO ����
ALTER SEQUENCE SEQ_EMPNO
INCREMENT BY 10
MAXVALUE 600;

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;

--------------------------------------------------------------------------
/*
   4. ������ ����
*/
DROP SEQUENCE SEQ_EMPNO;

--------------------------------------------------------------------------
/*
   * ���� ����
*/
CREATE SEQUENCE SEQ_EID
START WITH 401
NOCACHE;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
            VALUES(SEQ_EID.NEXTVAL, '���糲', '101001-1283948', 'J1',SYSDATE);
            
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
            VALUES(SEQ_EID.NEXTVAL, '�۹̿�', '171101-4283948', 'J2',SYSDATE);