-- テーブル作成(デフォルト値設定)
CREATE TABLE 家計簿 (
  日付        DATE,
  費目ID      INTEGER,
  メモ         VARCHAR(100) DEFAULT '不明',
  入金額      INTEGER      DEFAULT 0,
  出金額      INTEGER      DEFAULT 0
)

-- 列の追加と削除
ALTER TABLE 家計簿 ADD  関連日 DATE ;
ALTER TABLE 家計簿 DROP  関連日 ;

-- 基本的な3つの制約(NOT NULL, CHACK, UNIQUE)
CREATE TABLE 家計簿 (
  日付     DATE         NOT NULL,
  費目ID   INTEGER,
  メモ      VARCHAR(100) DEFAULT '不明' NOT NULL,
  入金額   INTEGER      DEFAULT 0 CHECK(入金額 >= 0),
  出金額   INTEGER      DEFAULT 0 CHECK(出金額 >= 0)
);
CREATE TABLE 費目 (
  ID      INTEGER,
  名前     VARCHAR(40)  UNIQUE
);

-- 主キー制約
CREATE TABLE 費目 (
  ID   INTEGER     PRIMARY KEY,
  名前  VARCHAR(40) UNIQUE
)

-- 参照適合性制約を崩す例
-- ①家計簿テーブルで利用中の費目について、費目テーブルから削除
DELETE FROM 費目 WHERE ID = 2;
-- ②家計簿テーブルで利用中の費目について、費目テーブルのID を変更
UPDATE 費目 SET ID = 5 WHERE ID = 1;
-- ③家計簿テーブルに行を追加する際、費目テーブルに存在しない費目を指定
INSERT INTO 家計簿 (日付, 費目ID, 入金額, 出金額)
     VALUES ('2013-04-06', 99, 0, 800);
-- ④家計簿テーブルの行を更新する際、費目テーブルに存在しない費目を指定
UPDATE 家計簿 SET 費目ID = 99
 WHERE 日付= '2013-04-10';

-- 外部キー制約
CREATE TABLE 家計簿 (
  日付       DATE         NOT NULL,
  費目ID     INTEGER      REFERENCES 費目(ID),
  メモ        VARCHAR(100) DEFAULT '不明' NOT NULL,
  入金額     INTEGER      DEFAULT 0 CHECK(入金額 >= 0),
  出金額     INTEGER      DEFAULT 0 CHECK(出金額 >= 0)
)