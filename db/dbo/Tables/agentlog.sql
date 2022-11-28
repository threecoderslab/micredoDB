CREATE TABLE [dbo].[agentlog]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [agid] INT NULL, 
    [startdate] DATETIME NOT NULL DEFAULT getdate(), 
    [oper_type] INT NOT NULL, 
    CONSTRAINT [FK_agentlog_ToTable] FOREIGN KEY ([oper_type]) REFERENCES [agent_operation]([Id]) 
   
)
