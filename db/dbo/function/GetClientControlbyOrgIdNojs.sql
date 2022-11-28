CREATE FUNCTION [dbo].[GetClientControlbyOrgIdNojs]
(
	@orgid int
)
RETURNS TABLE AS RETURN
(
	select ar.[Roomid],ar.[RoomName],ar.[sessionid]
 FROM        dbo.ActiveRooms ar INNER JOIN
                  dbo.agent ON ar.agentid = dbo.agent.id 
                
where dbo.agent.org=@orgid and busy=0
)
