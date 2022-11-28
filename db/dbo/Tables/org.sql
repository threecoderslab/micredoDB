CREATE TABLE [dbo].[org] (
    [name]     NVARCHAR (50) NULL,
    [id]       int IDENTITY(1,1) NOT NULL      ,
    [sectorid] INT           NULL,
    [logo]     NVARCHAR (50) NULL,
    [rate] INT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_org] PRIMARY KEY CLUSTERED ([id] ASC)
);

