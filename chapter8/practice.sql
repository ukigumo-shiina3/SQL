-- テーブルの結合
SELECT 日付, 名前 AS 費目, メモ
  FROM 家計簿
  JOIN 費目                    -- 結合する他の表を指定
    ON 家計簿.費目ID = 費目.ID   -- 結合条件を指定

-- 左外部結合(本来結果評価ら消滅してしまう行も強制的に出力する/結合相手が見つからない場合はNULLで返す)
SELECT 〜 FROM 左表の名前
 LEFT JOIN 右表の名前
  ON 結合条件

-- 2種類のメモを両方出力する
SELECT 日付, 家計簿.メモ, 費目.メモ
  FROM 家計簿
  JOIN 費目
    ON 家計簿.費目ID = 費目.ID

-- 別名を使ったSQL文
SELECT 日付, K.メモ, H.メモ
  FROM 家計簿 AS K  -- 家計簿テーブルに別名K を設定
  JOIN 費目 AS H    -- 費目テーブルに別名H を設定
    ON K.費目ID = H.ID

-- 3つのケーブルを結合するSQL文
SELECT 日付, 費目.名前, 経費区分.名称
  FROM 家計簿   -- 家計簿テーブルに対して…
  JOIN 費目     -- まず費目を結合して…
    ON 家計簿.費目ID = 費目.ID
  JOIN 経費区分  -- その結果にさらに経費区分を結合
    ON 費目.経費区分ID = 経費区分.ID

-- 副問い合わせの結果を結合するSQL文
SELECT 日付, 費目.名前, 費目.経費区分ID
  FROM 家計簿        -- 家計簿テーブルに対して…
  JOIN ( SELECT * FROM 費目
          WHERE 経費区分ID = 1
       ) AS 費目     -- 副問い合わせの結果を結合
    ON 家計簿.費目ID = 費目.ID

-- 自分自身と結合するSQL文
SELECT A.日付, A.メモ, A.関連日付, B.メモ
  FROM 家計簿 AS A
  LEFT JOIN 家計簿 AS B
         ON A.関連日付 = B.日付