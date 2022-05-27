-- 제약조건 무결성

-- 참조조건 무결성

-- 학생테이블에서 1학년 학생만 검색하여 학번, 이름, 학과번호를 출력하여라.
SELECT * FROM STUDENT;

SELECT STUDNO, NAME, DEPTNO
FROM STUDENT
WHERE GRADE = '1';

-- 학생 테이블에서 몸무게가 70kg 이하인 학생만 검색하여 학번, 이름 , 학년, 학과번호, 몸무게를 철력하여라.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT
FROM STUDENT
WHERE WEIGHT <= 70;

-- 학생 테이블에서 몸무게가 1학년이면서 몸무게가 70kg 이상인 학생만 검색하여 학번, 이름 , 학년, 학과번호, 몸무게를 철력하여라.
SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT
FROM STUDENT
WHERE GRADE = '1' AND WEIGHT >= 70;

-- BETWEEN 연산자를 사용하여 몸무게가 50kg에서 70kg 사이인 학생의 학번, 이름, 몸무게를 출력하여라.
SELECT STUDNO, NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;

-- 학생 테이블에서 81년에서 83년도에 태어난 학생의 이름과 생년월일을 출력해라.
SELECT NAME, BIRTHDATE
FROM STUDENT
WHERE BIRTHDATE BETWEEN '81/01/01' AND '83/12/31';
-- WHERE TO_CHAR(BIRTHDAT, 'YY') >= 81

-- IN 연산자를 사용하여 102번 학과와 201번 학과 학생의 이름, 학년, 학과번호를 출력하여라.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO IN (102, 201);

-- 학생 테이블에서 성이 '김'씨인 학생의 이름, 학년, 학과번호를 출력하여라.
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '김%';

-- 이름 중에 '동'이 들어가는 학생의 이름, 학년, 학과번호를 출력하여라.
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '%동%';

SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '김_균';
-- WHERE NAME LIKE '_%동%';