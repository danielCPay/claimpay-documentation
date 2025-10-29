# Module: Claims

<a id="user-content-wf-91" href="#wf-91"></a>

## WF 91 - "ON_CREATE_DEFAULT_CLAIM_ID" (ON_FIRST_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **claim_id** is empty
  - **claim_id** is _(New)_

### Tasks:

- set default Claim ID

### Tasks with Details:

- set default Claim ID
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "claim_id": "number (fieldname)"
  },
  ```

<a id="user-content-wf-108" href="#wf-108"></a>

## WF 108 - "ON_CHANGE_CASE" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **case** has changed
  - **case** is not empty
- At least one:

### Tasks:

- set Claim.Basic Litigation Status := Case.Stage
- Document.Case = Document.Claim.Case

### Tasks with Details:

- set Claim.Basic Litigation Status := Case.Stage

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "basic_litigation_status": "'$(relatedRecord : case|stage|Cases)$' (expression)"
  },
  ```

- Document.Case = Document.Claim.Case
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "CHILD||Documents",
    "otherWorkflowId": "On change of Case in Claim Set Document.Case from Document.Claim.Case",
    "otherWorkflowField": "claim"
  },
  ```

<a id="user-content-wf-113" href="#wf-113"></a>

## WF 113 - "Start Underwriting" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** is _Pending Underwriting_

### Tasks:

- set Onboarding Status = In Underwriting, Assigned to=current user, Claim Underwriter=current user, Underwriting started time
- set Portfolios.Status = In Underwriting
- execute FIND_SIMILAR_CLAIMS
- execute FIND_RELATED_CASE

### Tasks with Details:

- set Onboarding Status = In Underwriting, Assigned to=current user, Claim Underwriter=current user, Underwriting started time

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "In Underwriting (rawtext)",
    "assigned_user_id": "fromUser-current (rawtext)",
    "claim_underwriter": "fromUser-current (rawtext)",
    "underwriting_started_time": "nvl(underwriting_started_time, get_datetime()) (expression)"
  },
  ```

- set Portfolios.Status = In Underwriting

  ```
  taskType: VTUpdateRelatedFieldTask, active: true
  taskTypeParameters: {
    "portfolio::Portfolios::portfolio_status": "if '$(relatedRecord : portfolio|portfolio_status|Portfolios)$' == 'New' then 'In Underwriting' else '$(relatedRecord : portfolio|portfolio_status|Portfolios)$' end (expression)"
  },
  ```

- execute FIND_SIMILAR_CLAIMS

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findSimilarClaims},
  ```

- execute FIND_RELATED_CASE
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findRelatedCase},
  ```

<a id="user-content-wf-114" href="#wf-114"></a>

## WF 114 - "Pending Approval" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** is _In Underwriting_
  - **onboarding_status** is _Approved_
  - **onboarding_status** is _Rejected_

### Tasks:

- set Onboarding Status = Pending Approval, Claim Status = empty, Assigned to = from group Claim Acceptants, Underwritten time
- CF findSimilarClaims
- CF findRelatedCase
- WF Portfolio.STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
- send a notification to Claim Acceptant role that claims in portfolio should be approved

### Tasks with Details:

- set Onboarding Status = Pending Approval, Claim Status = empty, Assigned to = from group Claim Acceptants, Underwritten time

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Pending Approval (rawtext)",
    "claim_status": "special-clear (rawtext)",
    "assigned_user_id": "fromUserGroup-Claim Acceptants (rawtext)",
    "claim_underwriter": "fromUser-current (rawtext)",
    "underwritten_time": "get_datetime() (expression)"
  },
  ```

- CF findSimilarClaims

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findSimilarClaims},
  ```

- CF findRelatedCase

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findRelatedCase},
  ```

- WF Portfolio.STOP_IF_MORE_CLAIMS_TO_UNDERWRITE

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Portfolios",
    "otherWorkflowId": "STOP_IF_MORE_CLAIMS_TO_UNDERWRITE",
    "otherWorkflowField": "portfolio"
  },
  ```

- send a notification to Claim Acceptant role that claims in portfolio should be approved
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claims in portfolio:  <a href="$(relatedRecord : portfolio|CrmDetailViewURL)$">$(record : portfolio)$</a> should be approved
  , recipients: Roles:H10, title: Claims in portfolio should be approved, skipCurrentUser: },
  ```

<a id="user-content-wf-115" href="#wf-115"></a>

## WF 115 - "Approved" (TRIGGER)

### Conditions:

- All:
  - **onboarding_status** is _Pending Approval_
  - **lock_automation** is _0_
- At least one:

### Tasks:

- set Onboarding Status = Approved, Claim Acceptant = current user, Approved/rejected time

### Tasks with Details:

- set Onboarding Status = Approved, Claim Acceptant = current user, Approved/rejected time
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Approved (rawtext)",
    "claim_acceptant": "fromUser-current (rawtext)",
    "approved_rejected_time": "get_datetime() (expression)"
  },
  ```

