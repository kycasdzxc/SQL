-- �������� ���Ἲ

-- �������� ���Ἲ

-- �л����̺��� 1�г� �л��� �˻��Ͽ� �й�, �̸�, �а���ȣ�� ����Ͽ���.
SELECT * FROM STUDENT;

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE GRADE = '1';

-- �л� ���̺��� �����԰� 70kg ������ �л��� �˻��Ͽ� �й�, �̸� , �г�, �а���ȣ, �����Ը� ö���Ͽ���.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT
FROM STUDENT
WHERE WEIGHT <= 70;

-- �л� ���̺��� �����԰� 1�г��̸鼭 �����԰� 70kg �̻��� �л��� �˻��Ͽ� �й�, �̸� , �г�, �а���ȣ, �����Ը� ö���Ͽ���.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT
FROM STUDENT
WHERE GRADE = '1' AND WEIGHT >= 70;

-- BETWEEN �����ڸ� ����Ͽ� �����԰� 50kg���� 70kg ������ �л��� �й�, �̸�, �����Ը� ����Ͽ���.
SELECT STUDNO, NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;

-- �л� ���̺��� 81�⿡�� 83�⵵�� �¾ �л��� �̸��� ��������� ����ض�.
SELECT NAME, BIRTHDATE
FROM STUDENT
WHERE BIRTHDATE BETWEEN '81/01/01' AND '83/12/31';
-- WHERE TO_CHAR(BIRTHDAT, 'YY') >= 81

-- IN �����ڸ� ����Ͽ� 102�� �а��� 201�� �а� �л��� �̸�, �г�, �а���ȣ�� ����Ͽ���.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO IN (102, 201);

-- �л� ���̺��� ���� '��'���� �л��� �̸�, �г�, �а���ȣ�� ����Ͽ���.
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '��%';

-- �̸� �߿� '��'�� ���� �л��� �̸�, �г�, �а���ȣ�� ����Ͽ���.
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '%��%';

SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '��_��';
-- WHERE NAME LIKE '_%��%';