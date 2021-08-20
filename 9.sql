CREATE RULE 性別_限制
AS @gender IN('男','女')

exec sp_bindrule '性別_限制','[dbo].[學籍].[性別]' 

CREATE RULE 服役否_限制
AS @服役否 IN('Y','N')

exec sp_bindrule '服役否_限制','[dbo].[學籍].[服役否]' 

CREATE DEFAULT 學籍狀況
AS '在學'

exec sp_bindefault '學籍狀況','[dbo].[學籍].[在學狀況]'

ALTER TRIGGER 新增緩徵資料
ON [dbo].[學籍]
AFTER INSERT
AS
BEGIN
	--IF INSERTED.[性別] = '男生' AND INSERTED.[服役否] = 'N' AND INSERTED.[在學狀況] = '在學'
	INSERT 緩徵資料
	SELECT 學號,姓名 FROM INSERTED 
	WHERE INSERTED.[性別] = '男' AND INSERTED.[服役否] = 'N' AND INSERTED.[在學狀況] = '在學'
END

ALTER TRIGGER 緩徵資料異動
ON [dbo].[學籍]
AFTER UPDATE 
AS
BEGIN
	INSERT 緩徵資料
	SELECT 學號,姓名 FROM INSERTED 
	WHERE INSERTED.[性別] = '男' AND INSERTED.[服役否] = 'N' AND INSERTED.[在學狀況] = '在學'

	DELETE FROM 緩徵資料
	WHERE EXISTS (SELECT * FROM INSERTED WHERE INSERTED.[性別] <> '男' OR INSERTED.[服役否] <> 'N' OR INSERTED.[在學狀況] <> '在學')
	AND 緩徵資料.學號 = (SELECT 學號 FROM INSERTED)
END
