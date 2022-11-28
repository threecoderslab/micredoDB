CREATE FUNCTION [dbo].[checklogin]
(
	@login nvarchar(max),
	@pas nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN

declare @json nvarchar(max), @log as varchar(40), @Result as varchar(40),@passchek as varchar(40), 
	@agentid int=0, @acces int=0, @status int=0, @actroom as int=0, @avtiveroom as varchar(150)
if exists (select * from [dbo].[agent] where [login]=@login) 
begin 
set @log='ok' 

	if exists (select * from [dbo].[agent] where [pass]=@pas and [login]=@login) 
	begin
		set @passchek='ok'
		set @Result='ok'

		select @agentid=id,@acces=[access],@status=[status] from [dbo].[agent] where [pass]=@pas and [login]=@login
			set @actroom =(SELECT count(*)
     
				FROM [dbo].[ActiveRooms] where [agentid]=[agentid])
			
			if @actroom>0
			begin
			set @avtiveroom=(SELECT top 1 [Roomid]
     
				FROM [dbo].[ActiveRooms] where [agentid]=[agentid] )
			end
			if @actroom=0
			begin
			set @avtiveroom='0'
			end
	end
	else
	begin
		set @passchek='False'
		set @Result='Failed'
	end
	
end
else 
begin
set @log='False' 
set @Result='Failed'
set @Result='Failed'
set @passchek='False'
end

set @json=(select * from (select @Result as Result,@log as login_check,@passchek as pass_check,@agentid as agntid,@acces as access,@status as agstatus, @actroom as acttiveroom, @avtiveroom roomid) k FOR JSON AUTO,WITHOUT_ARRAY_WRAPPER)




	RETURN @json
END
