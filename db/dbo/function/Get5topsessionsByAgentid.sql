Create FUNCTION [dbo].[Get5topsessionsByAgentid]
(
	@agentid int
)
RETURNS nvarchar(max)
AS
BEGIN
declare @json nvarchar(max)
set @json =(
SELECT top 5   ss.sessionid, ss.startdate, ss.enddate, ss.duration,  ss.videoLink,
(select [comment] from SessionComments as sc where sc.sessionid=ss.id) comments,
(SELECT     link, doctype, client_agent, docname, size, date, scshot
FROM        dbo.sessions_picture sp
WHERE     (sp.sesskionid = ss.id) FOR JSON Auto,INCLUDE_NULL_VALUES ) as files,
(SELECT     user_data.value, user_data.controlid, dbo.Client_control.Item_name 
FROM        dbo.session_client_data as user_data INNER JOIN
                  dbo.Client_control ON user_data.controlid = dbo.Client_control.Item_id
WHERE     (user_data.sessionid = ss.id ) FOR JSON path,INCLUDE_NULL_VALUES ) user_data
FROM        dbo.Sessions ss 
WHERE     (ss.agentid = @agentid)
order by ss.startdate desc


for json auto,INCLUDE_NULL_VALUES)




	RETURN @json
END