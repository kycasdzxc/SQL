SELECT * FROM user_info
JOIN USER_AUTH USING(USER_ID)
WHERE USER_ID = 'hong';

INSERT INTO user_info (USER_ID, USER_PW, USER_NAME) VALUES ('hong', '1234', '홍길동');

INSERT INTO USER_AUTH VALUES ('song', 'ROLE_ADMIN');