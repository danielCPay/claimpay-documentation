SELECT t.tablabel, b.dashboard_id, dn.name AS dashboard_name, b.id as block_id, r.rolename, l.linklabel, d.*, b.*
FROM vtiger_module_dashboard_blocks b
	JOIN vtiger_module_dashboard d ON (d.blockid = b.id)
	JOIN vtiger_tab t ON (t.tabid = b.tabid)
	JOIN vtiger_role r ON (r.roleid = b.authorized)
	JOIN u_yf_dashboard_type dn ON (dn.dashboard_id = b.dashboard_id)
	JOIN vtiger_links l ON (l.linkid = d.linkid)
ORDER BY 1, 2, 3, 4, 5, d.id
;
