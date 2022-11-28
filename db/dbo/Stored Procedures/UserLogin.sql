CREATE   PROCEDURE UserLogin(@username nvarchar(150), @password nvarchar(150))
AS
	SELECT id AS Id FROM [dbo].[agent] WHERE [login] = @username AND [pass] = @password AND access = 1