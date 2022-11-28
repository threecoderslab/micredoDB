CREATE PROCEDURE [dbo].[GetControlsByAgentId] (@agentId int)

AS 
 
DECLARE @orgId int = (SELECT org FROM agent WHERE id = @agentId) 
 
SELECT  
 oc.control_id AS ControlId, 
 params.Item_name AS ItemName, 
 params.Item_ename AS ItemEname, 
 input_type.[type_name] AS TypeName, 
 params.length AS [Length], 
 params.pattern AS Pattern 
 FROM [dbo].[Client_front_control] oc 
 JOIN [dbo].[Client_control] params on oc.control_id=params.Item_id 
 JOIN [dbo].[Client_control_types] input_type on input_type.id=params.[type_id] 
    WHERE oc.org_id=@orgId