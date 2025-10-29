SELECT p.profilename, t.tablabel, case ps.operation when 0 then 'View' when 1 then 'Edit' when 2 then 'Delete' when 7 then 'Create' ELSE ps.operation END AS operation_name, 1-ps.permissions AS has_access, ps.*
FROM vtiger_profile2standardpermissions ps
  JOIN vtiger_profile p on ( ps.profileid = p.profileid )
  JOIN vtiger_tab t ON (ps.tabid = t.tabid )
  JOIN vtiger_profile2tab pt ON ( pt.profileid = p.profileid AND pt.tabid = t.tabid )
WHERE pt.permissions = 0
	AND p.profilename LIKE '%' 
	AND t.tablabel LIKE '%'
	AND ps.operation NOT IN (3, 4)
ORDER BY 1, 2, operation, 3, 4, 5, 6, 7, 8
;
