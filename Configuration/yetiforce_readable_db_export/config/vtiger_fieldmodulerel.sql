SELECT fm.relmodule, fm.module, f.columnname, fm.`status`, fm.sequence
from vtiger_fieldmodulerel fm
	JOIN vtiger_field f ON (f.fieldid = fm.fieldid )
ORDER BY 1, 2, 3, 4, 5
;
