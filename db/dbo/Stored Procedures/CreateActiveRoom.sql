/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE CreateActiveRoom(@RoomId varchar(150), @RoomName varchar(150), @AgentId int)
AS
  INSERT INTO [ActiveRooms] (Roomid, RoomName, agentid) VALUES (@RoomId, @RoomName,@AgentId)