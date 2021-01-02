-- NULL をゼロに変換した上で平均する 
SELECT AVG(COALESCE(出金額, 0)) AS 出金額の平均
FROM 家計簿

--グループ化
SELECT 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
GROUP BY 費目 

--合計値が0より大きいグループを抽出
SELECT 費目, SUM(出金額) AS 費目別の出金額の合計
  FROM 家計簿
 GROUP BY 費目
HAVING SUM(出金額) > 0  

