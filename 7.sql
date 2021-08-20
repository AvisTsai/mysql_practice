CREATE DEFAULT 稱謂
AS '先生'

exec sp_bindefault '稱謂','[dbo].[客戶一].[稱謂]'

alter FUNCTION 身分證
(@身分證 nchar(10))
RETURNS nchar(10)
begin
declare @第二碼 int
declare @稱謂 nchar(10)

set @第二碼 = right(left(@身分證,2),1)
-- SELECT 身分證字號 FROM [dbo].[客戶一]
-- @第二碼 = SELECT RIGHT(LEFT(身分證字號,2)1)
	if @第二碼 = 1
		set @稱謂 = '先生'

	else if @第二碼 = 2
		set @稱謂 = '小姐'

	return @稱謂
end

ALTER procedure 身分證P
@身分證 nchar(10),@編號 nchar(10), @姓名 nchar(10), @電話 int
as 
begin
declare @第二碼 int
	set @第二碼 = right(left(@身分證,2),1)
	if @第二碼 = 1
		insert into [dbo].[客戶三](編號,姓名,身分證字號,稱謂,電話)
		values(@編號,@姓名,@身分證,'先生',@電話)
	else if @第二碼 = 2
		insert into [dbo].[客戶三](編號,姓名,身分證字號,稱謂,電話)
		values(@編號,@姓名,@身分證,'小姐',@電話)
	else 
		print '身分證字號不正確，無法決定稱謂'
end

exec 身分證P 'F122', '20', '蔡亞穎', 123
exec 身分證P 'F222', '20', '蔡亞穎', 123
exec 身分證P 'F322', '20', '蔡亞穎', 123