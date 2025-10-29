SELECT ts.tablabel, fs.fieldname, tt.tablabel, ft.fieldname, m.mappedid, m.type, m.source, m.target, m.default 
FROM a_yf_mapped_fields m
	join vtiger_field fs ON (fs.fieldid = m.source)
	JOIN vtiger_tab ts ON (ts.tabid = fs.tabid)
	join vtiger_field ft ON (ft.fieldid = m.target)
	JOIN vtiger_tab tt ON (tt.tabid = ft.tabid)
ORDER BY 1, 2, 3, 4;
