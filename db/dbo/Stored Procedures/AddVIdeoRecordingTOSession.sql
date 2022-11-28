CREATE PROCEDURE [dbo].[AddVIdeoRecordingTOSession] (
	@sessionid VARCHAR(50),
	@videoLink nvarchar(250)
	)
AS
	update [dbo].[Sessions] set videoLink=@videoLink where sessionid=@sessionid 

