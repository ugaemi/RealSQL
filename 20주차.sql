-- 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기
SELECT CONCAT('/home/grep/src/', F.BOARD_ID, '/',F.FILE_ID,F.FILE_NAME,F.FILE_EXT) AS FILE_PATH
FROM USED_GOODS_BOARD AS B
JOIN USED_GOODS_FILE AS F
ON B.BOARD_ID = F.BOARD_ID
WHERE VIEWS = (SELECT VIEWS
FROM USED_GOODS_BOARD
ORDER BY VIEWS DESC
LIMIT 1)
ORDER BY F.FILE_ID DESC;


-- 대여 기록이 존재하는 자동차 리스트 구하기
SELECT C.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR AS C
JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
ON C.CAR_ID = H.CAR_ID
WHERE C.CAR_TYPE = '세단'
AND month(H.START_DATE) = '10'
GROUP BY 1
ORDER BY 1 DESC;