/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[DeleteActiveRoom](@RoomId varchar(150), @RoomName varchar(150), @AgentId int)
AS
  DELETE FROM [ActiveRooms] WHERE Roomid = @RoomId AND RoomName = @RoomName AND agentid = @AgentId