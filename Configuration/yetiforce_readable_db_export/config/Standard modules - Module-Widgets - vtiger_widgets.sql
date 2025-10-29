SELECT t.name AS module, w.*
FROM vtiger_widgets w
  JOIN vtiger_tab t ON (t.tabid = w.tabid )
WHERE t.name LIKE '%' 
ORDER BY 1, 2, 3, 4  
;