-- �л� ���̺��� �й�, �̸�, �а���ȣ�� ��ȸ�Ͻÿ�.
SELECT STUDNO, NAME, DEPTNO FROM STUDENT;

-- �а� ��ȣ�� ��ȸ(�������� ����)
SELECT DEPTNO FROM STUDENT ORDER BY 1;

-- �а� ��ȣ�� ��ȸ(�������� ����) DISTICT : �� ������ �ߺ� ����
SELECT DISTINCT DEPTNO FROM STUDENT ORDER BY 1;

-- �̰� �� �����ּ���. ALL
SELECT ALL DEPTNO FROM STUDENT ORDER BY 1;

SELECT
    DEPTNO,
    NAME
FROM
    STUDENT
WHERE
    DEPTNO = 102
ORDER BY 1;

-- �л����̺��� �а��� �ο����� ��ȸ
SELECT DEPTNO, COUNT(*)
FROM STUDENT
GROUP BY DEPTNO
HAVING COUNT(*) >= 5;

SELECT * FROM STUDENT;
-- �л����̺��� �ߺ��Ǵ� �а���ȣ(deptno)�� �����ϰ� ����϶�.
SELECT DISTINCT DEPTNO FROM STUDENT;

-- �л����̺��� �ߺ��Ǵ� �а���ȣ, �г� �����ϰ� ����Ͽ���.
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT ORDER BY 1, 2;
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT ORDER BY 1 DESC, 2 DESC; -- ��������
SELECT DEPTNO, GRADE FROM STUDENT ORDER BY STUDNO; -- �й� ������ ����

-- �����ͺ��̽� ���ڿ� ���ͷ� : ''

-- HELLO WORLD�� ����Ͻÿ�.
SELECT 'HELLO WORLD' FROM DUAL;

-- �л��� �̸��� '�ȳ�' ����
SELECT NAME || ' �ȳ�' FROM STUDENT;
SELECT CONCAT(NAME, ' �ȳ�') AS HI FROM STUDENT; -- AS : ���� �ο�
SELECT CONCAT(NAME, ' �ȳ�') HI FROM STUDENT; -- AS ������ ����
SELECT CONCAT(NAME, ' �ȳ�') HI FROM STUDENT S; -- ���̺� ������ AS �Ұ�

-- �й��� "�й�", �̸����� "�̸�"
SELECT STUDNO "�й�", NAME "�̸�" FROM STUDENT;

-- �μ� ���̺��� �μ� �̸� Į���� ������ dept_name, �μ���ȣ Į���� ������ DN���� �ο��Ͽ� ����Ͽ���.
SELECT DNAME "dept_name", DEPTNO "DN" FROM DEPARTMENT;

-- �μ� ���̺��� �μ��̸� Į���� ������ "Department Name", �μ���ȣ Į���� ������ "�μ���ȣ#"���� �ο��Ͽ� ����Ͽ���.
SELECT DNAME "Department Name", DEPTNO "�μ���ȣ#" FROM DEPARTMENT;

-- �л� ���̺��� �й��� �̸� Į���� �����Ͽ� "Student"��� ������ �ϳ��� Į��ó�� �����Ͽ� ����Ͽ���.
SELECT STUDNO || ' ' || NAME "Student" FROM STUDENT;

-- �л��� �����Ը� pound�� �ջ��ϰ� Į�� �̸��� "weight_pound"��� �������� ����Ͽ���. 1kg�� 2.2pound�̴�.
SELECT STUDNO, NAME, WEIGHT, WEIGHT*2.2 "weight_pound" FROM STUDENT;

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT DEPTNO, COUNT(*)
FROM STUDENT
WHERE WEIGHT IS NOT NULL
GROUP BY DEPTNO
HAVING COUNT(*) >= 5
ORDER BY 1;

-- ������ ���� : FROM > HAVING > GROUP BY > WHERE > SELECT > ORDER BY
-- Oracle optimizer�� �����̶� �����Կ� ���� ������ �ٸ� �� ����.

SELECT * FROM STUDENT;

--Oracle Hint : optimizer �����ϴ� ��

-- SQL PLUS ����

DROP TABLE EX_TYPE; -- ���̺� ����
CREATE TABLE EX_TYPE ( -- ���̺� ����
    C CHAR(10),
    V VARCHAR(10)
);

INSERT INTO EX_TYPE VALUES ('sql', 'sql');
SELECT * FROM EX_TYPE;

SELECT *
FROM EX_TYPE
WHERE C ='sql';

SELECT *
FROM EX_TYPE
WHERE V ='sql';

SELECT *
FROM EX_TYPE
WHERE C ='sql       ';

SELECT *
FROM EX_TYPE
WHERE V ='sql       ';

SELECT *
FROM EX_TYPE
WHERE C = V;

SELECT *
FROM EX_TYPE
WHERE C = V || '       ';

SELECT 1
FROM DUAL
WHERE 1='1';

-- NUMBER ������ Ÿ��
SELECT 3.14 FROM DUAL;

-- �¾ �� ��ȸ
SELECT STUDNO, NAME, BIRTHDATE, SYSDATE, ROUND(SYSDATE - BIRTHDATE) FROM STUDENT WHERE STUDNO = 10101;

SELECT SYSDATE - To_DATE('94/11/02') FROM DUAL;

SELECT
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') "NOW",
    TO_CHAR(SYSDATE + 3, 'YY/MM/DD HH24:MI:SS') "3DAY_AFTER",
    TO_CHAR(SYSDATE + 3 / 24, 'YY/MM/DD HH24:MI:SS') "3HOURS_AFTER",
    TO_CHAR(SYSDATE + 30 / 24 / 60, 'YY/MM/DD HH24:MI:SS') "30MINUTES_AFTER",
    TO_CHAR(SYSDATE + 30 / 24 / 60 / 60, 'YY/MM/DD HH24:MI:SS') "30SECONDS_AFTER",
    TO_CHAR(SYSDATE + 3 * 365, 'YY/MM/DD HH24:MI:SS') "3YEARS_AFTER",
    
    ADD_MONTHS(TO_DATE('22/01/31'), 1) "1MONTH_AFTER"
FROM DUAL;

-- �ð� ���� ��, 00:00:00���� �ʱ�ȭ
SELECT TO_CHAR(To_DATE('94/11/02'), 'YY/MM/DD HH24:MI:SS') FROM DUAL;

-- ��¥ �ݿø�
SELECT ROUND(SYSDATE, 'YY') FROM DUAL; -- �� �ݿø�
SELECT ROUND(SYSDATE, 'MM') FROM DUAL; -- �� �ݿø�
SELECT ROUND(SYSDATE, 'DD') FROM DUAL; -- �� �ݿø�, 'DD' ���� ����

SELECT ROWID, S.* FROM STUDENT S;
SELECT ROWID, ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC;