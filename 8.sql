ALTER FUNCTION 崩︳ニ吹计
(@id varchar(50),@y int,@m int)
RETURNS INT

BEGIN

	DECLARE @计 INT =

	(SELECT й况计 
	FROM め计
	WHERE(め絪腹=@id and チ瓣=@y and る=@m))

	IF (@计 > 0) 
		return @计
	ELSE

		declare @temp1 table(计 int)
		insert @temp1(计)
		select top 3 й况计
		from め计
		where ((め絪腹=@id and チ瓣<@y) or (め絪腹=@id and チ瓣=@y and る<@m))
		order by め絪腹,チ瓣 desc,る desc

		declare @キА计 int
		select @キА计 =SUM(计)/COUNT(*)
		from @temp1
		return @キА计

	return @计
END

CREATE FUNCTION –るΜ禣
(@id varchar(10),@y int,@m int)
RETURNS INT
BEGIN
	declare @–る禣ノ int = (select 崩︳计*虫基+恨絬蝴臔禣 from め计 where  (め絪腹=@id and チ瓣=@y and る=@m))
	return @–る禣ノ
END


--–る禣ノ∽ニ吹计⊙虫基($5)∠恨絬蝴臔禣($30)

