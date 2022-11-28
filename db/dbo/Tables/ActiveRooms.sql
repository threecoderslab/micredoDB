CREATE TABLE [dbo].[ActiveRooms] (
    [Roomid]   VARCHAR (150) NULL,
   id int IDENTITY(1,1) NOT NULL,
    [RoomName] VARCHAR (150) NULL,
    [agentid]  INT           NULL, 
    [sessionid] NVARCHAR(MAX) NULL, 
    [busy] INT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_ActiveRooms_ToAgennt] FOREIGN KEY (agentid) REFERENCES [agent]([id])
);

