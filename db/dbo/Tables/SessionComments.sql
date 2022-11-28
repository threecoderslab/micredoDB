CREATE TABLE [dbo].[SessionComments]
(
	[Id] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [agentid] INT NULL, 
    [comment] NVARCHAR(MAX) NULL, 
    [sessionid] INT NULL, 
    [Resolution] INT NULL, 
    [date] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [FK_SessionComments_ToTable] FOREIGN KEY ([sessionid]) REFERENCES [dbo].[Sessions]([id]), 
   
)