<a id="user-content-wf-116" href="#wf-116"></a>

## WF 116 - "Rejected" (TRIGGER)

### Conditions:

- All:
  - **onboarding_status** is _Pending Approval_
  - **lock_automation** is _0_
- At least one:

### Tasks:

- set Onboarding Status = Rejected, Claim Acceptant = current user, Approved/rejected time

### Tasks with Details:

- set Onboarding Status = Rejected, Claim Acceptant = current user, Approved/rejected time
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Rejected (rawtext)",
    "claim_acceptant": "fromUser-current (rawtext)",
    "approved_rejected_time": "get_datetime() (expression)"
  },
  ```

<a id="user-content-wf-117" href="#wf-117"></a>

## WF 117 - "ON_CLAIM_HURDLE_PAID" (ON_MODIFY)

### Conditions:

- All:
  - **claim_status** is _Open_
  - **remaining_to_hurdle** has changed
  - **remaining_to_hurdle** equal to _0_
  - **lock_automation** is _0_
- At least one:

### Tasks:

- set Claim Status = Paid, Claim paid date

### Tasks with Details:

- set Claim Status = Paid, Claim paid date
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "claim_status": "Paid (rawtext)",
    "claim_paid_date": "get_date('today') (expression)"
  },
  ```

<a id="user-content-wf-118" href="#wf-118"></a>

## WF 118 - "Close (Write-off)" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **claim_status** is _Open_
  - **claim_status** is _Paid_

### Tasks:

- set Write-Off := Adjusted Face Value – Total Collections (result not less than 0), Claim status=Closed, Claim close date

### Tasks with Details:

- set Write-Off := Adjusted Face Value – Total Collections (result not less than 0), Claim status=Closed, Claim close date
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "write_off": "if adjusted_face_value -  total_collections &lt;0 then 0 else  adjusted_face_value -  total_collections end (expression)",
    "claim_status": "Closed (rawtext)",
    "claim_closed_date": "get_date('today') (expression)"
  },
  ```

<a id="user-content-wf-119" href="#wf-119"></a>

## WF 119 - "Buyback this Claim" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **claim_status** is _Open_
- At least one:

### Tasks:

- set Claim Status, Buyback Ammount, Buyback date, Buyback Status

### Tasks with Details:

- set Claim Status, Buyback Ammount, Buyback date, Buyback Status
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "buyback_amount": "if buyback_penalty_percent == NULL then \tif  purchase_price - total_collections &lt; 0 then 0 else \tpurchase_price  - total_collections end else \tif  (purchase_price + (adjusted_face_value * buyback_penalty_percent/100) - total_collections) &lt; 0 then 0 \telse (purchase_price + (adjusted_face_value * buyback_penalty_percent/100) - total_collections) end end (expression)",
    "claim_status": "Buyback (rawtext)",
    "buyback_date": "get_date('today') (expression)",
    "buyback_status": "BB pending (rawtext)"
  },
  ```

<a id="user-content-wf-120" href="#wf-120"></a>

## WF 120 - "ON_CHANGE_STATUS_TO_NOT_BUYBACK" (ON_MODIFY)

### Conditions:

- All:
  - **claim_status** has changed
  - **claim_status** is not _Buyback_
  - **lock_automation** is _0_
- At least one:

### Tasks:

- reset Buyback Amount, Buyback Status to empty

### Tasks with Details:

