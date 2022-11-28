Create procedure RemoveRoom
(@agentid int,
@option int)
as
if @option=0
begin
DELETE FROM [dbo].[ActiveRooms]
      WHERE [agentid]=@agentid and busy=@option
        exec Log_data @agentid,5
      end
      if @option=1 
      begin
      DELETE FROM [dbo].[ActiveRooms]
      WHERE [agentid]=@agentid 
       exec Log_data @agentid,6
      end