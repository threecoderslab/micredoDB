CREATE FUNCTION [dbo].[GetSessionDatabyControls]
(
	@injson as  nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
declare @json as nvarchar(max)
set @json =(


SELECT    ss.sessionid, ss.startdate, ss.enddate, ss.duration,  ss.videoLink,
(select [comment] from SessionComments as sc where sc.sessionid=ss.id) comments,
(SELECT     link, doctype, client_agent, docname, size, date, scshot
FROM        dbo.sessions_picture sp
WHERE     (sp.sesskionid = ss.id) FOR JSON Auto,INCLUDE_NULL_VALUES ) as files,
(SELECT     user_data.value, user_data.controlid, dbo.Client_control.Item_name 
FROM        dbo.session_client_data as user_data INNER JOIN
                  dbo.Client_control ON user_data.controlid = dbo.Client_control.Item_id
WHERE     (user_data.sessionid = ss.id ) FOR JSON path,INCLUDE_NULL_VALUES ) user_data
FROM        dbo.Sessions ss   

join  dbo.session_client_data as user_data on user_data.sessionid = ss.id 
 join
(
select * from OPENJSON (@injson)
 WITH ( controlid   varchar(200) '$.control_id'
										,[value] nvarchar(200) '$.item_name' )) ktmp 

on user_data.controlid=ktmp.controlid and user_data.value=ktmp.[value]


order by ss.startdate desc
for json auto,INCLUDE_NULL_VALUES)
return @json
end