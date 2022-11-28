CREATE FUNCTION [dbo].[GetActiveRoomBOrgId]
(
	@orgid int
)
RETURNS nvarchar(max)
AS
BEGIN
declare @json as nvarchar(max)
declare @Roomid varchar(150)='0',@RoomName varchar(150)='0',@sessionid nvarchar(max)='0', @agid as int
select top (1) @Roomid=ar.[Roomid],@RoomName=ar.[RoomName],@sessionid=ar.[sessionid],@agid=ar.agentid
 FROM        dbo.ActiveRooms ar INNER JOIN
                  dbo.agent ON ar.agentid = dbo.agent.id 
                
where dbo.agent.org=@orgid and busy=0
order by ar.id asc
set @json=(select * from (select @Roomid as Roomid , @RoomName as RoomName,@sessionid  sessionid,@agid as agentid) j FOR JSON AUTO,WITHOUT_ARRAY_WRAPPER)

return @json

END
