DROP TABLE rep_history_statuses;
CREATE TABLE rep_history_statuses (
	snapshot_date      DATE,
	status_area        VARCHAR(255),
	status_value       VARCHAR(255),
	number_of_elements INT,
	PRIMARY KEY (snapshot_date, status_area, status_value)
	) ENGINE=INNODB
;

