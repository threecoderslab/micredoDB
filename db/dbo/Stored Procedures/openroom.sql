Create procedure AddRoom
(@Roomid varchar(150),
@RoomName varchar(150) =NULL,
@agentid int,
@sessionid nvarchar(max)
)
as
declare @counter as int
set @counter=(select count(*) from [dbo].[ActiveRooms] where [agentid]=@agentid)
if @counter=0
begin
INSERT INTO [dbo].[ActiveRooms]
           ([Roomid]
           ,[RoomName]
           ,[agentid]
           ,[sessionid]
         )
    
select @Roomid,@RoomName,@agentid,@sessionid

exec [dbo].[Log_data] @agentid,3
return 0

end
else
begin
return @counter
end