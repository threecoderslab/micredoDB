CREATE PROCEDURE [dbo].[AddAgentCommentTOSession] (
	@sessionid VARCHAR(50),
	@comment nvarchar(max),
	@agid as int
	)
AS
Declare @sid as int
	set @sid= (SELECT id from [dbo].[Sessions] where sessionid=@sessionid)
	insert into [dbo].[SessionComments] ([agentid] ,   [comment] ,  [sessionid]) select  @agid,@comment,@sid