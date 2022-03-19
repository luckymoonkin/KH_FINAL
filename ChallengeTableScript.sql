-- 포인트 테이블 삭제
DROP SEQUENCE SEQ_POINT;
DROP TABLE POINT;

-- 대댓글 테이블 삭제
DROP SEQUENCE SEQ_CHAL_NESTED_REPLY;
DROP TABLE CHAL_NESTED_REPLY;

-- 댓글 테이블 삭제
DROP SEQUENCE SEQ_CHAL_REPLY;
DROP TABLE CHAL_REPLY;

-- 이달의 챌린지 참여 회원 테이블 삭제
DROP SEQUENCE SEQ_CHAL_MONTH_MEM;
DROP TABLE CHAL_MONTH_MEM;

-- 이달의 챌린지 테이블 삭제
DROP SEQUENCE SEQ_CHAL_MONTH;
DROP TABLE CHAL_MONTH;

-- 오늘의 챌린지 참여 회원 테이블 삭제
DROP SEQUENCE SEQ_CHAL_TODAY_MEM;
DROP TABLE CHAL_TODAY_MEM;

-- 오늘의 챌린지 테이블 삭제
DROP SEQUENCE SEQ_CHAL_TODAY;
DROP TABLE CHAL_TODAY;

-- 챌린지 유형 테이블 삭제
DROP SEQUENCE SEQ_CHAL;
DROP TABLE CHALLENGE;




-----------------------------------------------------------------------------------------------------------------------------------------

-- 챌린지 유형 테이블 생성
CREATE TABLE CHALLENGE (
    CHAL_NO NUMBER CONSTRAINT CHALLENGE_CHAL_NO_PK PRIMARY KEY,
    CHAL_CATEGORY VARCHAR2(50)
);

-- 챌린지 유형 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL;

-- 챌린지 유형 테이블 INSERT
INSERT INTO CHALLENGE (CHAL_NO, CHAL_CATEGORY) VALUES (SEQ_CHAL.NEXTVAL, '오늘의 챌린지');
INSERT INTO CHALLENGE (CHAL_NO, CHAL_CATEGORY) VALUES (SEQ_CHAL.NEXTVAL, '이달의 챌린지');

-----------------------------------------------------------------------------------------------------------------------------------------

-- 오늘의 챌린지 테이블 생성
CREATE TABLE CHAL_TODAY (
    CATEGORY NUMBER,
    CHAL_NO NUMBER CONSTRAINT CHAL_TODAY_NO_PK PRIMARY KEY,
    CHAL_TITLE VARCHAR2(1000) NOT NULL,
    CHAL_CONTENT VARCHAR2(4000) NOT NULL,
    ORIGINAL_FILENAME VARCHAR2(4000) NOT NULL,
    RENAMED_FILENAME VARCHAR2(4000) NOT NULL,
    CHAL_POINT NUMBER NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    CHAL_STATUS CHAR DEFAULT 'N' CHECK(CHAL_STATUS IN('Y', 'N')) NOT NULL
);

-- 오늘의 챌린지 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_TODAY.CATEGORY IS '분류(오늘/이달)';
COMMENT ON COLUMN CHAL_TODAY.CHAL_NO IS '오늘의 챌린지 번호';
COMMENT ON COLUMN CHAL_TODAY.CHAL_TITLE IS '오늘의 챌린지 제목';
COMMENT ON COLUMN CHAL_TODAY.CHAL_CONTENT IS '오늘의 챌린지 내용';
COMMENT ON COLUMN CHAL_TODAY.ORIGINAL_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_TODAY.RENAMED_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_TODAY.CHAL_POINT IS '달성 시 지급 포인트';
COMMENT ON COLUMN CHAL_TODAY.START_DATE IS '게시 시작일';
COMMENT ON COLUMN CHAL_TODAY.END_DATE IS '게시 종료일';
COMMENT ON COLUMN CHAL_TODAY.CHAL_STATUS IS '게시 상태';

