-- 1�� 1���� �� �ϳ��� ���� ��ȯ�ϴ� �������� >> ��Į�� ��������

--
SELECT STUDNO, S.NAME, GRADE, S.DEPTNO, PROFNO, P.NAME, POSITION
FROM STUDENT S
LEFT JOIN PROFESSOR P USING(PROFNO);

SELECT STUDNO, S.NAME, GRADE, S.DEPTNO, PROFNO, P.NAME, POSITION
FROM STUDENT S
FULL JOIN PROFESSOR P USING(PROFNO)
ORDER BY GRADE;

-- ��������
SELECT *
FROM PROFESSOR
WHERE POSITION = '����';

-- ����� ���̵� "jun123"�� �л��� ���� �г��� �л��� �й�, �̸�, �г��� ����Ͽ���.
SELECT STUDNO, NAME, GRADE
FROM STUDENT
WHERE GRADE =
(SELECT GRADE
FROM STUDENT
WHERE USERID = 'jun123');

-- 101�� �а� �л����� ��� �����Ժ��� �����԰� ���� �л��� �̸�, �а���ȣ, �����Ը� ����Ͽ���.
SELECT NAME, DEPTNO, WEIGHT
FROM STUDENT
WHERE
    WEIGHT < (
        SELECT AVG(WEIGHT)
        FROM STUDENT
        WHERE DEPTNO = 101
    )
;

-- 20101�� �л��� �г��� ����, Ű�� 20101�� �л����� ū �л��� �̸�, �г�, Ű�� ����Ͽ���.
SELECT GRADE
FROM STUDENT
WHERE STUDNO = 20101;

SELECT HEIGHT
FROM STUDENT
WHERE STUDNO = 20101;

SELECT NAME, GRADE, HEIGHT
FROM STUDENT
WHERE
    GRADE = (
        SELECT GRADE
        FROM STUDENT
        WHERE STUDNO = 20101
    )
AND
    HEIGHT > (
        SELECT HEIGHT
        FROM STUDENT
        WHERE STUDNO = 20101
    )
;

-- ANY = �κ���ġ, ALL = ��ü��ġ
SELECT *
FROM DEPARTMENT
WHERE COLLEGE = 100;

-- �����̵���к�(�μ���ȣ : 100)�� �Ҽӵ� ��� �л��� �й�, �̸�, �а���ȣ�� ����Ͽ���.
SELECT DEPTNO
FROM DEPARTMENT
WHERE COLLEGE = (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE DNAME = '�����̵���к�'
);

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM DEPARTMENT
    WHERE COLLEGE = (
        SELECT DEPTNO
        FROM DEPARTMENT
        WHERE DNAME = '�����̵���к�'
    )
);

-- ��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ���� �л����� Ű�� ū �л��� �й�, �̸�, Ű�� ����Ͽ���.
--SELECT STUDNO, NAME, HEIGHT
--FROM STUDENT
--WHERE HEIGHT > ( -- ERROR
--SELECT HEIGHT
--FROM STUDENT
--WHERE GRADE = 4);

SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > ANY (
    SELECT HEIGHT
    FROM STUDENT
    WHERE GRADE = 4
);
    
SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > (
    SELECT MIN(HEIGHT)
    FROM STUDENT
    WHERE GRADE = 4
);

-- ��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ū �л����� Ű�� ū �л��� �й�, �̸�, Ű�� ����Ͽ���.
SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > ALL (
    SELECT HEIGHT
    FROM STUDENT
    WHERE GRADE = 4
);

SELECT STUDNO, NAME, HEIGHT
FROM STUDENT
WHERE HEIGHT > (
    SELECT MAX(HEIGHT)
    FROM STUDENT
    WHERE GRADE = 4
);

-- ��� �л� �߿��� 4�г� �л� �߿��� Ű�� ���� ū �л����� Ű�� ���� �л��� �й�, �̸�, Ű�� ����Ͽ���.
SELECT STUDNO, NAME, HEIGHT , GRADE
FROM STUDENT
WHERE HEIGHT < ANY (
    SELECT HEIGHT
    FROM STUDENT
    WHERE GRADE = 4
);

SELECT STUDNO, NAME, HEIGHT, GRADE
FROM STUDENT
WHERE HEIGHT < (
    SELECT MAX(HEIGHT)
    FROM STUDENT
    WHERE GRADE = 4
);

-- ���������� �޴� ������ �� ���̶� ������ ��� ������ ������ȣ, �̸�, �������� �׸��� �޿��� ���������� ���� ����Ͽ���.
SELECT PROFNO, NAME, COMM, SAL+COMM
FROM PROFESSOR
WHERE EXISTS (
    SELECT *
    FROM PROFESSOR
    WHERE COMM IS NOT NULL
);

-- PAIRWISE �񱳹���� ���� �г� ���� �����԰� �ּ��� �л��� �̸�, �г�, �����Ը� ����Ͽ���.
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE (GRADE, WEIGHT) IN (
    SELECT GRADE, MIN(WEIGHT)
    FROM STUDENT
    GROUP BY GRADE
);

-- UNPAIRWISE �񱳹���� ���� �г� ���� �����԰� �ּ��� �л��� �̸�, �г�, �����Ը� ����Ͽ���.
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE GRADE IN (
    SELECT GRADE
    FROM STUDENT
    GROUP BY GRADE)
AND WEIGHT IN (
    SELECT MIN(WEIGHT)
    FROM STUDENT
    GROUP BY GRADE)
ORDER BY 2;

-- ��ȣ���� ��������
-- �� �а� �л��� ��� Ű���� Ű�� ū �л��� �̸�, �а� ��ȣ, Ű�� ����Ͽ���.
SELECT AVG(HEIGHT)
FROM STUDENT
GROUP BY DEPTNO;

SELECT STUDNO, NAME, DEPTNO, HEIGHT
FROM STUDENT S1
WHERE HEIGHT > (SELECT AVG(HEIGHT)
    FROM STUDENT S2
    WHERE S1.DEPTNO = S2.DEPTNO
    GROUP BY DEPTNO
);

-- �й�, �̸�, �а���ȣ, �а��̸� ����, ��������
SELECT * FROM DEPARTMENT;

SELECT STUDNO, NAME, DEPTNO, DNAME
FROM STUDENT
JOIN DEPARTMENT USING (DEPTNO);

SELECT
    STUDNO, NAME, DEPTNO, (
        SELECT DNAME
        FROM DEPARTMENT D
        WHERE S.DEPTNO = D.DEPTNO
    ) DNAME
FROM STUDENT S;

-- ������ ���۾�
-- DDL DML DCL
-- DDL : DATA DEFINITION LANGUAGE ������ ���Ǿ�
-- CREATE, ALTER, DROP, TRUNCATE, REPLACE, ...
-- DNL : DATA MANUFACTUAL LANGUAGE ������ ���۾�
-- INSERT, UPDATE, DELETE, MERGE // SELECT�� DQL �� �ָ��ϴ�.
-- DCL : DATA CONTROL LANGUAGE ������ �����
-- COMMIT, ROLLBACK, SAVEPOINT, GRANT, REVOKE ...
-- COMMIT, ROLLBACK, SAVEPOINT >> TCL

INSERT INTO STUDENT
VALUES (10110, 'ȫ�浿', 'hong', '1', '8501011149098', '85/01/01', '041)630-3114', 170, 70, 101, 9903);

SELECT * FROM STUDENT;

ROLLBACK;

COMMIT;