- reset Buyback Amount, Buyback Status to empty
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "buyback_amount": " (rawtext)",
    "buyback_status": " (rawtext)"
  },
  ```

<a id="user-content-wf-121" href="#wf-121"></a>

## WF 121 - "ON_CHANGE_BUYBACK_AMOUNT_OR_PURCHASE" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **buyback_amount** has changed
  - **buyback_portfolio_purchase** has changed

### Tasks:

- recalculate Buyback Wallet on Provider level: execute Provider.REFRESH_BUYBACK_WALLET_VALUE
- update Buyback Summary on Portfolio level: execute Portfolio.RECALCULATE_FROM_CLAIMS
- update Buyback Clearance on Portfolio Purchase level: execute Portfolio Purchase.RECALCULATE_FROM_CLAIMS

### Tasks with Details:

- recalculate Buyback Wallet on Provider level: execute Provider.REFRESH_BUYBACK_WALLET_VALUE

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Providers",
    "otherWorkflowId": "REFRESH_BUYBACK_WALLET_VALUE",
    "otherWorkflowField": "provider",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- update Buyback Summary on Portfolio level: execute Portfolio.RECALCULATE_FROM_CLAIMS

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Portfolios",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "portfolio",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- update Buyback Clearance on Portfolio Purchase level: execute Portfolio Purchase.RECALCULATE_FROM_CLAIMS
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||PortfolioPurchases",
    "otherWorkflowId": "Recalculate from Claims",
    "otherWorkflowField": "buyback_portfolio_purchase",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

<a id="user-content-wf-125" href="#wf-125"></a>

## WF 125 - "ON_PURCHASED" (MANUAL)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- set Onboarding Status = Purchased, Claim Status = Open, Purchased time
- execute FIND_RELATED_CASE
- execute ON_PURCHASED_COND_CREATE_CASE
- execute Case.RECALCULATE_FROM_CLAIMS
- CF recalculateFromClaimCollections
- WF OutsideCases.RECALCULATE_FROM_CLAIMS

### Tasks with Details:

- set Onboarding Status = Purchased, Claim Status = Open, Purchased time

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Purchased (rawtext)",
    "claim_status": "Open (rawtext)",
    "purchased_time": "get_datetime() (expression)"
  },
  ```

- execute FIND_RELATED_CASE

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findRelatedCase},
  ```

- execute ON_PURCHASED_COND_CREATE_CASE

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: onPurchasedCondCreateCase},
  ```

- execute Case.RECALCULATE_FROM_CLAIMS

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Cases",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "case",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- CF recalculateFromClaimCollections

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFromClaimCollections},
  ```

- WF OutsideCases.RECALCULATE_FROM_CLAIMS
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||OutsideCases",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "outside_case",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

<a id="user-content-wf-158" href="#wf-158"></a>

## WF 158 - "Recalculate Financial Summary" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- WF Claimed Invoices.recalculateFinancialSummary
- CF recalculateFinancialSummary

### Tasks with Details:

- WF Claimed Invoices.recalculateFinancialSummary

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "CHILD||ClaimedInvoices",
    "otherWorkflowId": "Recalculate Financial Summary",
    "otherWorkflowField": "claim"
  },
  ```

- CF recalculateFinancialSummary
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFinancialSummary},
  ```

<a id="user-content-wf-159" href="#wf-159"></a>

## WF 159 - "ON_CHANGE_FINANCIAL_PARAMETERS" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **total_bill_amount** has changed
  - **prior_collections** has changed
  - **adjustments** has changed
  - **purchase_price** has changed
  - **overhead_and_profit** has changed
  - **perc_advance** has changed
  - **buyback_status** has changed to _BB applied_

### Tasks:

- CF recalculateFinancialSummary
- CF recalculateFromClaimCollections

### Tasks with Details:

- CF recalculateFinancialSummary

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFinancialSummary},
  ```

- CF recalculateFromClaimCollections
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFromClaimCollections},
  ```

<a id="user-content-wf-160" href="#wf-160"></a>

## WF 160 - "Recalculate from Claim Collections" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- CF recalculateFromClaimCollections

### Tasks with Details:

- CF recalculateFromClaimCollections
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFromClaimCollections},
  ```

<a id="user-content-wf-161" href="#wf-161"></a>

## WF 161 - "RECALCULATE_FROM_CLAIM_COLLECTIONS" (MANUAL)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- CF recalculateFromClaimCollections

### Tasks with Details:

- CF recalculateFromClaimCollections
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: recalculateFromClaimCollections},
  ```

<a id="user-content-wf-163" href="#wf-163"></a>

## WF 163 - "DOTS: ON_PURCHASED" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **type_of_claim** is not empty
  - **conducted_by** is not empty
- At least one:
  - **current-role** is _DOTS (H46)_
  - **current-role** is _Portfolio Purchase Approver (H50)_
  - **current-role** is _IT Administration (H61)_

### Tasks:

- WF ON_PURCHASED

### Tasks with Details:

- WF ON_PURCHASED
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "CURRENT||Claims",
    "otherWorkflowId": "ON_PURCHASED",
    "otherWorkflowField": "special-current"
  },
  ```

<a id="user-content-wf-166" href="#wf-166"></a>

## WF 166 - "Find Similar Claims" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- CF findSimilarClaims

### Tasks with Details:

