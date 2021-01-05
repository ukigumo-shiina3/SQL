-- 1つのSQLで最大の出費に関する費目と金額を求める
SELECT 費目, 出金額 FROM 家計簿
 WHERE 出金額 = ( SELECT MAX(出金額) FROM 家計簿 )

-- SET句の副問い合わせ
UPDATE 家計簿集計
   SET 平均 = (SELECT AVG(出金額)
                 FROM 家計簿アーカイブ
                WHERE 出金額 > 0
                  AND 費目 = '食費')
 WHERE 費目 = '食費'

-- 選択リストの副問い合わせ
SELECT 日付,メモ,出金額,
       (SELECT 合計 FROM 家計簿集計
        WHERE 費目 = '食費') AS 過去の合計
    FROM 家計簿アーカイブ
 WHERE 費目 = '食費'

-- INで副問い合わせ
SELECT * FROM 家計簿集計

-- 副問い合わせからNULLを除外①
SELECT * FROM 家計簿アーカイブ
 WHERE 費目  IN (SELECT 費目 FROM 家計簿
                  WHERE 費目 IS NOT NULL)

-- 副問い合わせからNULLを除外②(NULLを不明に置き換える)
SELECT * FROM 家計簿アーカイブ
  WHERE 費目  IN (SELECT COALESCE(費目, '不明') FROM 家計簿) 

-- FROM句での副問い合わせ
SELECT SUM(SUB.出金額) AS 出金額合計
  FROM (SELECT 日付, 費目, 出金額
          FROM 家計簿
        UNION
        SELECT 日付, 費目, 出金額
          FROM 家計簿アーカイブ
         WHERE 日付 >= '2013-01-01'
           AND 日付 <= '2013-01-31') AS SUB

-- INSERT INTO文での副問い合わせ
INSERT INTO 家計簿集計(費目, 合計, 平均, 回数)
SELECT 費目, SUM(出金額), AVG(出金額), 0
  FROM 家計簿
 WHERE 出金額 > 0
 GROUP BY 費目

