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
	d.*, e.modifiedtime AS last_change_date
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
SELECT e.crmid AS insurance_company, e.createdtime,
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

CREATE OR REPLACE VIEW vw_collections
AS 
SELECT e.crmid AS collection, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_collections NATURAL JOIN u_yf_collectionscf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.collectionsid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_cases
AS 
SELECT e.crmid AS "case", e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_cases NATURAL JOIN u_yf_casescf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.casesid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_outsidecases
AS 
SELECT e.crmid AS outside_case, e.createdtime,
	d.*
FROM (
		SELECT *
		FROM u_yf_outsidecases NATURAL JOIN u_yf_outsidecasescf
		) d
	JOIN vtiger_crmentity e ON ( e.crmid = d.outsidecasesid )
WHERE e.deleted = 0
;

CREATE OR REPLACE VIEW vw_users AS
SELECT id AS user_id, first_name, last_name, CONCAT(first_name, ' ', last_name) AS user_full_name
FROM vtiger_users
;



CREATE OR REPLACE VIEW vw_current_statuses AS
SELECT 'Onboarding Status' AS status_area, onboarding_status AS status_value, COUNT(*) AS number_of_elements
FROM vw_claims
GROUP BY onboarding_status
UNION ALL 
SELECT 'Claim Status', claim_status, COUNT(*)
FROM vw_claims
GROUP BY claim_status
UNION ALL 
SELECT 'Provider Status', provider_status, COUNT(*)
FROM vw_providers
GROUP BY provider_status
UNION ALL 
SELECT 'Portfolio Status', portfolio_status, COUNT(*)
FROM vw_portfolios
GROUP BY portfolio_status
UNION ALL 
SELECT 'Portfolio Purchase Status', portfolio_purchase_status, COUNT(*)
FROM vw_portfolio_purchases
GROUP BY portfolio_purchase_status
UNION ALL 
SELECT 'Portfolio Purchases', 'Sent for Signature', COUNT(*)
FROM vw_portfolio_purchases
WHERE DATE(sent_be_signed_date) = DATE(ADDDATE(CURDATE(), -1))
UNION ALL 
SELECT 'Portfolio Purchases', 'Signed/Purchased', COUNT(*)
FROM vw_portfolio_purchases
WHERE DATE(purchase_date) = DATE(ADDDATE(CURDATE(), -1))
;