-- 오늘의 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_TODAY;

-- 오늘의 챌린지 더미 데이터 INSERT
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, START_DATE, END_DATE, CHAL_STATUS)
    VALUES (1, SEQ_CHAL_TODAY.NEXTVAL, '걸어서 or 자전거로 출퇴근 하기', '대기오염물질을 발생시키는 차량 운행을 줄이고 걸어서 출퇴근 하거나 자전거로 출퇴근하여 하루를 시작해보세요. 출퇴근이 아니더라도 가까운 거리는 두 발로 이동하는 습관을 가져보는 건 어떨까요?', 'challenge_today01.jpg', 'challenge_today01.jpg', 5000, SYSDATE, SYSDATE, 'Y');
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, START_DATE, END_DATE, CHAL_STATUS)
    VALUES (1, SEQ_CHAL_TODAY.NEXTVAL, '하루 한 끼 채식하기', '한 사람당 1주일에 하루만 채식을 해도 1년에 나무 15그루를 심는 효과가 있다고 합니다. 채식으로 몸을 가볍게 하고  육류를 생산하는 과정에서 배출되는 탄소를 조금이라도 줄일 수 있는 효과가 있습니다.', 'challenge_today02.jpg', 'challenge_today01.jpg', 5000, SYSDATE, SYSDATE, 'Y');
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, START_DATE, END_DATE, CHAL_STATUS)
    VALUES (1, SEQ_CHAL_TODAY.NEXTVAL, '텀블러 사용하기', '일회용 플라스틱 사용을 자제하고 다회 사용 가능한 텀블러를 사용해보세요. 플라스틱은 바다에서 분해되어 미세 플라스틱이 되면 해양생물의 생명을 위협하게 됩니다.', 'challenge_today01.jpg', 'challenge_today01.jpg', 5000, SYSDATE, SYSDATE, 'Y');
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, START_DATE, END_DATE, CHAL_STATUS)
    VALUES (1, SEQ_CHAL_TODAY.NEXTVAL, '메일함 비우기', '메일을 보관하는 데이터 센터는 24시간 가동되어야 하기 때문에 엄청난 전기가 필요합니다. 메일 한 통은 4g의 이산화탄소를 배출한다고 합니다. 메일함 1GB를 비우면 14.9kg의 이산화탄소 배출을 감축할 수 있습니다.', 'challenge_today01.jpg', 'challenge_today01.jpg', 5000, SYSDATE, SYSDATE, 'Y');

BEGIN
    FOR N IN 1..4
    LOOP
        INSERT INTO CHAL_TODAY VALUES(1, SEQ_CHAL_TODAY.NEXTVAL, '챌린지 제목 ' || SEQ_CHAL_TODAY.CURRVAL, '챌린지 내용 ' || SEQ_CHAL_TODAY.CURRVAL, 'challenge_today02.jpg', 'challenge_today02.jpg', 5000, TO_DATE('2022-03-14', 'yyyy/MM/dd'), TO_DATE('2022-03-14', 'yyyy/MM/dd'), 'Y');
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..4
    LOOP
        INSERT INTO CHAL_TODAY VALUES(1, SEQ_CHAL_TODAY.NEXTVAL, '챌린지 제목 ' || SEQ_CHAL_TODAY.CURRVAL, '챌린지 내용 ' || SEQ_CHAL_TODAY.CURRVAL, 'challenge_today02.jpg', 'challenge_today02.jpg', 5000, TO_DATE('2022-03-15', 'yyyy/MM/dd'), TO_DATE('2022-03-15', 'yyyy/MM/dd'), 'Y');
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/


-----------------------------------------------------------------------------------------------------------------------------------------

