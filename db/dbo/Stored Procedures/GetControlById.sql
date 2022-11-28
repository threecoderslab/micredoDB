CREATE PROCEDURE [dbo].[GetControlById](@Id int)
AS
SELECT [Item_name] AS ItemName
      ,[Item_id] AS ControlId
      ,[Item_ename] AS ItemEname
      ,[type_id] AS TypeId
      ,[length] AS [Length]
      ,[pattern] AS Pattern
  FROM [Micred].[dbo].[Client_control] WHERE Item_id = @Id