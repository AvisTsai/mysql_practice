ALTER PROCEDURE ���ƽs���d��
@���ƽs�� varchar(10),@�~�W char(10),@�w�s�ƶq int,@��� char(10),@��� money
AS 
BEGIN 
	if exists (select ���ƽs�� from [dbo].[���Ʈw�s] where @���ƽs�� = ���ƽs��)
		begin
			if not exists(select * from [dbo].[���Ʈw�s] 
						  where @���ƽs�� = ���ƽs�� 
								and @�~�W = �~�W 
								and @�w�s�ƶq = �w�s�ƶq 
								and @��� = ��� 
								and @��� = ���
						 )
				print '���ƽs�� �w�s�b  �ԲӸ�Ʀ����~!'
			else
				print '��Ƨ������T'
		end
	else
		print '�L���ƽs�����u' + @���ƽs�� + '�v������'
END

exec ���ƽs���d�� 'A002','�\��',1234,'��',4.0000
exec ���ƽs���d�� 'A002','�\��',123,'��',4.0000
exec ���ƽs���d�� 'A003','�\��',1234,'��',4.0000