-- 오늘의 챌린지 참여 회원 테이블 생성
CREATE TABLE CHAL_TODAY_MEM (
    NO NUMBER CONSTRAINT CHAL_TODAY_MEM_NO_PK PRIMARY KEY,
    MEM_NO NUMBER CONSTRAINT CHAL_TODAY_MEM_MEM_NO_FK REFERENCES MEMBER(NO),
    CHAL_NO NUMBER NOT NULL,
    CHAL_DATE DATE DEFAULT SYSDATE NOT NULL,
    CHAL_STATUS CHAR DEFAULT 'Y' CHECK(CHAL_STATUS IN('Y', 'N')),
    ORIGINAL_FILENAME VARCHAR2(1000) NOT NULL,
    RENAMED_FILENAME VARCHAR2(4000) NOT NULL,
    CHAL_POINT NUMBER NOT NULL,
    CHAL_POINT_STATUS CHAR DEFAULT 'N' CHECK(CHAL_POINT_STATUS IN('Y', 'N'))
);

-- 오늘의 챌린지 참여 회원 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_TODAY_MEM.NO IS '오늘의 챌린지 참여 번호';
COMMENT ON COLUMN CHAL_TODAY_MEM.MEM_NO IS '회원 번호';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_NO IS '오늘의 챌린지 고유 번호';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_DATE IS '달성일';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_STATUS IS '달성 상태';
COMMENT ON COLUMN CHAL_TODAY_MEM.ORIGINAL_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_TODAY_MEM.RENAMED_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_POINT IS '달성 시 지급 포인트';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_POINT_STATUS IS '포인트 지급 상태';

-- 오늘의 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_TODAY_MEM;


-----------------------------------------------------------------------------------------------------------------------------------------

-- 이달의 챌린지 테이블 생성
CREATE TABLE CHAL_MONTH (
    CATEGORY NUMBER,
    CHAL_NO NUMBER CONSTRAINT CHAL_MONTH_CHAL_NO_PK PRIMARY KEY,
    CHAL_TITLE VARCHAR2(1000) NOT NULL,
    CHAL_CONTENT VARCHAR2(4000) NOT NULL,
    ORIGINAL_FILENAME VARCHAR2(4000) NOT NULL,
    RENAMED_FILENAME VARCHAR2(4000) NOT NULL,
    CHAL_POINT NUMBER NOT NULL,
    CHAL_COUNT NUMBER DEFAULT 5 CHECK(CHAL_COUNT IN(5, 10)),
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    CHAL_STATUS CHAR DEFAULT 'Y' CHECK(CHAL_STATUS IN('Y', 'N')) NOT NULL
);

-- 이달의 챌린지 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_MONTH.CATEGORY IS '분류(오늘/이달)';
COMMENT ON COLUMN CHAL_MONTH.CHAL_NO IS '이달의 챌린지 번호';
COMMENT ON COLUMN CHAL_MONTH.CHAL_TITLE IS '이달의 챌린지 제목';
COMMENT ON COLUMN CHAL_MONTH.CHAL_CONTENT IS '이달의 챌린지 내용';
COMMENT ON COLUMN CHAL_MONTH.ORIGINAL_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_MONTH.RENAMED_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_MONTH.CHAL_POINT IS '달성 시 지급 예정 포인트';
COMMENT ON COLUMN CHAL_MONTH.CHAL_COUNT IS '필요 달성 횟수';
COMMENT ON COLUMN CHAL_MONTH.START_DATE IS '게시 시작일';
COMMENT ON COLUMN CHAL_MONTH.END_DATE IS '게시 종료일';
COMMENT ON COLUMN CHAL_MONTH.CHAL_STATUS IS '게시 상태';

-- 이달의 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_MONTH;