- CF findSimilarClaims
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findSimilarClaims},
  ```

<a id="user-content-wf-173" href="#wf-173"></a>

## WF 173 - "Find Related Case" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- CF findRelatedCase

### Tasks with Details:

- CF findRelatedCase
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findRelatedCase},
  ```

<a id="user-content-wf-267" href="#wf-267"></a>

## WF 267 - "ON_CHANGE_FINANCIAL_PARAMETERS_UP" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** has changed
  - **claim_status** has changed
  - **total_bill_amount** has changed
  - **adjusted_face_value** has changed
  - **purchase_price** has changed
  - **factor_fee** has changed
  - **hurdle** has changed
  - **total_voluntary_ollections** has changed
  - **total_pre_suit_collections** has changed
  - **total_litigated_collections** has changed
  - **total_collections** has changed
  - **total_pmc_collections** has changed
  - **write_off** has changed
  - **refundable_reserve** has changed
  - **limit_reserve** has changed
  - **portfolio** has changed
  - **outside_case** has changed
  - **case** has changed
  - **buyback_status** has changed
  - **portfolio_purchase** has changed

### Tasks:

- WF Portfolio Purchases.RECALCULATE_FROM_CLAIMS
- WF Portfolios.RECALCULATE_FROM_CLAIMS
- WF Cases.RECALCULATE_FROM_CLAIMS
- WF OutsideCases.RECALCULATE_FROM_CLAIMS

### Tasks with Details:

- WF Portfolio Purchases.RECALCULATE_FROM_CLAIMS

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||PortfolioPurchases",
    "otherWorkflowId": "Recalculate from Claims",
    "otherWorkflowField": "portfolio_purchase",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- WF Portfolios.RECALCULATE_FROM_CLAIMS

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Portfolios",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "portfolio",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- WF Cases.RECALCULATE_FROM_CLAIMS

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Cases",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "case",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

- WF OutsideCases.RECALCULATE_FROM_CLAIMS
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||OutsideCases",
    "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
    "otherWorkflowField": "outside_case",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

<a id="user-content-wf-355" href="#wf-355"></a>

## WF 355 - "on change Insurance Company" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **insurance_company** has changed
  - **lock_automation** is _0_
- At least one:

### Tasks:

- Set Insurance Company Email = Insurance Company. Email

### Tasks with Details:

- Set Insurance Company Email = Insurance Company. Email
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "insurance_company_email": "'$(relatedRecord : insurance_company|email|InsuranceCompanies)$' (expression)"
  },
  ```

<a id="user-content-wf-381" href="#wf-381"></a>

## WF 381 - "ON_CHANGE_ONB_DATA" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onb_street** has changed
  - **onb_city** has changed
  - **onb_zip** has changed
  - **state** has changed
  - **onb_email** has changed
  - **onb_claim_number** has changed
  - **onb_policy_number** has changed
  - **onb_date_of_loss** has changed
  - **aob_date** has changed
  - **date_of_first_notification** has changed
  - **client_signature** has changed
  - **dates_verified** has changed
  - **insurance_company** has changed

### Tasks:

- CF verifyOnbData

### Tasks with Details:

- CF verifyOnbData
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: verifyOnbData},
  ```

<a id="user-content-wf-382" href="#wf-382"></a>

## WF 382 - "Verify ONB Data" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** is _In Underwriting_
  - **onboarding_status** is _Pending Approval_
  - **onboarding_status** is _Pending Underwriting_

### Tasks:

- CF verifyOnbData

### Tasks with Details:

- CF verifyOnbData
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: verifyOnbData},
  ```

<a id="user-content-wf-383" href="#wf-383"></a>

## WF 383 - "ON_CREATE" (ON_FIRST_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- Set Created date := Truncdd(createdtime)

### Tasks with Details:

- Set Created date := Truncdd(createdtime)
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "created_date": "truncdd(createdtime) (expression)"
  },
  ```

<a id="user-content-wf-384" href="#wf-384"></a>

## WF 384 - "ON_CHANGE_ASSIGNED_TO" (ON_MODIFY)

### Conditions:

- All:
  - **assigned_user_id** has changed
  - **assigned_user_id** is not _18_
  - **onboarding_status** is not _Pending Approval_
- At least one:

### Tasks:

- Send notification to Assigned to

### Tasks with Details:

