SELECT t.name AS module, tt.*, ttd.*
FROM vtiger_trees_templates tt
  JOIN vtiger_trees_templates_data ttd ON (ttd.templateid = tt.templateid )
  JOIN vtiger_tab t ON (t.tabid = tt.module )
WHERE t.name LIKE '%' 
ORDER BY 1, 2, 3, 4, 5, 6, 7, 8, 9  
;
