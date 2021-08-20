declare cur_選課 cursor
for  select distinct 課程編號 from 選課總表

declare @stuNo nchar(10), @stuName nchar(10), @cosName nchar(10),@cosNum nchar(10), @list varchar(500), @cnt int, @num int, @tot int

open cur_選課
fetch cur_選課 into @cosNum
while (@@fetch_status = 0)
  begin
    declare cur_課程編號 cursor
    for select 課程名稱,課程編號,學號
        from 選課總表
        where 課程編號= @cosNum 

        open cur_課程編號
        fetch cur_課程編號 into  @cosName, @cosNum, @stuNo
       
        set @list= '選修' + @cosNum + @cosName + '的有'
        set @cnt=0
        set @tot=0
        while (@@fetch_status = 0)
          begin
             set @list=@list+ @stuNo
             set @cnt=@cnt+1     
             set @tot=@tot+ 1
             fetch cur_課程編號
             into @cosName, @cosNum, @stuNo
          end
        print @list+ '等' +'共'+cast(@tot as varchar)+'人'
        close cur_課程編號
        deallocate cur_課程編號
       fetch cur_選課 into @cosNum
  end
  close cur_選課
  deallocate cur_選課


/* 第二題 */

ALTER FUNCTION GET_STUDENTS_NO(@COURSE_NO VARCHAR(10))
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @OUTPUT VARCHAR(500)
	DECLARE @COUNT INT
	SET @OUTPUT = ''
	SET @COUNT = 0
	SELECT @OUTPUT = @OUTPUT + 學號 + ' ', @COUNT = @COUNT + 1 FROM 選課總表 WHERE 課程編號 = @COURSE_NO
	RETURN @OUTPUT + '等 共' + CAST(@COUNT AS VARCHAR) + '人'
END

DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)
DECLARE @OUTPUT VARCHAR(500)
SET @OUTPUT = ''
SELECT @OUTPUT = @OUTPUT + '選修 ' + 課程編號 + 課程名稱 + '的有 ' + DBO.GET_STUDENTS_NO(課程編號) + @NewLineChar FROM 選課總表 
GROUP BY 課程編號, 課程名稱
PRINT(@OUTPUT)