- Send notification to Assigned to
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claim ID: <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a> for <a href="$(relatedRecord : provider|CrmDetailViewURL)$">$(relatedRecord : provider|provider_name|Providers)$</a>, recipients: fromField-assigned_user_id, title: A Claim was assigned to you, skipCurrentUser: },
  ```

<a id="user-content-wf-386" href="#wf-386"></a>

## WF 386 - "Find County" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:

### Tasks:

- WF Insured.findCounty

### Tasks with Details:

- WF Insured.findCounty
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Insureds",
    "otherWorkflowId": "Find County",
    "otherWorkflowField": "insured"
  },
  ```

<a id="user-content-wf-390" href="#wf-390"></a>

## WF 390 - "Restart Underwriting" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** is _Pending Approval_
  - **onboarding_status** is _Missing Documents_

### Tasks:

- CF findSimilarClaims
- CF findRelatedCase
- Set Underwriting Status=In Underwriting, Assigned to=Claim Underwriter

### Tasks with Details:

- CF findSimilarClaims

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findSimilarClaims},
  ```

- CF findRelatedCase

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: findRelatedCase},
  ```

- Set Underwriting Status=In Underwriting, Assigned to=Claim Underwriter
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "In Underwriting (rawtext)",
    "assigned_user_id": "fromField-claim_underwriter (rawtext)"
  },
  ```

<a id="user-content-wf-429" href="#wf-429"></a>

## WF 429 - "on change Portfolio Purchase (notification in case of inconsistent Portfolio)" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **portfolio_purchase** has changed
  - **portfolio_purchase** is not empty
  - **portfolio** is not _'$(relatedRecord : portfolio_purchase|portfolio|PortfolioPurchases)$'_ (expression)
- At least one:

### Tasks:

- inconsistent data: Claim.Portfolio Purchase-Portfolio differs Claim-Portfolio

### Tasks with Details:

- inconsistent data: Claim.Portfolio Purchase-Portfolio differs Claim-Portfolio
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claim.Portfolio Purchase->Portfolio is different from Claim.Portfolio for <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a>, recipients: special-current-user, title: Inconsistent data, skipCurrentUser: },
  ```

<a id="user-content-wf-430" href="#wf-430"></a>

## WF 430 - "on change Portfolio Purchase (notification in case of inconsistent Provider)" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **portfolio_purchase** has changed
  - **portfolio_purchase** is not empty
  - **provider** is not _'$(relatedRecord : portfolio_purchase|provider|PortfolioPurchases)$'_ (expression)
- At least one:

### Tasks:

- inconsistent data: Claim.Portfolio Purchase-Providerdiffers Claim-Provider

### Tasks with Details:

- inconsistent data: Claim.Portfolio Purchase-Providerdiffers Claim-Provider
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claim.Portfolio Purchase->Provider is different from Claim.Provider for <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a>, recipients: special-current-user, title: Inconsistent data, skipCurrentUser: },
  ```

<a id="user-content-wf-431" href="#wf-431"></a>

## WF 431 - "on change Portfolio (notification in case of inconsistent Provider)" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **portfolio** has changed
  - **provider** is not _'$(relatedRecord : portfolio|provider|Portfolios)$'_ (expression)
  - **portfolio** is not empty
- At least one:

### Tasks:

- inconsistent data: Claim.Portfolio-Portfolio differs Claim-Provider

### Tasks with Details:

- inconsistent data: Claim.Portfolio-Portfolio differs Claim-Provider
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claim.Portfolio ->Provider is different from Claim.Provider for <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a>, recipients: special-current-user, title: Inconsistent data, skipCurrentUser: },
  ```

<a id="user-content-wf-432" href="#wf-432"></a>

## WF 432 - "on change Buyback Portfolio Purchase (notification in case of inconsistent Provider)" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **buyback_portfolio_purchase** has changed
  - **provider** is not _'$(relatedRecord : buyback_portfolio_purchase|provider|PortfolioPurchases)$'_ (expression)
  - **buyback_portfolio_purchase** is not empty
- At least one:

### Tasks:

- inconsistent data: Claim.Buyback Portfolio Purchase-Provider differs Claim-Provider

### Tasks with Details:

