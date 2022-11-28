CREATE TABLE [dbo].[session_client_data]
(
	[Id] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [sessionid] INT NULL, 
    [controlid] INT NULL, 
    [value] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_session_client_data_ToTable] FOREIGN KEY ([sessionid]) REFERENCES [Sessions]([id]), 
    CONSTRAINT [FK_session_client_data_ToTable_1] FOREIGN KEY ([controlid]) REFERENCES [Client_control]([Item_id])
)
