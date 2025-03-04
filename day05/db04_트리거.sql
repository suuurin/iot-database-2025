-- 트리거
-- 시작 전 설정변경
-- 다음 버전 MySQL에서는 사라질 예정(Deprecated)
SET GLOBAL log_bin_trust_function_creators = ON;

-- Book_log 테이블을 생성
CREATE TABLE Book_Log (
	bookid_l	INTEGER,
    bookname_l	VARCHAR(40),
    publisher_l VARCHAR(40),
    price_l		INTEGER
);

-- 트리거 생성
-- UPDATE나 DELETE 시는 old. 라고 사용 AFTER UPDATE ON 테이블명..
-- BEFORE INSERT, UPDATE, DELETE ...
DELIMITER //
CREATE TRIGGER AfterInsertBook
	AFTER INSERT ON Book FOR EACH ROW /* 트리거가 Book 테이블에 데이터가 새로 추가되면 바로 발동! */ 
BEGIN
	DECLARE average INTEGER;
    INSERT INTO Book_log
    VALUES (new.bookid, new.bookname, new.publisher, new.price);
END;

-- Book 테이블에 Insert 실행
INSERT INTO Book VALUES(40, '안드로이드는 전기양의 꿈을 꾸는가', '이상미디어', 25000);