- inconsistent data: Claim.Buyback Portfolio Purchase-Provider differs Claim-Provider
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claim.Buyback Portfolio Purchase->Provider is different from Claim.Provider for <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a>, recipients: special-current-user, title: Inconsistent data, skipCurrentUser: },
  ```

<a id="user-content-wf-440" href="#wf-440"></a>

## WF 440 - "New e-mail received (Claim)" (MANUAL)

### Conditions:

- All:
- At least one:

### Tasks:

- ~Send Notification to Assigned to: attaching an e-mail to the Claim~

### Tasks with Details:

- ~~Send Notification to Assigned to: attaching an e-mail to the Claim~~
  ```
  taskType: VTWatchdog, active: false
  otherParameters: {srcWatchdogModule: Notification, active: false, type: PLL_USERS, message: The e-mail has been attached to the Claim: <a href="$(record : CrmDetailViewURL)$">$(record : claim_id)$</a>, recipients: fromField-assigned_user_id, title: New e-mail received, skipCurrentUser: },
  ```

<a id="user-content-wf-442" href="#wf-442"></a>

## WF 442 - "ON_CHANGE_PORTFOLIO_PURCHASE" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **portfolio_purchase** has changed
- At least one:

### Tasks:

- Call WF Claimed Invoices.SET_PORTFOLIO_PURCHASE_FROM_CLAIM

### Tasks with Details:

- Call WF Claimed Invoices.SET_PORTFOLIO_PURCHASE_FROM_CLAIM
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "CHILD||ClaimedInvoices",
    "otherWorkflowId": "SET_PORTFOLIO_PURCHASE_FROM_CLAIM",
    "otherWorkflowField": "claim",
    "otherWorkflowFieldValueVersion": "Both"
  },
  ```

<a id="user-content-wf-579" href="#wf-579"></a>

## WF 579 - "ON_CHANGE_CONDUCTED_BY" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **conducted_by** has changed
- At least one:

### Tasks:

- Clear Case or Outside Case depending on Conducted by, clear Basic Litigation Status

### Tasks with Details:

- Clear Case or Outside Case depending on Conducted by, clear Basic Litigation Status
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "case": "if conducted_by == 'FLINSLAW' then case else '' end (expression)",
    "outside_case": "if conducted_by == 'Outside' then outside_case else '' end (expression)",
    "basic_litigation_status": " (rawtext)"
  },
  ```

<a id="user-content-wf-582" href="#wf-582"></a>

## WF 582 - "ON_CHANGE_OUTSIDE_CASE" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **outside_case** has changed
  - **outside_case** is not empty
- At least one:

### Tasks:

- set Claim.Basic Litigation Status := Outside Case.Litigation Status + Litigation Status (other)

### Tasks with Details:

- set Claim.Basic Litigation Status := Outside Case.Litigation Status + Litigation Status (other)
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "basic_litigation_status": "concat('$(relatedRecord : outside_case|litigation_status|OutsideCases)$',' ','$(relatedRecord : outside_case|litigation_status_other|OutsideCases)$') (expression)"
  },
  ```

<a id="user-content-wf-621" href="#wf-621"></a>

## WF 621 - "Remove white chars on Policy Number and Claim Number" (ON_EVERY_SAVE)

### Conditions:

- All:
- At least one:
  - **policy_number** has changed
  - **claim_number** has changed

### Tasks:

- Remove white chars on Policy Number and Claim Number

### Tasks with Details:

- Remove white chars on Policy Number and Claim Number
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "claim_number": "remove_white_chars( claim_number) (expression)",
    "policy_number": "remove_white_chars( policy_number) (expression)"
  },
  ```

<a id="user-content-wf-639" href="#wf-639"></a>

## WF 639 - "Missing Documents" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
- At least one:
  - **onboarding_status** is _In Underwriting_
  - **onboarding_status** is _Pending Approval_

### Tasks:

- set Onboarding Status = Missing Documents, Missing Documents Date
- ~send an email to the Provider that there are missing documents~

### Tasks with Details:

- set Onboarding Status = Missing Documents, Missing Documents Date

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Missing Documents (rawtext)",
    "missing_documents_date": "get_date('today') (expression)"
  },
  ```

- ~~send an email to the Provider that there are missing documents~~
  ```
  taskType: VTEmailTemplateTask, active: false
  otherParameters: {active: false, template: N123, email: [], relations_email: -, emailoptout: , smtp: 3, copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: },
  ```

<a id="user-content-wf-640" href="#wf-640"></a>

## WF 640 - "Reminder about Missing Docunents" (ON_SCHEDULE)

### Conditions:

- All:
  - **onboarding_status** is _Missing Documents_
  - **missing_documents_date** days ago _2_
- At least one:

### Tasks:

- Send a notification to Claim Acceptant role

### Tasks with Details:

