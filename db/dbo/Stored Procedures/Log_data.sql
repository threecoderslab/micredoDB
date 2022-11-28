Create procedure Log_data
(@agid int,
@oper_type int
)
AS

INSERT INTO [dbo].[agentlog]
           ([agid]
          
           ,[oper_type])
    select @agid,@oper_type
