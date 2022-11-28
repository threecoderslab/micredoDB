CREATE PROCEDURE [dbo].[GetAgentById]
	@agentId int
AS
	BEGIN
SELECT  A.id AS Id, A.[name] AS [Name], [login] AS [Login], A.email AS Email, AGS.[name] AS [Status]
		FROM agent A
		JOIN agentStatus AGS ON A.access = AGS.[status]
		WHERE A.access = 1
		AND A.id = @agentId
END
