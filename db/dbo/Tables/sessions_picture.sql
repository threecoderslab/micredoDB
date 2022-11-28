CREATE TABLE [dbo].[sessions_picture]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [sesskionid] int NULL, 
    [link] VARCHAR(150) NULL, 
    [doctype] VARCHAR(50) NULL, 
    [size] DECIMAL(18, 2) NULL, 
    [date] DATETIME NULL DEFAULT getdate(), 
    [client_agent] INT NULL DEFAULT 0, 
    [docname] VARCHAR(50) NULL, 
    [scshot] INT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_sessions_picture_ToTable] FOREIGN KEY ([sesskionid]) REFERENCES [Sessions]([id])
)
