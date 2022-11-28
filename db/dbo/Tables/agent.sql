CREATE TABLE [dbo].[agent] (
    [id]       int IDENTITY(1,1) NOT NULL,
    [name]     NVARCHAR (255) NULL,
    [login]    NVARCHAR (255) NULL,
    [pass]     NVARCHAR (255) NULL,
    [access]   INT            NULL,
    [org]      INT            NULL,
    [email]    NVARCHAR(50) NULL,
    [Roomname] NVARCHAR (255) NULL, 
    [status] INT NULL, 
    CONSTRAINT [PK_agent] PRIMARY KEY ([id]), 
    CONSTRAINT [FK_agent_ToTable] FOREIGN KEY ([status]) REFERENCES [agentStatus]([status]), 
    CONSTRAINT [FK_agent_ToTable_1] FOREIGN KEY ([access]) REFERENCES [agent_access]([id]), 
    CONSTRAINT [FK_agent_ToTable_2] FOREIGN KEY ([org]) REFERENCES [org]([id])
);

