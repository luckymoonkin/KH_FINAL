---------------- FINAL 계정 생성 ----------------
--CREATE USER FINAL IDENTIFIED BY FINAL;
--GRANT RESOURCE, CONNECT TO FINAL;

---------------- MEMBER 테이블 생성 ----------------
CREATE TABLE MEMBER (
    NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
    ID VARCHAR2(30) CONSTRAINT MEMBER_ID_UQ UNIQUE,
    PASSWORD VARCHAR2(100),
    NAME VARCHAR2(100),
    EMAIL VARCHAR2(300),
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2(300),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    MEMBER_TYPE VARCHAR2(50) DEFAULT 'USER',
    PLATFORM_TYPE VARCHAR2(100) DEFAULT 'HOMEPAGE' CONSTRAINT MEMBER_PLATFORM_TYPE_NN NOT NULL,
    IMG_NAME VARCHAR2(300),
    MODIFY_IMG_NAME VARCHAR2(300),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE
);

-- MEMBER 테이블 코멘트 입력
COMMENT ON COLUMN MEMBER.NO IS '회원번호';
COMMENT ON COLUMN MEMBER.ID IS '회원ID';
COMMENT ON COLUMN MEMBER.PASSWORD IS '회원PW';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '회원타입';
COMMENT ON COLUMN MEMBER.NAME IS '회원명';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.PLATFORM_TYPE IS '플랫폼';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN MEMBER.IMG_NAME IS '프로필사진';   
COMMENT ON COLUMN MEMBER.MODIFY_IMG_NAME IS '프로필사진(수정)';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';   
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';

-- MEMBER 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_UNO;

-- MEMBER 테이블 데이터 입력
INSERT INTO MEMBER (
    NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'admin1', 
    '1234', 
    'ADMIN', 
    '관리자1', 
    '01011111111', 
    'admin1@4earth.co.kr', 
    '서울시 강남구 역삼동',
    DEFAULT,
    DEFAULT,
    NULL,
    NULL,
    DEFAULT,
    DEFAULT
);

INSERT INTO MEMBER (
    NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'potatoking', 
    '1234', 
    DEFAULT, 
    '감자킹', 
    '01000000000', 
    'potatoking@naver.com', 
    '경기도 용인시 기흥구',
    DEFAULT,
    DEFAULT,
    NULL,
    NULL,
    DEFAULT,
    DEFAULT
);

COMMIT;  

-- MEMBER 테이블 삭제문
--DROP TABLE MEMBER;
--DROP SEQUENCE SEQ_UNO;

-- MEMBER 테이블 select문
SELECT NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
FROM MEMBER;
--WHERE ID='admin1' AND STATUS = 'Y';
--WHERE STATUS = 'Y';

SELECT COUNT(*) FROM MEMBER;
--------------------------------------------------------