-- 이달의 챌린지 테이블 INSERT
INSERT INTO CHAL_MONTH (
    CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, CHAL_COUNT, START_DATE, END_DATE, CHAL_STATUS
) VALUES (
    2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목', '이달의 챌린지 내용', 'challenge_today03.jpg', 'challenge_today03.jpg', 5000, 5, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT
);
INSERT INTO CHAL_MONTH (
    CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, CHAL_COUNT, START_DATE, END_DATE, CHAL_STATUS
) VALUES (
    2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목', '이달의 챌린지 내용', 'challenge_today03.jpg', 'challenge_today03.jpg', 1000, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT
);

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 1000, 5, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 1500, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 2000, 5, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 2500, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP; 
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 3000, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 3500, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 4000, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO CHAL_MONTH VALUES(2, SEQ_CHAL_MONTH.NEXTVAL, '이달의 챌린지 제목 ' || SEQ_CHAL_MONTH.CURRVAL, '이달의 챌린지 내용 ' || SEQ_CHAL_MONTH.CURRVAL, 'challenge_today03.jpg', 'challenge_today03.jpg', 4500, 10, SYSDATE, TO_DATE('2022-05-12', 'yyyy/MM/dd'), DEFAULT);
    END LOOP;  
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

-----------------------------------------------------------------------------------------------------------------------------------------

-- 이달의 챌린지 참여 회원 테이블 생성
CREATE TABLE CHAL_MONTH_MEM (
    NO NUMBER CONSTRAINT CHAL_MONTH_MEM_NO_PK PRIMARY KEY,
    MEM_NO NUMBER CONSTRAINT CHAL_MONTH_MEM_MEM_NO_FK REFERENCES MEMBER(NO),
    CHAL_NO NUMBER NOT NULL,
    CHAL_DATE DATE DEFAULT SYSDATE NOT NULL,
    ORIGINAL_FILENAME VARCHAR2(1000),
    RENAMED_FILENAME VARCHAR2(4000),
    MY_COUNT NUMBER NOT NULL,
    CHAL_STATUS CHAR DEFAULT 'Y' CHECK(CHAL_STATUS IN('Y', 'N')),
    CHAL_POINT NUMBER NOT NULL,
    CHAL_POINT_STATUS CHAR DEFAULT 'N' CHECK(CHAL_POINT_STATUS IN('Y', 'N'))
);

-- 이달의 챌린지 참여 회원 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_MONTH_MEM.NO IS '챌린지 참여 번호';
COMMENT ON COLUMN CHAL_MONTH_MEM.MEM_NO IS '회원 번호';
COMMENT ON COLUMN CHAL_MONTH_MEM.CHAL_NO IS '챌린지 고유 번호';
COMMENT ON COLUMN CHAL_MONTH_MEM.CHAL_DATE IS '달성일';
COMMENT ON COLUMN CHAL_MONTH_MEM.ORIGINAL_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_MONTH_MEM.RENAMED_FILENAME IS '이미지 파일명';
COMMENT ON COLUMN CHAL_MONTH_MEM.MY_COUNT IS '사용자 달성 횟수';
COMMENT ON COLUMN CHAL_MONTH_MEM.CHAL_STATUS IS '달성 상태';
COMMENT ON COLUMN CHAL_MONTH_MEM.CHAL_POINT IS '지급 포인트';
COMMENT ON COLUMN CHAL_MONTH_MEM.CHAL_POINT_STATUS IS '포인트 지급 상태';

-- 이달의 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_MONTH_MEM;


-----------------------------------------------------------------------------------------------------------------------------------------

-- 댓글 테이블 생성
CREATE TABLE CHAL_REPLY (
    REPLY_NO NUMBER CONSTRAINT CHAL_PEPLY_NO_PK PRIMARY KEY,
    MEM_NO NUMBER CONSTRAINT CHAL_REPLY_MEM_NO_FK REFERENCES MEMBER(NO),
    CHAL_NO NUMBER CONSTRAINT CHAL_REPLY_CHAL_NO_FK REFERENCES CHAL_MONTH(CHAL_NO),
    CONTENT VARCHAR2(4000),
    REPLY_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE
);

-- 댓글 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN CHAL_REPLY.CHAL_NO IS '챌린지 번호';
COMMENT ON COLUMN CHAL_REPLY.CONTENT IS '댓글 내용';
COMMENT ON COLUMN CHAL_REPLY.REPLY_DATE IS '작성일';
COMMENT ON COLUMN CHAL_REPLY.MODIFY_DATE IS '수정일';

