ALTER FUNCTION �����˴��׼�
(@id varchar(50),@y int,@m int)
RETURNS INT

BEGIN

	DECLARE @�׼� INT =

	(SELECT �ۿ��׼� 
	FROM �Ȥ�׼�
	WHERE(�Ȥ�s��=@id and ����~=@y and ���=@m))

	IF (@�׼� > 0) 
		return @�׼�
	ELSE

		declare @temp1 table(�׼� int)
		insert @temp1(�׼�)
		select top 3 �ۿ��׼�
		from �Ȥ�׼�
		where ((�Ȥ�s��=@id and ����~<@y) or (�Ȥ�s��=@id and ����~=@y and ���<@m))
		order by �Ȥ�s��,����~ desc,��� desc

		declare @�����׼� int
		select @�����׼� =SUM(�׼�)/COUNT(*)
		from @temp1
		return @�����׼�

	return @�׼�
END

CREATE FUNCTION �C�리�O
(@id varchar(10),@y int,@m int)
RETURNS INT
BEGIN
	declare @�C��O�� int = (select �����׼�*���+�޽u���@�O from �Ȥ�׼� where  (�Ȥ�s��=@id and ����~=@y and ���=@m))
	return @�C��O��
END


--�C��O�Ρץ˴��׼ơѳ��($5)�Ϻ޽u���@�O($30)

