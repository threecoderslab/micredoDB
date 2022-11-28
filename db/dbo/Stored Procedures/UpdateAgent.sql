CREATE PROCEDURE [dbo].[UpdateAgent]
	@Id int,
	@Name nvarchar(50),
	@Login nvarchar(50),
	@Email nvarchar(100),
	@Password nvarchar(100)
AS
BEGIN
	UPDATE agent SET [name] = @Name, [login] = @Login, email = @Email, pass = @Password WHERE id = @Id
END
