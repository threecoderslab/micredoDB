CREATE TABLE [dbo].[Client_control] (
    [Item_name]  NVARCHAR (50) NULL,
    [Item_id]    int IDENTITY(1,1) NOT NULL,
    [Item_ename] NVARCHAR (50) NULL,
    [type_id]    INT           NULL,
    [length] INT NULL DEFAULT 1, 
    [pattern] VARCHAR(50) NULL, 
    CONSTRAINT [PK_Client_control] PRIMARY KEY CLUSTERED ([Item_id] ASC),
    CONSTRAINT [FK_Client_control_Client_control_types] FOREIGN KEY ([type_id]) REFERENCES [dbo].[Client_control_types] ([id])
);

