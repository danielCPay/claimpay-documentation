CREATE OR REPLACE VIEW vw_providers
AS 
SELECT e.crmid AS provider, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_providers NATURAL JOIN u_yf_providerscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.providersid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_portfolios
AS 
SELECT e.crmid AS portfolio, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_portfolios NATURAL JOIN u_yf_portfolioscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.portfoliosid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_portfolio_purchases
AS 
SELECT e.crmid AS portfolio_purchase, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_portfoliopurchases NATURAL JOIN u_yf_portfoliopurchasescf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.portfoliopurchasesid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_claims 
AS 
SELECT e.crmid AS claim, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_claims NATURAL JOIN u_yf_claimscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.claimsid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_claimedinvoices 
AS 
SELECT e.crmid AS claimedinvoice, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_claimedinvoices NATURAL JOIN u_yf_claimedinvoicescf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.claimedinvoicesid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_investors
AS 
SELECT e.crmid AS investor, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_investors NATURAL JOIN u_yf_investorscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.investorsid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_insurancecompanies
AS 
SELECT e.crmid AS insurancecompany, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_insurancecompanies NATURAL JOIN u_yf_insurancecompaniescf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.insurancecompaniesid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_insureds
AS 
SELECT e.crmid AS insured, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_insureds NATURAL JOIN u_yf_insuredscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.insuredsid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_claimcollections
AS 
SELECT e.crmid AS claimcollection, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_claimcollections NATURAL JOIN u_yf_claimcollectionscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.claimcollectionsid )
WHERE e.deleted = 0
;


CREATE OR REPLACE VIEW vw_users AS
SELECT id AS user_id, first_name, last_name, CONCAT(first_name, ' ', last_name) AS user_full_name
FROM vtiger_users
;


