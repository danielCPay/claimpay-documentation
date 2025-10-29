DROP PROCEDURE IF EXISTS getFilterConditions;

DELIMITER $$
CREATE PROCEDURE getFilterConditions(IN cvid_in INT UNSIGNED, IN group_id_in INT UNSIGNED, OUT filter_text_out TEXT)
BEGIN
	DECLARE subgroup_text TEXT;
   SET max_sp_recursion_depth=50;
   SET filter_text_out = '';
	FOR rec IN ( 
			SELECT *
			FROM (
			  		SELECT group_id, c.`index` AS seq, id as filter_id, null as subgroup_id, concat(source_field_name, '.', field_name, ' ', operator, ' ''', VALUE, '''') AS filter_text 
					FROM u_yf_cv_condition c
					UNION ALL
			  		SELECT parent_id, g.index, null, id, g.condition AS filter_text 
					FROM u_yf_cv_condition_group g
					ORDER BY seq
					) f
				JOIN u_yf_cv_condition_group g ON ( id = group_id )
			WHERE ( cvid_in IS NOT NULL     AND parent_id = 0 AND cvid = cvid_in )
				OR ( group_id_in IS NOT NULL AND f.group_id = group_id_in )
			) DO
		IF rec.subgroup_id IS NULL THEN
			SET filter_text_out = CONCAT( case when filter_text_out <> '' then CONCAT(filter_text_out, ', ') ELSE '' END, '"', rec.condition, ' ', rec.filter_text, '"');
		ELSE 
			CALL getFilterConditions( NULL, rec.subgroup_id, subgroup_text );
			SET filter_text_out = CONCAT( case when filter_text_out <> '' then CONCAT(filter_text_out, ', ') ELSE '' END, '"', rec.condition, '": [ ', subgroup_text, ' ], ');
		END IF;
	END FOR;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS getFilterConditions;
DELIMITER $$
CREATE FUNCTION getFilterConditions(cvid_in INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE res TEXT;
    CALL getFilterConditions(cvid_in, NULL, res);
    RETURN res;
END$$
DELIMITER ;





DROP PROCEDURE select_all_picklist_values;

DELIMITER $$
CREATE PROCEDURE select_all_picklist_values()
	NOT DETERMINISTIC
	SQL SECURITY DEFINER
BEGIN
   SELECT CONCAT(
			GROUP_CONCAT(
				CONCAT('SELECT ''', p.name, ''' AS picklist_name, ', p.name, ' AS picklist_value_name, sortorderid FROM vtiger_', p.name, ' q WHERE presence = 1') 
				SEPARATOR ' \nUNION ALL ') 
			, '\nORDER BY picklist_name, sortorderid, picklist_value_name') AS q
		INTO @sql_picklists
	FROM ( SELECT DISTINCT fieldname AS name FROM vtiger_field where uitype IN (15, 16, 33, 115) ) p
   #WHERE p.name NOT IN ('faqstatus', 'ticketpriorities', 'ticketseverities', 'ticketstatus')
   ORDER BY 1
	;
   PREPARE stmt FROM @sql_picklists;
   EXECUTE stmt;
   DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;
