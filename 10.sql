declare cur_��� cursor
for  select distinct �ҵ{�s�� from ����`��

declare @stuNo nchar(10), @stuName nchar(10), @cosName nchar(10),@cosNum nchar(10), @list varchar(500), @cnt int, @num int, @tot int

open cur_���
fetch cur_��� into @cosNum
while (@@fetch_status = 0)
  begin
    declare cur_�ҵ{�s�� cursor
    for select �ҵ{�W��,�ҵ{�s��,�Ǹ�
        from ����`��
        where �ҵ{�s��= @cosNum 

        open cur_�ҵ{�s��
        fetch cur_�ҵ{�s�� into  @cosName, @cosNum, @stuNo
       
        set @list= '���' + @cosNum + @cosName + '����'
        set @cnt=0
        set @tot=0
        while (@@fetch_status = 0)
          begin
             set @list=@list+ @stuNo
             set @cnt=@cnt+1     
             set @tot=@tot+ 1
             fetch cur_�ҵ{�s��
             into @cosName, @cosNum, @stuNo
          end
        print @list+ '��' +'�@'+cast(@tot as varchar)+'�H'
        close cur_�ҵ{�s��
        deallocate cur_�ҵ{�s��
       fetch cur_��� into @cosNum
  end
  close cur_���
  deallocate cur_���


/* �ĤG�D */

ALTER FUNCTION GET_STUDENTS_NO(@COURSE_NO VARCHAR(10))
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @OUTPUT VARCHAR(500)
	DECLARE @COUNT INT
	SET @OUTPUT = ''
	SET @COUNT = 0
	SELECT @OUTPUT = @OUTPUT + �Ǹ� + ' ', @COUNT = @COUNT + 1 FROM ����`�� WHERE �ҵ{�s�� = @COURSE_NO
	RETURN @OUTPUT + '�� �@' + CAST(@COUNT AS VARCHAR) + '�H'
END

DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)
DECLARE @OUTPUT VARCHAR(500)
SET @OUTPUT = ''
SELECT @OUTPUT = @OUTPUT + '��� ' + �ҵ{�s�� + �ҵ{�W�� + '���� ' + DBO.GET_STUDENTS_NO(�ҵ{�s��) + @NewLineChar FROM ����`�� 
GROUP BY �ҵ{�s��, �ҵ{�W��
PRINT(@OUTPUT)

