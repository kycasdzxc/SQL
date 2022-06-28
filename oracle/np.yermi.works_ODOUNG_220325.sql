SELECT /*+ INDEX(TBL_REPLY IDX_REPLY_RNO_BNO) */ * FROM TBL_REPLY;

-- MEMBER
-- 권한, 주소, 이메일

-- id auth
-- javaman role_member
-- javaman role_manager
-- javaman role_admin

-- chmod 755
-- RWX

-- ADMIN, MANAGE, MEMBER
-- 0      0       1
-- 1      1       1
DROP TABLE TBL_MUSINSA_SAMPLE;
CREATE TABLE TBL_MUSINSA_SAMPLE (
    NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(2000),
    INFO VARCHAR2(4000),
    PRICE VARCHAR2(1000),
    LINK VARCHAR2(2000)
);