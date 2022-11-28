
CREATE PROCEDURE [dbo].[AddClientControlvalueSession]
	@sessionid  VARCHAR(50) ,
	@value nVARCHAR(max),
	@conrolid int
AS
	Declare @sid as int
	set @sid= (SELECT id from [dbo].[Sessions] where sessionid=@sessionid)
	INSERT INTO [dbo].[session_client_data]
           ([sessionid]
           ,[controlid]
           ,[value])
     select
          @sid,

          @conrolid,
          @value




