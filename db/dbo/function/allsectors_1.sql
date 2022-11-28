CREATE FUNCTION [dbo].[Getallsectors]
(

)
RETURNS nvarchar(max)
AS
BEGIN
declare @json nvarchar (max)
set  @json =(SELECT     name, id, ename, pict
FROM       dbo.sector
for json PATH, ROOT ('sectors' ))
	RETURN @json
END
