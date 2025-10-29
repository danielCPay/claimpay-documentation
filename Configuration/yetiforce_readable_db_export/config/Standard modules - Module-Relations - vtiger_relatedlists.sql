SELECT t.tablabel AS module, rt.tablabel AS related_module, v.name AS relation_type, v.presence AS is_hidden, actions, view_type, v.field_name AS relation_field_name, 
  ( SELECT GROUP_CONCAT(fieldname ORDER BY rf.sequence)  
    FROM vtiger_relatedlists_fields rf
	   JOIN vtiger_field f ON ( f.fieldid = rf.fieldid )
	 WHERE rf.relation_id = v.relation_id 
	 ) AS fields_in_table,
  v.*
FROM vtiger_relatedlists v
  JOIN vtiger_tab t ON (t.tabid = v.tabid )
  JOIN vtiger_tab rt ON (rt.tabid = v.related_tabid )
WHERE t.tablabel LIKE '%' 
  AND rt.tablabel LIKE '%'
ORDER BY 1, SEQUENCE, 2, 3, 4  
;
