CREATE TABLE [dbo].[agent_access] (
    [name] NVARCHAR (50) NULL,
    [id]   INT  IDENTITY (1,1)         NOT NULL,
    CONSTRAINT [PK_agent_access] PRIMARY KEY CLUSTERED ([id] ASC)
);

