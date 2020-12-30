-- 問題1
1.SELECT * FROM 注文履歴 ORDER BY 注文番号、注文枝番
2.SELECT DISTINCT 商品名 FROM 注文履歴 WHERE 日付 => '2013年1月1日' AND 日付 =< '2013年1月31日' ORDER BY 商品名
3.SELECT 商品名、単価 FROM 注文履歴 WHERE 分類 = '1' ORDER BY 単価 LIMIT 3
4.SELECT 商品名、単価 FROM 注文履歴 WHERE 分類 = '2' ORDER BY 単価 DESC LIMIT 1 OFFSET 1
5.SELECT 日付、商品名、単価、数量、注文金額 FROM 注文履歴 WHERE 分類 = '3' AND 数量 >= 2 ORDER BY 日付, 数量 DESC 2
6.SELECT DISTINCT 分類、商品名、サイズ、単価 FROM 注文履歴 WHERE 分類 = '1' UNION
SELECT DISTINCT 分類、商品名、NULL、単価 FROM 注文履歴 WHERE 分類 = '2' UNION
SELECT DISTINCT 分類、商品名、NULL、単価 FROM 注文履歴 WHERE 分類 = '3' ORDER BY 1, 2

-- 問題2
1.SELECT 値 FROM 奇数 UNION SELECT 値 FROM 偶数
2.SELECT 値 FROM 整数 EXCEPT SELECT 値 FROM 偶数
3.SELECT 値 FROM 整数 INTERSECT SELECT 値 FROM 偶数
4.SELECT 値 FROM 奇数 INTERSECT SELECT 値 FROM 偶数