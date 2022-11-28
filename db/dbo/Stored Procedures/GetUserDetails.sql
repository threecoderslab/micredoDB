
CREATE   PROCEDURE [dbo].[GetUserDetails] (@username nvarchar(150), @password nvarchar(150))
AS
IF EXISTS (SELECT id AS Id FROM [dbo].[agent] WHERE [login] = @username AND [pass] = @password AND access = 1)
SELECT A.[id] AS Id,
       A.[name] AS [Name],
	   A.[login] AS [UserName],
       A.[org] AS OrganizationId,
	   O.[name] AS Organization,
       A.[Roomname] AS RoomName
  FROM [dbo].[agent] A
  JOIN org O ON O.id = A.org
  WHERE A.[login] = @username AND A.[pass] = @password