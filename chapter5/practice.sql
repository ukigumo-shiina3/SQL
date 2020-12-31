-- 費目の値に応じて変換する 
SELECT 費目, 出金額,
    CASE 費目 WHEN '居住費' THEN '固定費'
        WHEN '水道光熱費' THEN '固定費'
        ELSE '変動費'
    END AS 出費の分類
FROM 家計簿 WHERE 出金額 > 0 


-- 条件に応じた値に変換する 
SELECT 費目, 入金額,
    CASE WHEN 入金額 < 5000 THEN 'お小遣い'
        WHEN 入金額 < 100000 THEN '一時収入'
        WHEN 入金額 < 300000 THEN '給料出たー！'
        ELSE '想定外の収入です！'
    END AS 収入の分類
FROM 家計簿
WHERE 入金額 > 0

-- 文字列の長さを取得
SELECT メモ, LENGTH(メモ) AS メモの長さ
FROM 家計簿

-- 空白削除
SELECT メモ, TRIM(メモ) AS 空白除去したメモ
FROM 家計簿

-- 一部を置き換える
UPDATE 家計簿
SET メモ = REPLACE(メモ, '購入', '買った') --「購入」から「買った」に置き換える

-- 一部を抽出する
SELECT * FROM 家計簿
WHERE SUBSTRING(費目, 1, 3) LIKE '%費%' --1〜3文字目から抽出

-- 指定桁で四捨五入
SELECT 出金額, ROUND(出金額, -2) AS 百円単位の出金額 -- 出金額の下２桁、10の位で四捨五入
FROM 家計簿