CREATE TABLE [dbo].[agentStatus] (
    [name] VARCHAR(50) NULL,
    [status]  INT IDENTITY (1,1) not NULL, 
    CONSTRAINT [PK_agentStatus] PRIMARY KEY ([status])
);

