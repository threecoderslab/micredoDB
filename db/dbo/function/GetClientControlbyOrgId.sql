CREATE FUNCTION [dbo].[GetClientControlbyOrgId]
(
	@orgid as int
)
RETURNS Nvarchar(max)
as
begin
Declare @json as nvarchar(max)
set @json=(select oc.control_id,input_type.type_name ,params.Item_ename,params.Item_name,params.length, params.pattern  from
[dbo].[Client_front_control] oc
join [dbo].[Client_control] params on oc.control_id=params.Item_id
join [dbo].[Client_control_types] input_type on input_type.id=params.type_id
where oc.org_id=@orgid
for JSON Auto)

return @json
end

