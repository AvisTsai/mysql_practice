CREATE DEFAULT �ٿ�
AS '����'

exec sp_bindefault '�ٿ�','[dbo].[�Ȥ�@].[�ٿ�]'

alter FUNCTION ������
(@������ nchar(10))
RETURNS nchar(10)
begin
declare @�ĤG�X int
declare @�ٿ� nchar(10)

set @�ĤG�X = right(left(@������,2),1)
-- SELECT �����Ҧr�� FROM [dbo].[�Ȥ�@]
-- @�ĤG�X = SELECT RIGHT(LEFT(�����Ҧr��,2)1)
	if @�ĤG�X = 1
		set @�ٿ� = '����'

	else if @�ĤG�X = 2
		set @�ٿ� = '�p�j'

	return @�ٿ�
end

ALTER procedure ������P
@������ nchar(10),@�s�� nchar(10), @�m�W nchar(10), @�q�� int
as 
begin
declare @�ĤG�X int
	set @�ĤG�X = right(left(@������,2),1)
	if @�ĤG�X = 1
		insert into [dbo].[�Ȥ�T](�s��,�m�W,�����Ҧr��,�ٿ�,�q��)
		values(@�s��,@�m�W,@������,'����',@�q��)
	else if @�ĤG�X = 2
		insert into [dbo].[�Ȥ�T](�s��,�m�W,�����Ҧr��,�ٿ�,�q��)
		values(@�s��,@�m�W,@������,'�p�j',@�q��)
	else 
		print '�����Ҧr�������T�A�L�k�M�w�ٿ�'
end

exec ������P 'F122', '20', '���ȿo', 123
exec ������P 'F222', '20', '���ȿo', 123
exec ������P 'F322', '20', '���ȿo', 123