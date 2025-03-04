-- 사용자 정의 함수. 내장함수 반대. 개발자가 직접 만드는 함수
-- 저장 프로시저와 유사. RETURNS, RETURN 키워드가 차이남
SELECT char_length('FUCK');

DELIMITER //
CREATE FUNCTION fnc_Interest(
	price  INTEGER
) RETURNS INTEGER
BEGIN
	DECLARE myInterest INTEGER;
    -- 3만원 이상이면 10%, 아니면 5%
	IF price >= 30000 THEN SET myInterest = price * 0.1;
	ELSE SET myInterest = price * 0.05;
    END IF;
    RETURN myInterest;
END;

-- 실행
SELECT custid, orderid, saleprice, fnc_Interest(saleprice) AS '이익금'
FROM  Orders;