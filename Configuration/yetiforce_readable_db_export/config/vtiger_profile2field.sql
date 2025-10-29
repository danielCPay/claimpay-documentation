SELECT p.profilename, t.tablabel, f.fieldlabel, 1-pf.visible as is_visible, pf.readonly as is_readonly, pf.* 
FROM vtiger_profile2field pf
	JOIN vtiger_profile p ON (p.profileid = pf.profileid)
	JOIN vtiger_tab t ON (t.tabid = pf.tabid)
	JOIN vtiger_field f ON (f.fieldid = pf.fieldid)
WHERE tablabel LIKE '%'
	AND fieldlabel LIKE '%%'
ORDER BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
;
