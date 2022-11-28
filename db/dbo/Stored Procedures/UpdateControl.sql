CREATE PROCEDURE [dbo].[UpdateControl]
(
	@Id int,
	@ItemName nvarchar(50),
	@ItemEname nvarchar(50),
	@Pattern nvarchar(50),
	@TypeId int,
	@Length int
)
AS
UPDATE [dbo].[Client_control]
   SET [Item_name] = @ItemName
      ,[Item_ename] = @ItemEname
      ,[type_id] = @TypeId
      ,[length] = @Length
      ,[pattern] = @Pattern
 WHERE Item_id = @Id