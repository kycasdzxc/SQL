SELECT
    TRUNC(RN/7) WEEK,
    CASE WHEN MOD(RN, 7) = 1 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND LD >= RN AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1)) END
        END
    END 일,
    CASE WHEN MOD(RN, 7) = 2 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))-1
            ELSE
                CASE WHEN FD = 6 THEN FD-RN-1 END
            END
        END
    END 월,
    CASE WHEN MOD(RN, 7) = 3 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))-1
            ELSE
                CASE WHEN 4 > RN AND FD > 5 THEN FD-RN-2 END
            END
        END
    END 화,
    CASE WHEN MOD(RN, 7) = 4 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))
            ELSE
                CASE WHEN 5 > RN AND FD > 4 THEN FD-RN END
            END
        END
    END 수,
    CASE WHEN MOD(RN, 7) = 5 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))
            ELSE
                CASE WHEN 6 > RN AND FD > 3 THEN FD-RN+2 END
            END
        END
    END 목,
    CASE WHEN MOD(RN, 7) = 6 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))-1
            ELSE
                CASE WHEN 7 > RN AND FD > 2 THEN FD-RN+4 END
            END
        END
    END 금,
    CASE WHEN MOD(RN, 7) = 0 THEN
        CASE WHEN FD = 1 THEN
            CASE WHEN LD >= RN THEN RN END
        ELSE
            CASE WHEN RN > FD AND RN > 7 AND LD >= FD + TRUNC(7*(RN/7-1)-1) THEN FD + TRUNC(7*(RN/7-1))-1
            ELSE
                CASE WHEN 8 > RN THEN FD-RN+6 END
            END
        END
    END 토,
    FD, LD, RN
FROM (
    SELECT
        ROWNUM RN,
        D,
        TO_NUMBER(TO_CHAR(NEXT_DAY(ADD_MONTHS(LAST_DAY(D), -1), '일'), 'DD')) FD,
        TO_NUMBER(TO_CHAR(LAST_DAY(D), 'DD')) LD
    FROM (SELECT ROWNUM, '2022-02-08' D FROM DICT)
    WHERE ROWNUM <= 42
);
