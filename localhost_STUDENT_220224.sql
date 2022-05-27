-- 학생 테이블에서 학번, 이름, 학과번호를 조회하시오.
SELECT STUDNO, NAME, DEPTNO FROM STUDENT;

-- 학과 번호만 조회(오름차순 정렬)
SELECT DEPTNO FROM STUDENT ORDER BY 1;

-- 학과 번호만 조회(오름차순 정렬) DISTICT : 행 단위의 중복 제거
SELECT DISTINCT DEPTNO FROM STUDENT ORDER BY 1;

-- 이게 다 보여주세요. ALL
SELECT ALL DEPTNO FROM STUDENT ORDER BY 1;

SELECT
    DEPTNO,
    NAME
FROM
    STUDENT
WHERE
    DEPTNO = 102
ORDER BY 1;

-- 학생테이블에서 학과별 인원수를 조회
SELECT DEPTNO, COUNT(*)
FROM STUDENT
GROUP BY DEPTNO
HAVING COUNT(*) >= 5;

SELECT * FROM STUDENT;
-- 학생테이블에서 중복되는 학과번호(deptno)를 제외하고 출력하라.
SELECT DISTINCT DEPTNO FROM STUDENT;

-- 학생테이블에서 중복되는 학과번호, 학년 제외하고 출력하여라.
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT ORDER BY 1, 2;
SELECT DISTINCT DEPTNO, GRADE FROM STUDENT ORDER BY 1 DESC, 2 DESC; -- 내림차순
SELECT DEPTNO, GRADE FROM STUDENT ORDER BY STUDNO; -- 학번 순으로 정렬

-- 데이터베이스 문자열 리터럴 : ''

-- HELLO WORLD를 출력하시오.
SELECT 'HELLO WORLD' FROM DUAL;

-- 학생의 이름과 '안녕' 결합
SELECT NAME || ' 안녕' FROM STUDENT;
SELECT CONCAT(NAME, ' 안녕') AS HI FROM STUDENT; -- AS : 별명 부여
SELECT CONCAT(NAME, ' 안녕') HI FROM STUDENT; -- AS 생략도 가능
SELECT CONCAT(NAME, ' 안녕') HI FROM STUDENT S; -- 테이블 별명에는 AS 불가

-- 학번에 "학번", 이름에는 "이름"
SELECT STUDNO "학번", NAME "이름" FROM STUDENT;

-- 부서 테이블에서 부서 이름 칼럼의 별명은 dept_name, 부서번호 칼럼의 별명은 DN으로 부여하여 출력하여라.
SELECT DNAME "dept_name", DEPTNO "DN" FROM DEPARTMENT;

-- 부서 테이블에서 부서이름 칼럼의 별명은 "Department Name", 부서번호 칼럼의 별명은 "부서번호#"으로 부여하여 출력하여라.
SELECT DNAME "Department Name", DEPTNO "부서번호#" FROM DEPARTMENT;

-- 학생 테이블에서 학번과 이름 칼럼을 연결하여 "Student"라는 별명을 하나의 칼럼처럼 연결하여 출력하여라.
SELECT STUDNO || ' ' || NAME "Student" FROM STUDENT;

-- 학생의 몸무게를 pound로 합산하고 칼럼 이름을 "weight_pound"라는 별명으로 출력하여라. 1kg은 2.2pound이다.
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

-- 오류의 순서 : FROM > HAVING > GROUP BY > WHERE > SELECT > ORDER BY
-- Oracle optimizer가 최적이라 생각함에 따라 순서는 다를 수 있음.

SELECT * FROM STUDENT;

--Oracle Hint : optimizer 조정하는 거

-- SQL PLUS 생략

DROP TABLE EX_TYPE; -- 테이블 삭제
CREATE TABLE EX_TYPE ( -- 테이블 생성
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

-- NUMBER 데이터 타입
SELECT 3.14 FROM DUAL;

-- 태어난 날 조회
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

-- 시간 생략 시, 00:00:00으로 초기화
SELECT TO_CHAR(To_DATE('94/11/02'), 'YY/MM/DD HH24:MI:SS') FROM DUAL;

-- 날짜 반올림
SELECT ROUND(SYSDATE, 'YY') FROM DUAL; -- 년 반올림
SELECT ROUND(SYSDATE, 'MM') FROM DUAL; -- 월 반올림
SELECT ROUND(SYSDATE, 'DD') FROM DUAL; -- 일 반올림, 'DD' 생략 가능

SELECT ROWID, S.* FROM STUDENT S;
SELECT ROWID, ROWNUM, S.* FROM STUDENT S ORDER BY STUDNO DESC;