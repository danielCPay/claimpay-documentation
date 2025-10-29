SELECT t.name AS module, w.*
FROM s_yf_fields_dependency w
  JOIN vtiger_tab t ON (t.tabid = w.tabid )
WHERE t.name LIKE '%' 
ORDER BY 1, 2, 3, 4  
;