
-- 1번. 회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.(결과는 아래와 동일하게 나와야 하며, 전체 행의 개수는 31개입니다)
SELECT email, mobile, names, addr FROM membertbl;

-- 2번. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.(전채 행의 개수는 59개입니다)
SELECT names as 도서명, author as 저자, ISBN, price as 정가
FROM bookstbl
ORDER BY ISBN;

-- 3번. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.(책을 한번도 빌린적이 없는 회원을 뜻합니다. 18명이 나옵니다.)

SELECT names as 비대여자명, levels as 등급, addr as 주소, rentalDate as 대여일 FROM membertbl
LEFT JOIN rentaltbl ON membertbl.Idx = rentaltbl.memberIdx
WHERE rentaltbl.Idx IS NULL
ORDER BY levels;

-- 4번. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
SELECT COALESCE(D.Names,'--합계--') AS 장르,
	   CONCAT(FORMAT(SUM(B.price), 0),'원') AS 총합계금액
FROM bookstbl B
JOIN divtbl D ON B.Division = D.Division
GROUP BY D.Names WITH ROLLUP;
