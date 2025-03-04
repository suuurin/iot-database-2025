-- 5-4 Order 테이블의 판매 도서에 대한 이익금을 계산하는 프로시저
DELIMITER //
CREATE PROCEDURE GetInterest(
)
BEGIN
	-- 변수 선언
	DECLARE myInterest FLOAT DEFAULT 0.0;
    DECLARE price INTEGER;
    DECLARE endOrRow BOOLEAN DEFAULT FALSE;
    DECLARE InterestCusor CURSOR FOR
			SELECT saleprice FROM Orders;
	DECLARE CONTINUE handler
			FOR NOT FOUND SET endOfRow=TRUE;
	
    -- 커서 오픈
    OPEN InterestCusor;
    curor_loop: LOOP
		FETCH InterestCusorOrder INTO price;	-- select saleprice from Orders의 테이블 한행씩 읽어서 값을 price에 집어넣는다.
        IF endOfRow THEN LEAVE cursor_loop;
        END IF;
        IF price >= 30000 THEN
			SET myInterest = myInterest + price * 0.1;
        ELSE
			SET myInterest = myInterest + price * 0.05;
		END IF;
    END LOOP cusor_loop;
    CLOSE InterestCursor; -- 커서 종료
    
    -- 결과 출력
    SELECT CONCAT('전체 이익 금액 =', myInterest) AS 'Interest';
END;
-- 저장프로시저 실행
CALL GetInterest();