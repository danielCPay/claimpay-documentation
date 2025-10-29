SELECT p.profilename, t.tablabel, a.actionname, 1-permission AS has_access, pu.*
FROM vtiger_profile2utility pu 
  JOIN vtiger_profile p on ( pu.profileid = p.profileid )
  JOIN vtiger_tab t ON (pu.tabid = t.tabid )
  JOIN vtiger_actionmapping a ON (a.actionid = pu.activityid )
WHERE p.profilename LIKE '%' 
  AND t.tablabel LIKE '%'  
ORDER BY 1, 2, pu.tabid, 3, 4  
;