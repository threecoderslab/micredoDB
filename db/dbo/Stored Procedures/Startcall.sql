CREATE PROCEDURE [dbo].[Startcall]
	@sessionid varchar(50),
	@agid int
AS
	
	update ActiveRooms set busy=1 where sessionid=@sessionid
	
	
	

	INSERT INTO [dbo].[Sessions]
           (
           [agentid]
           ,[sessionid])
     select 
           
           @agid,
           @sessionid

           exec Log_data @agid,4
           
     

