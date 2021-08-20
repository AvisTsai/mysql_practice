ALTER PROCEDURE 物料編號查詢
@物料編號 varchar(10),@品名 char(10),@庫存數量 int,@單位 char(10),@單價 money
AS 
BEGIN 
	if exists (select 物料編號 from [dbo].[物料庫存] where @物料編號 = 物料編號)
		begin
			if not exists(select * from [dbo].[物料庫存] 
						  where @物料編號 = 物料編號 
								and @品名 = 品名 
								and @庫存數量 = 庫存數量 
								and @單位 = 單位 
								and @單價 = 單價
						 )
				print '物料編號 已存在  詳細資料有錯誤!'
			else
				print '資料完全正確'
		end
	else
		print '無物料編號為「' + @物料編號 + '」之物料'
END

exec 物料編號查詢 'A002','蓋片',1234,'片',4.0000
exec 物料編號查詢 'A002','蓋片',123,'片',4.0000
exec 物料編號查詢 'A003','蓋片',1234,'片',4.0000