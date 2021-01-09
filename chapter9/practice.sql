-- 変更の開始(BEGIN),変更の終了(COMMIT)のトランザクション
BEGIN; 
-- 処理1: アーカイブテーブルへコピー
INSERT INTO 家計簿アーカイブ
SELECT * FROM 家計簿 WHERE 日付 <= '2013-01-31';
-- 処理2: 家計簿テーブルから削除
DELETE FROM 家計簿 WHERE 日付 <= '2013-01-31';
COMMIT;

-- 変更の取り消し(ROLLBACK)のトランザクション
BEGIN;
DELETE FROM 家計簿 WHERE 日付 = '2013-03-20';
ROLLBACK;

-- 排他ロック(他からのロックを一切許可しない。データ更新時使用)
BEGIN;
LOCK TABLE 家計簿 IN EXCLUSIVE MODE;
INSERT INTO 統計結果
SELECT 'データ件数', COUNT(*) FROM 家計簿;
INSERT INTO 統計結果
SELECT '出金額平均', AVG(出金額) FROM 家計簿;
COMMIT;