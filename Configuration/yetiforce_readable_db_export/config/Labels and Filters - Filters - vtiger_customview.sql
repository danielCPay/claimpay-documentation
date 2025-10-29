SELECT entitytype AS module, cv.cvid, viewname, setdefault AS is_default, privileges as is_editable, setmetrics AS is_for_widgets, sequence, u.user_name AS created_by,
	sort, getFilterConditions(cv.cvid) AS filter, cvc.columns_list,
	cv.* 
FROM vtiger_customview cv
	LEFT OUTER JOIN vtiger_users u ON ( u.id = cv.userid )
	JOIN (
		SELECT cl.cvid, GROUP_CONCAT( CONCAT( CASE WHEN ifnull(cl.source_field_name, '') = '' THEN '' ELSE CONCAT(cl.source_field_name, '.') END, cl.field_name ) ORDER BY cl.columnindex SEPARATOR ', ' ) AS columns_list
		FROM vtiger_cvcolumnlist cl
		GROUP BY cl.cvid
		) cvc	ON (cvc.cvid = cv.cvid)
WHERE cv.viewname LIKE '%'
ORDER BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
;
