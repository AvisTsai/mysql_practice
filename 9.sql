CREATE RULE �ʧO_����
AS @gender IN('�k','�k')

exec sp_bindrule '�ʧO_����','[dbo].[���y].[�ʧO]' 

CREATE RULE �A�Ч__����
AS @�A�Ч_ IN('Y','N')

exec sp_bindrule '�A�Ч__����','[dbo].[���y].[�A�Ч_]' 

CREATE DEFAULT ���y���p
AS '�b��'

exec sp_bindefault '���y���p','[dbo].[���y].[�b�Ǫ��p]'

ALTER TRIGGER �s�W�w�x���
ON [dbo].[���y]
AFTER INSERT
AS
BEGIN
	--IF INSERTED.[�ʧO] = '�k��' AND INSERTED.[�A�Ч_] = 'N' AND INSERTED.[�b�Ǫ��p] = '�b��'
	INSERT �w�x���
	SELECT �Ǹ�,�m�W FROM INSERTED 
	WHERE INSERTED.[�ʧO] = '�k' AND INSERTED.[�A�Ч_] = 'N' AND INSERTED.[�b�Ǫ��p] = '�b��'
END

ALTER TRIGGER �w�x��Ʋ���
ON [dbo].[���y]
AFTER UPDATE 
AS
BEGIN
	INSERT �w�x���
	SELECT �Ǹ�,�m�W FROM INSERTED 
	WHERE INSERTED.[�ʧO] = '�k' AND INSERTED.[�A�Ч_] = 'N' AND INSERTED.[�b�Ǫ��p] = '�b��'

	DELETE FROM �w�x���
	WHERE EXISTS (SELECT * FROM INSERTED WHERE INSERTED.[�ʧO] <> '�k' OR INSERTED.[�A�Ч_] <> 'N' OR INSERTED.[�b�Ǫ��p] <> '�b��')
	AND �w�x���.�Ǹ� = (SELECT �Ǹ� FROM INSERTED)
END
