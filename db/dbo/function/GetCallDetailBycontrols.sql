CREATE FUNCTION [dbo].[GetCallDetailBycontrols]

(
	@json as nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN

Declare @resp as nvarchar(max)
Declare @inp as table
(controlid int,
[value]  nvarchar(400))

insert into @inp
select k.*  from OPENJSON (@json)
 WITH (
      passp NVARCHAR(MAX) '$.data' AS JSON
	  ) a
outer apply openjson (passp)
with (controlid int '$.controlid',
[value]  nvarchar(400) '$.value') k





set @resp=(
SELECT    ss.sessionid, ss.startdate, ss.enddate, ss.duration,  ss.videoLink,
(select [comment] from SessionComments as sc where sc.sessionid=ss.id) comments,
(SELECT     link, doctype, client_agent, docname, size, date, scshot
FROM        dbo.sessions_picture sp
WHERE     (sp.sesskionid = ss.id) FOR JSON Auto, INCLUDE_NULL_VALUES ) as files,
(SELECT     user_data.value, user_data.controlid, dbo.Client_control.Item_name 
FROM        dbo.session_client_data as user_data INNER JOIN
   @inp d ON user_data.controlid = d.controlid and user_data.value=d.[value] INNER JOIN
                  dbo.Client_control ON d.controlid = dbo.Client_control.Item_id
WHERE     (user_data.sessionid = ss.id ) FOR JSON path , INCLUDE_NULL_VALUES ) user_data
FROM        dbo.Sessions ss join
(SELECT    user_data.sessionid
FROM        dbo.session_client_data as user_data INNER JOIN
   @inp d ON user_data.controlid = d.controlid and user_data.value=d.[value] INNER JOIN
                  dbo.Client_control ON d.controlid = dbo.Client_control.Item_id
 ) search_data on ss.id=search_data.sessionid
--WHERE     (ss.agentid = 1)
order by ss.startdate desc
for json path ,  ROOT('info'),  INCLUDE_NULL_VALUES )


	RETURN @resp
END