- Send a notification to Claim Acceptant role
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_SYSTEM, message: There are still  missing documents for claim : $(record : claim_id)$., recipients: Roles:H10, title: Reminder about Missing Docunents, skipCurrentUser: },
  ```

<a id="user-content-wf-678" href="#wf-678"></a>

## WF 678 - "If InsuranceCompanies.Forced Place Carrier = yes update ONB Comments" (ON_FIRST_SAVE)

### Conditions:

- All:
  - **(insurance_company : (InsuranceCompanies) force_place_carrier)** is _Yes_
  - **insurance_company** is not empty
- At least one:

### Tasks:

- If InsuranceCompanies.Forced Place Carrier = yes update ONB Comments

### Tasks with Details:

- If InsuranceCompanies.Forced Place Carrier = yes update ONB Comments
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onb_comments": "concat(onb_comments,'&lt;font color=&quot;red&quot;&gt;Insurance Company in Forced Place Carrier &lt;/font&gt;&lt;br&gt;') (expression)"
  },
  ```

<a id="user-content-wf-679" href="#wf-679"></a>

## WF 679 - "If InsuranceCompanies.In Good Standing = no update ONB Comments" (ON_FIRST_SAVE)

### Conditions:

- All:
  - **(insurance_company : (InsuranceCompanies) in_good_standing)** is _No_
  - **insurance_company** is not empty
- At least one:

### Tasks:

- If InsuranceCompanies.In Good Standing = no update ONB Comments

### Tasks with Details:

- If InsuranceCompanies.In Good Standing = no update ONB Comments
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onb_comments": "concat(onb_comments, '&lt;font color=&quot;red&quot;&gt;Insurance Company in Receivership &lt;/font&gt;&lt;br&gt; ') (expression)"
  },
  ```

<a id="user-content-wf-680" href="#wf-680"></a>

## WF 680 - "Update ONB Comments after changing Insurance Company" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **insurance_company** has changed
- At least one:

### Tasks:

- update ONB Comments

### Tasks with Details:

- update ONB Comments
  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: updateInsuranceCompanyComments},
  ```

<a id="user-content-wf-714" href="#wf-714"></a>

## WF 714 - "on change Insurance Company, if Block IC=Yes, reject the Claim" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **insurance_company** has changed
  - **(insurance_company : (InsuranceCompanies) block_ic)** is _1_
  - **onboarding_status** is not _Purchased_
  - **lock_automation** is _0_
  - **onboarding_status** is not _Rejected_
- At least one:

### Tasks:

- CF verifyOnbData to add warnings
- reject the claim

### Tasks with Details:

- CF verifyOnbData to add warnings

  ```
  taskType: VTEntityMethodTask, active: true
  otherParameters: {methodName: verifyOnbData},
  ```

- reject the claim
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "onboarding_status": "Rejected (rawtext)",
    "approved_rejected_time": "get_datetime() (expression)",
    "claim_acceptant": "18 (rawtext)"
  },
  ```

<a id="user-content-wf-719" href="#wf-719"></a>

## WF 719 - "ON_CHANGE_OUTSIDE_CASE" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **outside_case** has changed
  - **outside_case** is not empty
- At least one:

### Tasks:

- Document.Case = Document.Claim.Case

### Tasks with Details:

- Document.Case = Document.Claim.Case
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "CHILD||Documents",
    "otherWorkflowId": "On change of Outside Case in Claim Set Document.Outside Case from Document.Claim.Outside Case",
    "otherWorkflowField": "claim",
    "otherWorkflowFieldValueVersion": "New"
  },
  ```

<a id="user-content-wf-728" href="#wf-728"></a>

## WF 728 - "Set Voluntary collection started date" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **total_voluntary_ollections** has changed
  - **total_voluntary_ollections** greater than _0_
- At least one:

### Tasks:

- set Voluntary collection started date

### Tasks with Details:

- set Voluntary collection started date
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "vol_coll_started_date": "nvl( vol_coll_started_date, get_date('today')) (expression)"
  },
  ```

<a id="user-content-wf-734" href="#wf-734"></a>

## WF 734 - "HO Attorney confirmed" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **current-role** is not _Claim Underwriter (H38)_
  - **ho_attorney_confirmation_statu** is not _Confirmed_
- At least one:

### Tasks:

- Set HO Attorney Confirmation Status to Confirmed
- call STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
- send a notification to Claim Acceptant role that claims in portfolio should be approved

### Tasks with Details:

- Set HO Attorney Confirmation Status to Confirmed

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "ho_attorney_confirmation_statu": "Confirmed (rawtext)"
  },
  ```

