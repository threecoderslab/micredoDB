CREATE FUNCTION [dbo].[GetorgbySectionid]
(
	@sectionid int
)
RETURNS @returntable TABLE
(
	name nvarchar(50),
	id int,
	logo nvarchar(50)
)
AS
BEGIN
insert into @returntable
	SELECT     name, id, logo
FROM        dbo.org
WHERE     (sectorid = @sectionid)
Return
END
