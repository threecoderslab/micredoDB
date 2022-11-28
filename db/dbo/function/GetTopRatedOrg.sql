CREATE FUNCTION [dbo].[GetTopRatedOrg]
(
	)
RETURNS  TABLE

AS
Return
	
	SELECT top (3) name,logo,id from dbo.org where rate>0 order by rate desc
	
