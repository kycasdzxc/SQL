-- 부서 테이블의 부서 이름 칼럼에서 "과" 글자의 위치를 출력하여라.
SELECT * FROM DEPARTMENT;

SELECT DNAME, INSTR(DNAME, '과') FROM DEPARTMENT;

-- 교수 테이블에서 직급 칼럼의 왼쪽에 "*" 문자를 삽입하여 10바이트로 출력하고
-- 교수 아이디 칼럼은 오른쪽에 "+" 문자를 삽입하여 12바이트로 출력하여라.
SELECT
    POSITION, LPAD(POSITION, 10, '*') LP,
    USERID, RPAD(USERID, 12, '+') RP
FROM PROFESSOR;

-- 학생 테이블에서 학생 ID의 뒷자리 두글자를 *로 변경, 전화번호 뒷 세자리를 *로 변경
-- ID의 뒷자리 두 글자를 *로 변경 >> 자릿수를 12개로 채우기
SELECT * FROM STUDENT;

SELECT
    USERID, RTRIM(USERID, SUBSTR(USERID, -2)) || '**',
    TEL, RTRIM(TEL, SUBSTR(TEL, -3)) || '***'
FROM STUDENT;

SELECT
    USERID, RPAD(RTRIM(USERID, SUBSTR(USERID, -2)), 12, '*') ID
FROM STUDENT;

-- 선생님 ver.
SELECT
    USERID,
    SUBSTR(USERID, 0, LENGTH(USERID)-3) || '***' USER1,
    TEL,
    SUBSTR(TEL, 0, LENGTH(TEL)-3) || '***' RESULT1,
    LTRIM(SUBSTR(LPAD(TEL, 20), 0, 17)) || '***' RESULT2
FROM STUDENT;

-- 교수 테이블에서 101학과 교수의 일급을 계산(월 근무일은 22일)하여
-- 소수점 첫째자리와 셋째자리에서 반올림한 값과 소숫점 왼쪽 첫째자리에서 반올림한 값을 출력하여라

SELECT
    SAL,
    SAL/22,
    ROUND(SAL / 22),
    ROUND(SAL / 22, 2),
    ROUND(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- 교수 테이블에서 101학과 교수의 일급을 계산(윌 근무일 22일)하여
-- 소수점 첫째자리와 셋째잘이ㅔ서 절삭한 값과 소숫점 왼쪽 첫째자리를 절삭한 값을 출력하여라.
SELECT
    SAL,
    SAL/22,
    TRUNC(SAL / 22),
    TRUNC(SAL / 22, 2),
    TRUNC(SAL / 22, -1)
FROM PROFESSOR
WHERE DEPTNO = 101;

-- 교수번호가 9908인 겨수의 입사일을 기준으로 입사 30일 후와 60일 후의 날짜를 출력하여라.
SELECT
    PROFNO, NAME,
    HIREDATE,
    HIREDATE + 30,
    HIREDATE + 60
FROM PROFESSOR
WHERE PROFNO = 9908;

DESC PROFESSOR;

-- 입사한지 입사일 + 17년
-- 120개월 미만인 교수의 교수번호, 입사일, 입사일로부터 현재일까지의 개월 수, 입사일에서 6개월 후의 날짜를 출력하여라.
SELECT
    PROFNO, NAME,
    HIREDATE,
    ADD_MONTHS(HIREDATE, 12*17) ADD_17Y,
    ADD_MONTHS(ADD_MONTHS(HIREDATE, 12*17), 6) 입사6개월,
    TRUNC(MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 12*17))) || '개월' 개월수
FROM PROFESSOR
WHERE 120 > MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(HIREDATE, 12*17));

-- 오늘이 속한 달의 마지막 날짜와 다가오는 일요일의 날짜를 출력하여라
SELECT
    SYSDATE,
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, '일요일')
FROM DUAL;

-- 101번 학과 교수들의 입사일을 일, 월, 년을 기준으로 반올림하여 출력하여라.
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

INSERT INTO STUDENT(BIRTHDATE) VALUES ('신생아', SYSDATE);
INSERT INTO STUDENT(BIRTHDATE) VALUES ('신생아2', '22/02/02'); -- 묵시적 형변환

-- 학생 테이블에서 전인하 학생의 학번과 생년월일 중에서 년월만 출력하여라.
SELECT STUDNO, NAME, TO_CHAR(BIRTHDATE, 'YYYY/MM')
FROM STUDENT
WHERE NAME = '전인하';

-- 학생 테이블에서 102반 학과 학생의 이름, 학년, 생년월일(미국순서 : 요일 월일년)을 출력하여라.
SELECT
    NAME, GRADE, BIRTHDATE,
    TO_CHAR(BIRTHDATE, 'DAY MONTH DD YYYY')
FROM STUDENT
WHERE DEPTNO = 102;

SELECT SUBSTR(BIRTHDATE, 1, 2) FROM STUDENT;

-- 교수 테이블에서 101번 학과 교수들의 이름, 직급, 입사일(미국 스타일 : 월 일(서수) 년)을 출력하여라
SELECT NAME POSITION, HIREDATE , TO_CHAR(HIREDATE, 'MON DDTH YYYY DDSPTH')
FROM PROFESSOR;

-- 보직수당을 받는 교수들의 이름, 급여, 보직수당, 그리고 급여와 보직수당을 더한 값에 12를 곱한 결과를 연봉으로 출력하여라.
SELECT NAME, SAL, COMM, TO_CHAR((SAL + COMM) * 12, '9,999')
FROM PROFESSOR
WHERE COMM IS NOT NULL;

SELECT TO_NUMBER('1,234,567,890', '999,999,999,999,999') + 1 FROM DUAL;

-- 주민등록번호에서 생년월일을 추출하여 "YY/MM/DD" 형태로 출력하여라.
SELECT BIRTHDATE, IDNUM, TO_DATE(SUBSTR(IDNUM, 0, 6), 'YY/MM/DD') YYMMDD
FROM STUDENT;

-- NVL(P1, P2) : P1 NULL의 가능성이 있는 값, P2 : NULL일 경우 대체값
-- 201번 학과 교수늬 이름, 직급, 급여, 보직수당, 급여와 보직수당의 합계를 출력하여라.
-- 단, 보직수당이 NULL인 경우에는 보직수당을 0으로 출력하여라.

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

-- 교수 테이블에서 교수의 소속 학과번호를 학과 이름으로 변환하여 출력하여라.
-- 학과번호가 101이면 "컴퓨터공학과", 102이면 "멀티미디어학과", 201이면 "전자공학과",
-- 나머지 학과번호는 "기계공학과"(default)로 변환한다.

SELECT * FROM PROFESSOR;

SELECT
    NAME, DEPTNO,
    DECODE(DEPTNO,
        101, '컴퓨터공학과',
        102, '멀티미디어학과',
        201, '전자공학과',
        '기계공학과'
    ) dept
FROM PROFESSOR;

-- 학생들의 태어난 달에 따라 계절을 출럭. 3-5 봄, 6-8 여름 ...
SELECT
    NAME, BIRTHDATE,
    -- TO_CHAR(ADD_MONTHS(BIRTHDATE, -2), 'Q')
    DECODE(TRUNC(TO_CHAR(BIRTHDATE, 'MM') / 3), 1, '봄', 2, '여름', 3, '가을', '겨울') SEASON
FROM STUDENT;


SELECT NAME, IDNUM, BIRTHDATE FROM STUDENT;
