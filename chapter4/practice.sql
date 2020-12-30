-- DISTINCT(重複行の除外)
SELECT DISTINCT 費目 FROM 家計簿

-- ORDER BY（並び替え）
SELECT * FROM 家計簿
ORDER BY  入金額 DESC, 出金額 DESC

-- 列番号でソート指定
SELECT * FROM 家計簿
ORDER BY  4 DESC, 5 DESC --4列目と5列目を降順に並び替え

--LINMIT(先頭から数行だけ取得)
SELECT 費目, 出金額 FROM 家計簿
ORDER BY 出金額 DESC LIMIT 3 --出金額の高い順に3件取得

-- 和集合
SELECT 費目 FROM 家計簿
UNION
SELECT 費目 FROM 家計簿アーカイブ

-- 差集合
SELECT 費目 FROM 家計簿
EXCEPT
SELECT 費目 FROM 家計簿アーカイブ

-- 積集合(共通する行を取得)
SELECT 費目 FROM 家計簿
INTERSECT
SELECT 費目 FROM 家計簿アーカイブ