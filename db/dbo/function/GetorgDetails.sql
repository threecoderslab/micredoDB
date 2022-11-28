CREATE FUNCTION [dbo].[GetorgDetails]
(
	@orgid int
)
RETURNS nvarchar(max)
AS
BEGIN
declare @json as nvarchar(max)
set @json=(SELECT isnull([warningCl],'') warningCl,og.name,og.logo,og.sectorid
  FROM [dbo].[org_details] dt
 right outer  join [dbo].[org] og on og.id=dt.[org_id]
where og.id=@orgid
for json PATH, ROOT ('org_details' ))
	RETURN @json
END
