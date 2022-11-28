CREATE TABLE [dbo].[Client_front_control] (
    [control_id] INT NULL,
    [org_id]     INT NULL,
    CONSTRAINT [FK_Client_front_control_Client_control] FOREIGN KEY ([control_id]) REFERENCES [dbo].[Client_control] ([Item_id]),
    CONSTRAINT [FK_Client_front_control_org] FOREIGN KEY ([org_id]) REFERENCES [dbo].[org] ([id])
);

