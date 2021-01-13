-- インデックスの作成(検索の高速化)
CREATE INDEX 費目IDインデックス ON 家計簿(費目ID);
CREATE INDEX メモインデックス ON 家計簿(メモ);

-- ビューの作成(結果票をテーブルのように扱える)
CREATE VIEW 家計簿4月 AS
SELECT * FROM 家計簿
 WHERE 日付 >= '2013-04-01'
   AND 日付 <= '2013-04-30'

