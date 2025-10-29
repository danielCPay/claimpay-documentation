select vtiger_tab.name AS module_name, vtiger_field.columnname, vtiger_field.fieldlabel, vtiger_blocks.blocklabel, concat(nvl(ft.fieldtype, ''), '(', vtiger_field.uitype, ')') AS fieldtype, vtiger_field.*
from vtiger_field
	JOIN vtiger_tab ON (vtiger_tab.tabid = vtiger_field.tabid )
	JOIN vtiger_blocks ON (vtiger_blocks.blockid = vtiger_field.block)
	LEFT OUTER JOIN vtiger_ws_fieldtype ft ON (ft.uitype = vtiger_field.uitype)
WHERE vtiger_tab.name LIKE '%%'
ORDER BY 1, 2, 3, 4, 5
;
