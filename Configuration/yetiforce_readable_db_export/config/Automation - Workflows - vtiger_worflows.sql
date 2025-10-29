SELECT module_name, w.workflow_id, w.summary AS workflow_summary, 
  	case 
  		when execution_condition = 1 then 'ON_FIRST_SAVE'
  		when execution_condition = 2 then 'ONCE'
  		when execution_condition = 3 then 'ON_EVERY_SAVE'
  		when execution_condition = 4 then 'ON_MODIFY'
  		when execution_condition = 5 then 'ON_DELETE'
  		when execution_condition = 6 then 'ON_SCHEDULE'
  		when execution_condition = 7 then 'MANUAL'
  		when execution_condition = 8 then 'TRIGGER'
  		when execution_condition = 9 then 'BLOCK_EDIT'
  		when execution_condition = 10 then 'ON_RELATED'
  		else 'unknown' 
	end AS execution_condition_text, test, task_id, t.summary as task_summary, t.task, w.workflow_id, w.execution_condition, w.defaultworkflow, w.type, w.filtersavedinnew, w.schtypeid, w.schdayofmonth, w.schdayofweek, w.schannualdates, w.schtime, w.params
FROM com_vtiger_workflows w
	LEFT OUTER JOIN com_vtiger_workflowtasks t ON ( t.workflow_id = w.workflow_id)
ORDER BY 1, 2, 3, 4, 5, 6, 7;
