
DECLARE
    VN_SALARY NUMBER := 0;
    VN_DEPARTMENT_ID NUMBER := 0;
BEGIN
    VN_DEPARTMENT_ID := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
    
    SELECT SALARY 
    INTO VN_SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = VN_DEPARTMENT_ID
        AND ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    DBMS_OUTPUT.PUT_LINE(vn_department_id);
    
    CASE
        WHEN VN_SALARY BETWEEN 1 AND 3000 THEN
        DBMS_OUTPUT.PUT_LINE('낮음');
        WHEN VN_SALARY BETWEEN 3001 AND 6000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
        WHEN VN_SALARY BETWEEN 6001 AND 10000 THEN
        DBMS_OUTPUT.PUT_LINE('높음');
        ELSE
        DBMS_OUTPUT.PUT_LINE('최상위');
    END CASE;
END;
/

-- LOOP를 이용해 구구단을 출력하시오
DECLARE
    I NUMBER := 2;
    J NUMBER := 1;
BEGIN
    LOOP
        LOOP
            DBMS_OUTPUT.PUT_LINE(I || ' * ' || J || ' = ' || I*J);
            J := J + 1;
            EXIT WHEN J = 10;
        END LOOP;
        I := I + 1;
        J := 1;
        DBMS_OUTPUT.PUT_LINE('=========================');
        EXIT WHEN I = 10;
    END LOOP;
END;
/

-- 1부터 100까지 홀수 출력
DECLARE
    V_NUM NUMBER := 1;
    V_SUM NUMBER := 0;
BEGIN
    WHILE V_NUM <= 100
    LOOP
--        DBMS_OUTPUT.PUT_LINE(V_NUM);
        V_SUM := V_SUM + V_NUM;
        V_NUM := V_NUM + 2;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 100까지 홀수의 합계 : ' || V_SUM);
END;
/

DECLARE
    V_NUM NUMBER := 1;
    V_SUM NUMBER := 0;
BEGIN
    WHILE V_NUM <= 100
    LOOP
--        DBMS_OUTPUT.PUT_LINE(V_NUM);
        IF V_SUM >= 100 THEN
            EXIT;
        END IF;
        V_SUM := V_SUM + V_NUM;
        EXIT WHEN V_SUM > 100;
        V_NUM := V_NUM + 2;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 100까지 홀수의 합계 : ' || V_SUM);
END;
/

-- FOR 루프를 사용해서 1에서 20의 합계
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR I IN 1..20
    LOOP
    V_NUM := V_NUM + I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 20까지의 합계 : ' || V_NUM);
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR I IN REVERSE 1..20
    LOOP
    V_NUM := V_NUM + I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 20까지의 합계 : ' || V_NUM);
END;
/

-- 구구단 출력 FOR
BEGIN
    FOR I IN 2..9
    LOOP
        FOR J IN 1..9
        LOOP
        DBMS_OUTPUT.PUT_LINE(I || ' * ' || J || ' = ' || I*J);
        END LOOP;
    END LOOP;
END;
/