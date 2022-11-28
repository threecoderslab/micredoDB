Create procedure AgentLogOut
(@agentid int
)
as

      begin
      DELETE FROM [dbo].[ActiveRooms]
      WHERE [agentid]=@agentid 
       exec Log_data @agentid,2
      end