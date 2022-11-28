CREATE procedure AddClientControl
(
	@ItemName nvarchar(100),
	@ItemEname nvarchar(100),
	@Pattern nvarchar(50),
	@TypeId int,
	@AgentId int

)
AS
BEGIN
	
	Declare @Id int;
	SELECT @Id = org FROM [dbo].[agent] WHERE id = @AgentId

	INSERT INTO [dbo].[Client_control](Item_name, Item_ename, [type_id], pattern)
				VALUES (@ItemName, @ItemEname, @TypeId, @Pattern)
	INSERT INTO [dbo].[Client_front_control]
	SELECT SCOPE_IDENTITY(), @Id

END
