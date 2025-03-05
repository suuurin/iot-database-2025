-- 08 트랜잭션
-- 테이블 생성
CREATE TABLE Bank(
	name	VARCHAR(40) PRIMARY KEY,
    balance INTEGER
);

-- 데이터 추가
INSERT INTO Bank VALUES ('박지성', 1000000), ('김연아', 1000000);

-- 트랜잭션은 업무 논리적 단위(All or Nothing)
-- START TRANSACTION; 으로 트랜잭션 시작
-- 성공시 COMMIT; 실패시 ROLLBACK;
START TRANSACTION;
-- 박지성, 김연아 계좌 읽어온다.
SELECT * FROM Bank WHERE name = '박지성';
SELECT * FROM Bank WHERE name = '김연아';

-- 박지성 계좌에서 10000원 인출
UPDATE Bank SET
			balance = balance - 10000
WHERE name = '박지성';

-- 김연아 계좌 10000원 입금
UPDATE Bank SET
			balance = balance + 10000
WHERE name = '김연아';

-- 박지성, 김연아 계좌 읽어온다.
SELECT * FROM Bank WHERE name = '박지성';
SELECT * FROM Bank WHERE name = '김연아';

-- 트랜잭션 종료. 두개 명령을 다 수행하는 게 아님
COMMIT;
ROLLBACK;