-- 問題1
SELECT *
FROM 家計簿
WHERE 入出金額 = 50000 

--問題2
DELETE FROM 家計簿
WHERE 出金額 > 4000

--問題3
UPDATE 家計簿
SET メモ = カフェラテを購入
WHERE '2013-02-03'
