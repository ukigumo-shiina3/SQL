-- LIKE演算子
SELECT * FROM 家計簿
WHERE メモ LIKE '%1月%'

-- BETWEEN演算子
SELECT *
FROM 家計簿
WHERE 出金額 BETWEEN 100 AND 3000

-- IN / NOT IN演算子
-- 食費または交際費に合致する行を取得
SELECT *
FROM 家計簿
WHERE 費目 IN ('食費', '交際費')

-- 食費でも交際費でもない行を取得
SELECT *
FROM 家計簿
WHERE 費目 NOT IN ('食費', '交際費')

-- ANY演算子(いずれかが真なら真), ALL演算子(全てが真なら真)
出金額(2500) < ANY(1000, 2000, 3000) --true
出金額(1000) < ALL(1000, 2000, 3000) --false

