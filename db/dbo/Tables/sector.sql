CREATE TABLE [dbo].[sector] (
    [name]  NVARCHAR (50) NULL,
    [id]     int IDENTITY(1,1) NOT NULL,
    [ename] NVARCHAR (50) NULL,
    [pict]  VARCHAR (50)  NULL,
    CONSTRAINT [PK_sector] PRIMARY KEY CLUSTERED ([id] ASC)
);

