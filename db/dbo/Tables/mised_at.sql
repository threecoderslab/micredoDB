CREATE TABLE [dbo].[mised_at]
(
	[Id] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [orgid] INT NULL, 
    [rec_date] DATETIME NOT NULL DEFAULT getdate(), 
    CONSTRAINT [FK_mised_at_ToTable] FOREIGN KEY ([orgid]) REFERENCES [org]([id])
)
