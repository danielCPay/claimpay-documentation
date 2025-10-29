SELECT p.mod_name, p.documentpackagesid, p.document_package_name, p.package_type, p.result_file_name, dt.document_type AS result_document_type, 
	ps.sequence_number_or_name, ps.source_document AS source_document, e.setype, el.label, 
	'u_yf_documentpackages', p.*, 
	'u_yf_documentpackagesources', ps.*, 
	'u_yf_documenttypes', dt.* 
FROM ( 
		SELECT * 
		FROM u_yf_documentpackages JOIN u_yf_documentpackagescf USING (documentpackagesid)
		) p
	JOIN (
		SELECT * 
		FROM u_yf_documentpackagesources JOIN u_yf_documentpackagesourcescf USING (documentpackagesourcesid) 
		) ps ON (ps.document_package = p.documentpackagesid) 
	JOIN u_yf_documenttypes dt ON ( dt.documenttypesid = p.result_document_type )
	JOIN vtiger_crmentity e ON ( e.crmid = ps.source_document )
	JOIN u_yf_crmentity_label el ON ( el.crmid = ps.source_document )
ORDER BY 1, 2, 3, 4, 5, 6, 7
;
