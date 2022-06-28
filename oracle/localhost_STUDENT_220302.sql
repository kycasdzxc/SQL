-- �μ� ���̺��� �μ� �̸� Į������ "��" ������ ��ġ�� ����Ͽ���.
SELECT * FROM DEPARTMENT;

SELECT DNAME, INSTR(DNAME, '��') FROM DEPARTMENT;

-- ���� ���̺��� ���� Į���� ���ʿ� "*" ���ڸ� �����Ͽ� 10����Ʈ�� ����ϰ�
-- ���� ���̵� Į���� �����ʿ� "+" ���ڸ� �����Ͽ� 12����Ʈ�� ����Ͽ���.
SELECT
    POSITION, LPAD(POSITION, 10, '*') LP,
    USERID, RPAD(USERID, 12, '+') RP
FROM PROFESSOR;

-- �л� ���̺��� �л� ID�� ���ڸ� �α��ڸ� *�� ����, ��ȭ��ȣ �� ���ڸ��� *�� ����
-- ID�� ���ڸ� �� ���ڸ� *�� ���� >> �ڸ����� 12���� ä���
SELECT * FROM STUDENT;

SELECT
    USERID, RTRIM(USERID, SUBSTR(USERID, -2)) || '**',
    TEL, RTRIM(TEL, SUBSTR(TEL, -3)) || '***'
FROM STUDENT;

SELECT
    USERID, RPAD(RTRIM(USERID, SUBSTR(USERID, -2)), 12, '*') ID
FROM STUDENT;

-- ������ ver.
SELECT
    USERID,
    SUBSTR(USERID, 0, LENGTH(USERID)-3) || '***' USER1,
    TEL,
    SUBSTR(TEL, 0, LENGTH(TEL)-3) || '***' RESULT1,
    LTRIM(SUBSTR(LPAD(TEL, 20), 0, 17)) || '***' RESULT2
FROM STUDENT;

-- ���� ���̺��� 101�а� ������ �ϱ��� ���(�� �ٹ����� 22��)�Ͽ�
-- �Ҽ��� ù°�ڸ��� ��°�ڸ����� �ݿø��� ���� �Ҽ��� ���� ù°�ڸ����� �ݿø��� ���� ����Ͽ���

SELECT
    SAL,
    SAL/22,
    ROUND(SAL / 22),
    ROUND(SAL / 22, 2),
    ROUND(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- ���� ���̺��� 101�а� ������ �ϱ��� ���(�� �ٹ��� 22��)�Ͽ�
-- �Ҽ��� ù°�ڸ��� ��°���̤ļ� ������ ���� �Ҽ��� ���� ù°�ڸ��� ������ ���� ����Ͽ���.
SELECT
    SAL,
    SAL/22,
    TRUNC(SAL / 22),
    TRUNC(SAL / 22, 2),
    TRUNC(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- ������ȣ�� 9908�� �ܼ��� �Ի����� �������� �Ի� 30�� �Ŀ� 60�� ���� ��¥�� ����Ͽ���.
SELECT
    PROFNO, NAME,
    HIREDATE,
    HIREDATE + 30,
    HIREDATE + 60
FROM PROFESSOR
WHERE PROFNO = 9908;

DESC PROFESSOR;

-- �Ի����� �Ի��� + 17��
-- 120���� �̸��� ������ ������ȣ, �Ի���, �Ի��Ϸκ��� �����ϱ����� ���� ��, �Ի��Ͽ��� 6���� ���� ��¥�� ����Ͽ���.
SELECT
    PROFNO, NAME,
    HIREDATE,
    ADD_MONTHS(HIREDATE, 12*17) ADD_17Y,
    ADD_MONTHS(ADD_MONTHS(HIREDATE, 12*17), 6) �Ի�6����,
    TRUNC(MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 12*17))) || '����' ������
FROM PROFESSOR
WHERE 120 > MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 12*17));

-- ������ ���� ���� ������ ��¥�� �ٰ����� �Ͽ����� ��¥�� ����Ͽ���
SELECT
    SYSDATE,
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, '�Ͽ���')
FROM DUAL;

