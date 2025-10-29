CREATE OR REPLACE VIEW vw_activity_log AS 
SELECT 
  -- basic info 
	CONCAT(u.first_name, ' ', u.last_name) AS user_name, b.changedon AS changed_on, 
	case b.status 
		when 0 then 'Updated' when 1 then 'Deleted' when 2 then 'Created' when 3 then 'Activated' when 4 then 'Linked'
		when 6 then 'Unlinked' when 6 then 'Converted' when 7 then 'Displayed' when 8 then 'Archived' when 9 then 'Removed' 
		when 10 then 'Merged (edited)' when 11 then 'Merged (deleted)' when 12 then 'Merged (unlinked)' when 13 then 'Merged (linked)' 
		when 14 then 'Unhid' ELSE '???'
	 END AS operation,
	t.tablabel AS module_label, 
	( case tablabel 
		when 'Comments' then ( SELECT l.label FROM u_yf_crmentity_label l JOIN vtiger_modcomments c ON ( l.crmid = c.related_to ) WHERE c.modcommentsid = b.crmid )
		ELSE ( SELECT l.label FROM u_yf_crmentity_label l WHERE l.crmid = b.crmid ) 
	  END ) AS item_label, 
  -- details
	( case 
		when b.status = 4 then ( SELECT tl.tablabel FROM vtiger_tab tl JOIN vtiger_modtracker_relations r ON ( tl.name = r.targetmodule ) WHERE r.id = b.id )
		ELSE df.fieldlabel
		END ) AS field_label,
	( case 
		when b.status = 4 then (SELECT dl.label FROM u_yf_crmentity_label dl JOIN vtiger_modtracker_relations r ON ( dl.crmid = r.targetid ) WHERE r.id = b.id )
		when df.uitype IN (10) then (SELECT dl.label FROM u_yf_crmentity_label dl WHERE dl.crmid = d.postvalue ) 
		when df.uitype IN (52, 53) then (SELECT CONCAT(du.first_name, ' ', du.last_name) FROM vtiger_users du WHERE du.id = d.postvalue ) 
		ELSE postvalue 
	  END ) AS new_value,
  -- technical data
	b.crmid, b.id
	-- , b.*
	-- , u.*
FROM vtiger_modtracker_basic b
	JOIN vtiger_users u ON ( u.id = b.whodid )
	JOIN vtiger_tab t ON ( t.name = b.module )
	LEFT OUTER JOIN vtiger_modtracker_detail d ON ( d.id = b.id )
	LEFT OUTER JOIN vtiger_field df ON ( df.tabid = t.tabid AND df.fieldname = d.fieldname )
WHERE 1=1
	AND u.user_name NOT LIKE 'admin%' AND u.user_name <> '---'
 	AND NOT ( t.tablabel = 'Comments' AND df.fieldlabel NOT IN ( 'Comment', 'ReasonToEdit' ) )
	-- AND u.last_name = 'Gonzalez' AND u.first_name = 'Robert'
	-- AND u.last_name LIKE 'Flore%'
	-- AND module = 'Documents'
	-- AND DATE(changedon) = DATE('2023-5-29')
ORDER BY b.id
;
