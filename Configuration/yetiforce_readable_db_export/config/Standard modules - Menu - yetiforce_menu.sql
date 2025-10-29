WITH RECURSIVE menu  AS (
 		SELECT CAST(id AS CHAR(100))  as path, 
 			CAST(CONCAT(lpad(m.SEQUENCE, 3, 0), '-', ifnull(replace(m.label, 'MEN_VIRTUAL_DESK', 'Virtual desk'), t.tablabel)) AS CHAR(10000))  as path_label, 
 			CAST(ifnull(replace(m.label, 'MEN_VIRTUAL_DESK', 'Virtual desk'), t.tablabel) AS CHAR(10000))  as menu_path, 
			t.name AS module_name, m.* 
		FROM yetiforce_menu m 
   		left outer JOIN vtiger_tab t ON ( t.tabid = m.module )
		WHERE parentid = 0
	UNION 
   	SELECT CONCAT(menu.path, ',', m.id) AS path, 
 			concat(menu.path_label, ' > ', lpad(m.SEQUENCE, 3, 0), '-', ifnull(case when length(m.label) > 0 then  m.label else t.tablabel end, '') )  as path_label, 
 			concat(menu.menu_path, ' > ', ifnull(case when length(m.label) > 0 then  m.label else t.tablabel end, '') )  as menu_path, 
			t.tablabel AS module_name, m.*
   	FROM yetiforce_menu m
   		left outer JOIN vtiger_tab t ON ( t.tabid = m.module )
   		JOIN menu 
				ON menu.id = m.parentid AND not FIND_IN_SET(m.id, menu.path)
) 
SELECT * FROM menu ORDER BY path_label, path;
