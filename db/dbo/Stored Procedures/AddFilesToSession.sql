CREATE PROCEDURE [dbo].[AddFilesToSession]
	@sessionid  VARCHAR(50) ,
	@link VARCHAR(150),
	@doctype VARCHAR(50) , 
    @size DECIMAL(18, 2) , 
    @client_agent INT = 0,/*agent 0*/ 
    @docname VARCHAR(50) ,
    @scshot int=0   /* ascrenshot 1*/
AS
	Declare @sid as int
	set @sid= (SELECT id from [dbo].[Sessions] where sessionid=@sessionid)
	Insert into [dbo].[sessions_picture]
(
	
    [sesskionid] , 
    [link], 
    [doctype] , 
    [size] , 
    [client_agent]  ,
    [docname] ,
    scshot)
    select 
    @sid,
    @link,
    @doctype,
    @size,
    @client_agent,
    @docname,
    @scshot




