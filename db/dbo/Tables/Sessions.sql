

CREATE TABLE [dbo].[Sessions](
	[agentid] [int] NULL,
	[status] [int] NOT NULL DEFAULT 1,
	[id] int IDENTITY(1,1) NOT NULL,
	[videoLink] [nvarchar](250) NULL,
 [sessionid] VARCHAR(50) NULL, 
    [startdate] DATETIME NULL DEFAULT getdate(), 
	
    [enddate] DATETIME NULL, 
	[duration] as datediff(MINUTE,startdate,enddate),
    [video_size] DECIMAL(18, 2) NOT NULL DEFAULT 0, 
    CONSTRAINT [Pk_Sessions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    CONSTRAINT [FK_Sessions_ToTable] FOREIGN KEY ([status]) REFERENCES [sessionstatus]([Id])
) ON [PRIMARY]
