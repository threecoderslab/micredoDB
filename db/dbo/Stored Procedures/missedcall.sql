CREATE PROCEDURE [dbo].[missedcall]
	@orgid int
AS
	INSERT [dbo].[mised_at] ([orgid]) select @orgid