-- 101�� �а� �������� �Ի����� ��, ��, ���� �������� �ݿø��Ͽ� ����Ͽ���.
SELECT
    PROFNO,
    TO_CHAR(HIREDATE, 'YYYY/MM/DD HH24:MI:SS') R1,
    TO_CHAR(ROUND(HIREDATE, 'HH24'), 'YYYY/MM/DD HH24:MI:SS') R2,
    TO_CHAR(ROUND(HIREDATE, 'DD'), 'YYYY/MM/DD HH24:MI:SS') R3,
    TO_CHAR(ROUND(HIREDATE, 'MM'), 'YYYY/MM/DD HH24:MI:SS') R4,
    TO_CHAR(ROUND(HIREDATE, 'YY'), 'YYYY/MM/DD HH24:MI:SS') R5
FROM PROFESSOR
WHERE DEPTNO = 101;

SELECT '22-02-02' - 1 FROM DUAL;

INSERT INTO STUDENT(BIRTHDATE) VALUES ('�Ż���', SYSDATE);
INSERT INTO STUDENT(BIRTHDATE) VALUES ('�Ż���2', '22/02/02'); -- ������ ����ȯ

-- �л� ���̺��� ������ �л��� �й��� ������� �߿��� ����� ����Ͽ���.
SELECT STUDNO, NAME, TO_CHAR(BIRTHDATE, 'YYYY/MM')
FROM STUDENT
WHERE NAME = '������';

-- �л� ���̺��� 102�� �а� �л��� �̸�, �г�, �������(�̱����� : ���� ���ϳ�)�� ����Ͽ���.
SELECT
    NAME, GRADE, BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'DAY MONTH DD YYYY')
FROM STUDENT
WHERE DEPTNO = 102;

SELECT SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;

-- ���� ���̺��� 101�� �а� �������� �̸�, ����, �Ի���(�̱� ��Ÿ�� : �� ��(����) ��)�� ����Ͽ���
SELECT NAME POSITION, HIREDATE , TO_CHAR(HIREDATE, 'MON DDTH YYYY DDSPTH')
FROM PROFESSOR;

-- ���������� �޴� �������� �̸�, �޿�, ��������, �׸��� �޿��� ���������� ���� ���� 12�� ���� ����� �������� ����Ͽ���.
SELECT NAME, SAL, COMM, TO_CHAR((SAL + COMM) * 12, '9,999')
FROM PROFESSOR
WHERE COMM IS NOT NULL;

SELECT TO_NUMBER('1,234,567,890', '999,999,999,999,999') + 1 FROM DUAL;

-- �ֹε�Ϲ�ȣ���� ��������� �����Ͽ� "YY/MM/DD" ���·� ����Ͽ���.
SELECT BIRTHDATE, IDNUM, TO_DATE(SUBSTR(IDNUM, 0, 6), 'YY/MM/DD') YYMMDD
FROM STUDENT;

-- NVL(P1, P2) : P1 NULL�� ���ɼ��� �ִ� ��, P2 : NULL�� ��� ��ü��
-- 201�� �а� ������ �̸�, ����, �޿�, ��������, �޿��� ���������� �հ踦 ����Ͽ���.
-- ��, ���������� NULL�� ��쿡�� ���������� 0���� ����Ͽ���.

SELECT
    NAME, POSITION, SAL,
    NVL(COMM, 0), NVL(SAL + COMM, SAL),
    NVL2(COMM, SAL+COMM, SAL)
FROM PROFESSOR;
--WHERE DEPTNO = 201;

SELECT
    COALESCE(NULL, 1, 2),
    NVL(NVL(NULL,1), 2)
FROM DUAL;

-- ���� ���̺��� ������ �Ҽ� �а���ȣ�� �а� �̸����� ��ȯ�Ͽ� ����Ͽ���.
-- �а���ȣ�� 101�̸� "��ǻ�Ͱ��а�", 102�̸� "��Ƽ�̵���а�", 201�̸� "���ڰ��а�",
-- ������ �а���ȣ�� "�����а�"(default)�� ��ȯ�Ѵ�.

SELECT * FROM PROFESSOR;

SELECT
    NAME, DEPTNO,
    DECODE(DEPTNO,
        101, '��ǻ�Ͱ��а�',
        102, '��Ƽ�̵���а�',
        201, '���ڰ��а�',
        '�����а�'
    ) dept
FROM PROFESSOR;

-- �л����� �¾ �޿� ���� ������ �ⷰ. 3-5 ��, 6-8 ���� ...
SELECT
    NAME, BIRTHDATE,
    -- TO_CHAR(ADD_MONTHS(BIRTHDATE, -2), 'Q')
    DECODE(TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3), 1, '��', 2, '����', 3, '����', '�ܿ�') SEASON
FROM STUDENT;


SELECT NAME, IDNUM, BIRTHDATE FROM STUDENT;
