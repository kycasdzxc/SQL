SELECT * FROM (
    SELECT
        /*+ INDEX_DESC(TBL_BOARD BOARD_PK) */
        ROWNUM RN,
        BNO,
        TITLE,
        CONTENT,
        WRITER,
        REGDATE,
        UPDATEDATE
    FROM
        TBL_BOARD
    WHERE ROWNUM <= 1 * 10
    AND (
        TITLE LIKE '%테스트%'
        OR WRITER LIKE '%테스트%'
        OR CONTENT LIKE '%테스트%'
        
        TITLE LIKE '%' + #{테스트} + '%'
        OR WRITER LIKE '%${테스트}%'
        )
)
WHERE RN > (1 - 1) * 10;

SELECT * FROM TBL_BOARD
WHERE TITLE LIKE '%테스트%' AND ROWNUM <= 20;

SELECT COUNT(*) FROM TBL_BOARD;