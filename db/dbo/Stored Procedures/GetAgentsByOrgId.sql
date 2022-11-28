CREATE PROCEDURE [dbo].[GetAgentsByOrgId] (@agent int)
AS

DECLARE @orgId int = (SELECT org FROM agent WHERE id = @agent)
SELECT  A.id AS Id, A.[name] AS [Name], [login] AS [Login], A.email AS Email, AGS.[name] AS [Status],
		A.org AS OrganizationId
		FROM agent A
		JOIN agentStatus AGS ON A.access = AGS.[status]
		JOIN org O ON O.id = A.org
		WHERE A.access = 1
		AND A.org = @orgId
