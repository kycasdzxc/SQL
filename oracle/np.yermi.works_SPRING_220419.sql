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
        TITLE LIKE '%�׽�Ʈ%'
        OR WRITER LIKE '%�׽�Ʈ%'
        OR CONTENT LIKE '%�׽�Ʈ%'
        
        TITLE LIKE '%' + #{�׽�Ʈ} + '%'
        OR WRITER LIKE '%${�׽�Ʈ}%'
        )
)
WHERE RN > (1 - 1) * 10;

SELECT * FROM TBL_BOARD
WHERE TITLE LIKE '%�׽�Ʈ%' AND ROWNUM <= 20;

SELECT COUNT(*) FROM TBL_BOARD;