- call STOP_IF_MORE_CLAIMS_TO_UNDERWRITE

  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Portfolios",
    "otherWorkflowId": "STOP_IF_MORE_CLAIMS_TO_UNDERWRITE",
    "otherWorkflowField": "portfolio",
    "otherWorkflowFieldValueVersion": "New"
  },
  ```

- send a notification to Claim Acceptant role that claims in portfolio should be approved
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claims in portfolio:  <a href="$(relatedRecord : portfolio|CrmDetailViewURL)$">$(record : portfolio)$</a> should be approved, recipients: Roles:H10, title: Claims in portfolio should be approved, skipCurrentUser: },
  ```

<a id="user-content-wf-736" href="#wf-736"></a>

## WF 736 - "HO Attorney rejected" (TRIGGER)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **current-role** is not _Claim Underwriter (H38)_
  - **ho_attorney_confirmation_statu** is not _Rejected_
- At least one:

### Tasks:

- Set HO Attorney Confirmation Status to Rejected

### Tasks with Details:

- Set HO Attorney Confirmation Status to Rejected
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "ho_attorney_confirmation_statu": "Rejected (rawtext)"
  },
  ```

<a id="user-content-wf-738" href="#wf-738"></a>

## WF 738 - "Reset HO Attorney confirmation status" (TRIGGER)

### Conditions:

- All:
  - **ho_attorney_confirmation_statu** is not empty
  - **lock_automation** is _0_
  - **current-role** is not _Claim Underwriter (H38)_
- At least one:

### Tasks:

- Reset HO Attorney Confirmation Status, HO Attorney Conf. Request Date

### Tasks with Details:

- Reset HO Attorney Confirmation Status, HO Attorney Conf. Request Date
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "ho_attorney_confirmation_statu": "special-clear (rawtext)",
    "ho_attorney_conf_request_date": " (rawtext)"
  },
  ```

<a id="user-content-wf-750" href="#wf-750"></a>

## WF 750 - "Set Portfolio" (MANUAL)

### Conditions:

- All:
- At least one:

### Tasks:

- set portfolio

### Tasks with Details:

- set portfolio
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "portfolio": "$(relatedRecordId : portfolio_purchase|portfolio|PortfolioPurchases)$ (expression)"
  },
  ```

<a id="user-content-wf-758" href="#wf-758"></a>

## WF 758 - "SYSTEM: when Buyback Portfolio Purchase is Funded, set Buyback Status = BB applied" (MANUAL)

### Conditions:

- All:
  - **lock_automation** is _0_
  - **buyback_status** is _BB pending_
  - **claim_status** is _Buyback_
- At least one:

### Tasks:

- set Buyback Status = BB applied

### Tasks with Details:

- set Buyback Status = BB applied
  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "buyback_status": "BB applied (rawtext)"
  },
  ```

<a id="user-content-wf-839" href="#wf-839"></a>

## WF 839 - "Set Outside Case.Date of service" (ON_EVERY_SAVE)

### Conditions:

- All:
  - **date_of_service** has changed
  - **outside_case** is not empty
- At least one:

### Tasks:

- Set Outside Case. Date of service

### Tasks with Details:

- Set Outside Case. Date of service
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||OutsideCases",
    "otherWorkflowId": "Set Date of service",
    "otherWorkflowField": "outside_case",
    "otherWorkflowFieldValueVersion": "New"
  },
  ```
  <a id="user-content-wf-1035" href="#wf-1035"></a>

## WF 1035 - "Public Adjuster confirmed"

### Conditions:

- All:
  - **lock_automation** is _0_
  - **current_role** is not _Claim Underwriter_
  - **public_adjuster_confirmation_status** is not _Confirmed_
- At least one:

### Tasks:

- Set Public Adjuster Confirmation Status to Confirmed
- call STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
- send a notification to Claim Acceptant role that claims in portfolio should be approved

### Tasks with Details:

- Set Public Adjuster Confirmation Status to Confirmed

  ```
  taskType: VTUpdateFieldsTask, active: true
  taskTypeParameters: {
    "public_adjuster_confirmation_status": "'Confirmed' (field)"
  },
  ```

- call STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
  ```
  taskType: VTEntityWorkflow, active: true
  taskTypeParameters: {
    "workflowModule": "PARENT||Portfolios",
    "otherWorkflowId": "STOP_IF_MORE_CLAIMS_TO_UNDERWRITE",
    "otherWorkflowField": "portfolio"
  },
  ```

- send a notification to Claim Acceptant role that claims in portfolio should be approved
  ```
  taskType: VTWatchdog, active: true
  otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Claims in portfolio:  <a href="$(relatedRecord : portfolio|CrmDetailViewURL)$">$(record : portfolio)$</a> should be approved
  , recipients: Roles:H10, title: Claims in portfolio should be approved, skipCurrentUser: },
  ```
