SELECT p.profilename, t.tablabel, 1-permissions AS has_access, pt.*
FROM vtiger_profile2tab pt
  JOIN vtiger_profile p on ( pt.profileid = p.profileid )
  JOIN vtiger_tab t ON (pt.tabid = t.tabid )
WHERE p.profilename LIKE '%' 
  AND t.tablabel LIKE '%'
ORDER BY 1, 2, 3, 4, 5, 6
;