-- 댓글 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_REPLY;


-----------------------------------------------------------------------------------------------------------------------------------------

-- 대댓글 테이블 생성
CREATE TABLE CHAL_NESTED_REPLY (
    NESTED_REPLY_NO NUMBER CONSTRAINT CHAL_NESTED_REPLY_NO_PK PRIMARY KEY,
    REPLY_NO NUMBER CONSTRAINT CHAL_NESTED_REPLY_REPLY_NO_FK REFERENCES CHAL_REPLY(REPLY_NO),
    MEM_NO NUMBER CONSTRAINT CHAL_NESTED_REPLY_MEM_NO_FK REFERENCES MEMBER(NO),
    CHAL_NO NUMBER,
    CONTENT VARCHAR2(4000),
    REPLY_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE,
    NESTED_REPLY_STATUS CHAR DEFAULT 'Y' CHECK(NESTED_REPLY_STATUS IN('Y', 'N'))
);

-- 대댓글 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_NESTED_REPLY.NESTED_REPLY_NO IS '대댓글 번호';
COMMENT ON COLUMN CHAL_NESTED_REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN CHAL_NESTED_REPLY.CHAL_NO IS '챌린지 번호';
COMMENT ON COLUMN CHAL_NESTED_REPLY.CONTENT IS '댓글 내용';
COMMENT ON COLUMN CHAL_NESTED_REPLY.REPLY_DATE IS '작성일';
COMMENT ON COLUMN CHAL_NESTED_REPLY.MODIFY_DATE IS '수정일';
COMMENT ON COLUMN CHAL_NESTED_REPLY.NESTED_REPLY_STATUS IS '게시 상태';

-- 대댓글 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHAL_NESTED_REPLY;


-------------------------------------------------------------------------------------------


-- 포인트 테이블 생성
CREATE TABLE POINT (
    POINT_NO NUMBER CONSTRAINT POINT_NO_PK PRIMARY KEY,
    MEM_NO NUMBER CONSTRAINT POINT_MEM_NO_FK REFERENCES MEMBER(NO),
    SAVE_DATE DATE DEFAULT SYSDATE,
    SAVE_CONTENT VARCHAR2(1000),
    SAVE_POINT NUMBER,
    SPEND_DATE DATE DEFAULT SYSDATE,
    SPEND_CONTENT VARCHAR2(1000),
    SPEND_POINT NUMBER,
    DISAPEAR_DATE DATE,
    POINT_CATEGORY CHAR DEFAULT 1 CHECK(POINT_CATEGORY IN(1, 2))
);

-- 포인트 테이블 컬럼 설명
COMMENT ON COLUMN POINT.POINT_NO IS '댓글 번호';
COMMENT ON COLUMN POINT.MEM_NO IS '회원 번호';
COMMENT ON COLUMN POINT.SAVE_DATE IS '적립일';
COMMENT ON COLUMN POINT.SAVE_CONTENT IS '적립 내용';
COMMENT ON COLUMN POINT.SAVE_POINT IS '적립 포인트';
COMMENT ON COLUMN POINT.SPEND_DATE IS '사용일';
COMMENT ON COLUMN POINT.SPEND_CONTENT IS '사용 내용';
COMMENT ON COLUMN POINT.SPEND_POINT IS '사용 포인트';
COMMENT ON COLUMN POINT.DISAPEAR_DATE IS '소멸 예정일';
COMMENT ON COLUMN POINT.POINT_CATEGORY IS '포인트 분류(1:적립/ 2:사용)';

-- 포인트 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_POINT;

-------------------------------------------------------------------------------------------


-- 0316 포인트 지급 상태 컬럼 추가
ALTER TABLE POINT ADD SAVE_STATUS CHAR DEFAULT 'Y' CHECK(SAVE_STATUS IN('Y', 'N'));








COMMIT;