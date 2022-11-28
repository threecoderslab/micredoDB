CREATE TABLE [dbo].[org_details]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [org_id] INT NULL, 
    [warningCl] NVARCHAR(MAX) NULL, 
    CONSTRAINT [FK_org_details_ToTable] FOREIGN KEY ([org_id]) REFERENCES [org]([id])
)
