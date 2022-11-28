CREATE PROCEDURE [dbo].[endcall]
	@agentid int ,
	@sessionid varchar(150)
AS
	update [dbo].[Sessions] set status=2, enddate=getdate()
	where agentid=@agentid and sessionid=@sessionid

	 exec Log_data @agentid,4
	 exec RemoveRoom @agentid,0
	 
