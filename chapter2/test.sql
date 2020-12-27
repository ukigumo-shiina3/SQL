-- 問題１
SELECT *
FROM  都道府県

-- 問題2
SELECT 地域 AS area, 都道府県 AS pref
FROM  都道府県

INSERT INTO 都道府県
        (コード、地域、都道府県名、面積)
    VALUES('26', '近畿', '京都', 4613)

INSERT INTO 都道府県
    VALUES('37', '四国', '香川', '高松', 1876)

INSERT INTO 都道府県
        (コード、都道府県名、県庁所在地)
    VALUES('40', '福岡', '福岡')

-- 問題3
UPDATE 都道府県
SET 県庁所在地 = '京都'
WHERE コード = '26'

UPDATE 都道府県
SET 地域 = '九州',  面積 = 4976
WHERE コード = '40'

-- 問題4 
DELETE  FROM 都道府県
WHERE コード = '26'


