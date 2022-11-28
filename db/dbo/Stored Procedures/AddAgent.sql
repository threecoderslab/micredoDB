
CREATE PROCEDURE [dbo].[AddAgent](
	@Name nvarchar(50),
	@Login nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(100),
	@OrganizationId int,
	@Access int = 1
)
AS 
BEGIN
	INSERT INTO agent([name], [login], pass, access, org, email, [status])
	VALUES(@Name, @Login, @Password, @Access, @OrganizationId, @Email, 0)
END
