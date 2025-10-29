# Module: PortfolioPurchases
<a id="user-content-wf-109" href="#wf-109"></a>
## WF 109 - "ON_CREATE_SET_PORTFOLIO_PURCHASE_ID" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **portfolio_purchase_name** is _---new---_ 
  - **portfolio_purchase_name** is empty 
### Tasks:
- CF generatePortfolioPurchaseName
### Tasks with Details:
- CF generatePortfolioPurchaseName
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: generatePortfolioPurchaseName}, 
    ``` 

<a id="user-content-wf-110" href="#wf-110"></a>
## WF 110 - "Recalculate from Claims" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- CF recalculateFromClaims
- CF recalculateFromBuybackClaims
### Tasks with Details:
- CF recalculateFromClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromClaims}, 
    ``` 

- CF recalculateFromBuybackClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromBuybackClaims}, 
    ``` 

<a id="user-content-wf-128" href="#wf-128"></a>
## WF 128 - "Send exhibits to be signed" (TRIGGER)
### Conditions:
- All:
  - **portfolio_purchase_status** is _New_ 
  - **(provider : (Providers) email)** is not empty 
- At least one:
  - **current-role** is _Portfolio Purchase Acceptant (H47)_ 
### Tasks:
- Call WF Recalculate from Claims
- STOP if any related claim has Onboarding Status != Approved or ( (CSTOP if any related claim has Onboarding Status not eq.  Approved or has Conducted by = (empty) or ( HO Law Firm is empty and HO Attorney is empty) or ( Type of Claim =FLOOD ) or ( Type of Claim =DTP and &quot;AOB/DTP Attorney&quot;= (FLINS lawyer) and Conducted by= Outside ) or ( (Case or Outside Case) exists, but should have diff
- STOP if any Purchase Document is created
- set Onboarding Status =Sent to Seller to be signed, Purchase Underwriter = current user,  Addendum Date = today
- ~Generate a package of documents: &quot;Exhibit B&quot; and &quot;Exhibit C&quot;~
- Generate a package of documents: &quot;Exhibit B&quot; and &quot;Exhibit C&quot;
### Tasks with Details:
- Call WF Recalculate from Claims
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CURRENT||PortfolioPurchases",
      "otherWorkflowId": "Recalculate from Claims",
      "otherWorkflowField": "special-current"
    }, 
    ``` 

- STOP if any related claim has Onboarding Status != Approved or ( (CSTOP if any related claim has Onboarding Status not eq.  Approved or has Conducted by = (empty) or ( HO Law Firm is empty and HO Attorney is empty) or ( Type of Claim =FLOOD ) or ( Type of Claim =DTP and &quot;AOB/DTP Attorney&quot;= (FLINS lawyer) and Conducted by= Outside ) or ( (Case or Outside Case) exists, but should have diff
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: checkClaimsApproved}, 
    ``` 

- STOP if any Purchase Document is created
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: checkNoPurchaseDocument}, 
    ``` 

- set Onboarding Status =Sent to Seller to be signed, Purchase Underwriter = current user,  Addendum Date = today
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase_status": "Sent to Seller to be signed (rawtext)",
      "purchase_underwriter": "fromUser-current (rawtext)",
      "addendum_date": "get_date('today') (expression)"
    }, 
    ``` 

- ~~Generate a package of documents: &quot;Exhibit B&quot; and &quot;Exhibit C&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "BatchTasks",
      "reference_field": "item",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "mod_name": "PortfolioPurchases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Generate Portfolio Purchase documents: &quot;Exhibit B&quot; and &quot;Exhibit C&quot;  (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N3') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- Generate a package of documents: &quot;Exhibit B&quot; and &quot;Exhibit C&quot;
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Exhibit B and Exhibit C, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

<a id="user-content-wf-138" href="#wf-138"></a>
## WF 138 - "Reject" (TRIGGER)
### Conditions:
- All:
  - **portfolio_purchase_status** is _New_ 
- At least one:
  - **current-role** is _Portfolio Purchase Acceptant (H47)_ 
### Tasks:
- set Status = Rejected
- Send a Notification to Assigned to: &quot;Send an email to the Provider that a purchase of his portfolio was rejected: link to the portfolio purchase&quot;
### Tasks with Details:
- set Status = Rejected
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase_status": "Rejected (rawtext)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Send an email to the Provider that a purchase of his portfolio was rejected: link to the portfolio purchase&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Send an email to the Provider that a purchase of his portfolio <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a> was rejected, recipients: fromField-assigned_user_id, title: Send an email to the Provider: purchase of portfolio was rejected, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-139" href="#wf-139"></a>
## WF 139 - "REFRESH_CASH_TO_SELLER" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **purchase_value** has changed 
  - **buyback_clearance** has changed 
  - **wire_fees** has changed 
### Tasks:
- call recalculateFromClaims
### Tasks with Details:
- call recalculateFromClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromClaims}, 
    ``` 

<a id="user-content-wf-171" href="#wf-171"></a>
## WF 171 - "Purchased" (TRIGGER)
### Conditions:
- All:
  - **portfolio_purchase_status** is _Sent to Seller to be signed_ 
  - **current-role** is _Portfolio Purchase Approver (H50)_ 
  - **buyback_clearance** is not empty 
  - **cash_to_seller** is not empty 
  - **purchase_value** is not empty 
- At least one:
### Tasks:
- STOP if any related claim has Onboarding Status not eq.  Approved or has Conducted by = (empty) or ( HO Law Firm is empty and HO Attorney is empty) or ( Type of Claim =FLOOD ) or ( Type of Claim =DTP and &quot;AOB/DTP Attorney&quot;= (FLINS lawyer) and Conducted by= Outside ) or ( (Case or Outside Case) exists, but should have different type (ie. there is Case, while should be Outside Case or vice
- set Onboarding Status = Purchased, Purchase Approver = current user, Purchase date = current day
- for each related Claim execute”Claim.ON_PURCHASED”
- ~Send a Notification to Assigned to: &quot;Send an email to the Provider to sign this Portfolio Purchase: link to the portfolio purchase&quot;~
- Create Payment
- send notifiication Portfolio Purchase  is ready for Funding
### Tasks with Details:
- STOP if any related claim has Onboarding Status not eq.  Approved or has Conducted by = (empty) or ( HO Law Firm is empty and HO Attorney is empty) or ( Type of Claim =FLOOD ) or ( Type of Claim =DTP and &quot;AOB/DTP Attorney&quot;= (FLINS lawyer) and Conducted by= Outside ) or ( (Case or Outside Case) exists, but should have different type (ie. there is Case, while should be Outside Case or vice
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: checkClaimsApproved}, 
    ``` 

- set Onboarding Status = Purchased, Purchase Approver = current user, Purchase date = current day
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase_status": "Purchased (rawtext)",
      "purchase_approver": "fromUser-current (rawtext)",
      "purchase_date": "get_datetime() (expression)"
    }, 
    ``` 

- for each related Claim execute”Claim.ON_PURCHASED”
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Claims",
      "otherWorkflowId": "ON_PURCHASED",
      "otherWorkflowField": "portfolio_purchase"
    }, 
    ``` 

- ~~Send a Notification to Assigned to: &quot;Send an email to the Provider to sign this Portfolio Purchase: link to the portfolio purchase&quot;~~
    ``` 
    taskType: VTWatchdog, active: false 
    otherParameters: {srcWatchdogModule: Notification, active: false, type: PLL_USERS, message: Send an email to the Provider to sign this Portfolio Purchase: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a>, recipients: fromField-assigned_user_id, title: Send an email to the Provider to sign Portfolio Purchase, skipCurrentUser: }, 
    ``` 

- Create Payment
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Payments",
      "reference_field": "portfolio_purchase",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "set_fields_in_new_entity": {
        "payment_name": "concat('Payment for Portfolio Purchase ',portfolio_purchase_name) (expression)",
        "payment_date": "get_date('today') (expression)",
        "payment_method": "Check (rawtext)",
        "payment_direction": "Outgoing (rawtext)",
        "payment_value": "cash_to_seller (fieldname)",
        "buyback_value": "buyback_clearance (fieldname)",
        "pdss_payment_status": "To be paid (rawtext)",
        "provider": "provider (fieldname)",
        "assigned_user_id": "assigned_user_id (fieldname)",
        "portfolio": "portfolio (fieldname)",
        "portfolio_purchase": "portfolio_purchase_name (fieldname)"
      }
    }, 
    ``` 

- send notifiication Portfolio Purchase  is ready for Funding
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio Purchase: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a>  is ready for Funding, recipients: fromField-relatedRecordId:investor:assigned_user_id:Investors, title: Portfolio Purchase ready for Funding, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-279" href="#wf-279"></a>
## WF 279 - "INFO: some key data is empty" (TRIGGER)
### Conditions:
- All:
- At least one:
  - **purchase_value** equal to 
  - **buyback_clearance** equal to ()
  - **cash_to_seller** equal to ()
### Tasks:
### Tasks with Details:
<a id="user-content-wf-404" href="#wf-404"></a>
## WF 404 - "Default Wire Fees " (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- set default Wire Fees
### Tasks with Details:
- set default Wire Fees
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "wire_fees": "30 (expression)"
    }, 
    ``` 

<a id="user-content-wf-427" href="#wf-427"></a>
## WF 427 - "ON_CHANGE_PROGRAM" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **program** has changed 
### Tasks:
- call WF Claims.Recalculate Financial Summary
### Tasks with Details:
- call WF Claims.Recalculate Financial Summary
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Claims",
      "otherWorkflowId": "Recalculate Financial Summary",
      "otherWorkflowField": "portfolio_purchase",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

<a id="user-content-wf-433" href="#wf-433"></a>
## WF 433 - "on change Portfolio (notification in case of inconsistent Provider)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio** has changed 
  - **provider** is not _'$(relatedRecord : portfolio|provider|Portfolios)$'_ (expression)
  - **portfolio** is not empty 
- At least one:
### Tasks:
- inconsistent data: Portfolio Purchase.Portfolio-Provider differs Portfolio Purchase.Provider
### Tasks with Details:
- inconsistent data: Portfolio Purchase.Portfolio-Provider differs Portfolio Purchase.Provider
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message:  Portfolio Purchase.Portfolio->Provider is different from Portfolio Purchase.Provider for <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a>, recipients: special-current-user, title: Inconsistent data, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-439" href="#wf-439"></a>
## WF 439 - "New e-mail received (Portfolio Purchase)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send Notification to Assigned to: attaching an e-mail to the Portfolio Purchase
### Tasks with Details:
- Send Notification to Assigned to: attaching an e-mail to the Portfolio Purchase
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: The e-mail has been attached to the Portfolio Purchase: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a>, recipients: fromField-assigned_user_id, title: New e-mail received, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-456" href="#wf-456"></a>
## WF 456 - "Fund Portfolio Purchase" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _Investor (H42)_ 
  - **portfolio_purchase_status** is _Purchased_ 
- At least one:
### Tasks:
- update Portfolio Purchases.Funded Date to current date, Status to Funded
- send a notification to Portfolio Purchases.Purchase Approver: &quot;Portfolio Purchase [nazwa i link] has been Funded&quot;
- for each Buyback Claim call WF: SYSTEM: when Buyback Portfolio Purchase is Funded, set Buyback Status = BB applied
- CF exportPurchaseToQuickBooks
### Tasks with Details:
- update Portfolio Purchases.Funded Date to current date, Status to Funded
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "funded_date": "get_date('today') (expression)",
      "portfolio_purchase_status": "Funded (rawtext)"
    }, 
    ``` 

- send a notification to Portfolio Purchases.Purchase Approver: &quot;Portfolio Purchase [nazwa i link] has been Funded&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio Purchase:  <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_purchase_name)$</a>'  has been Funded, recipients: fromField-purchase_approver, title: Portfolio Purchase  funded, skipCurrentUser: }, 
    ``` 

- for each Buyback Claim call WF: SYSTEM: when Buyback Portfolio Purchase is Funded, set Buyback Status = BB applied
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Claims",
      "otherWorkflowId": "SYSTEM: when Buyback Portfolio Purchase is Funded, set Buyback Status = BB applied",
      "otherWorkflowField": "buyback_portfolio_purchase",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

- CF exportPurchaseToQuickBooks
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportPurchaseToQuickBooks}, 
    ``` 

<a id="user-content-wf-457" href="#wf-457"></a>
## WF 457 - "Export Purchase to QuickBooks (again)" (TRIGGER)
### Conditions:
- All:
  - **portfolio_purchase_status** is _Funded_ 
- At least one:
### Tasks:
- CF exportPurchaseToQuickBooks
### Tasks with Details:
- CF exportPurchaseToQuickBooks
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportPurchaseToQuickBooks}, 
    ``` 

<a id="user-content-wf-463" href="#wf-463"></a>
## WF 463 - " Send the document to the DocuSign system" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send the document to the DocuSign system
### Tasks with Details:
- Send the document to the DocuSign system
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: sendForSigning}, 
    ``` 

<a id="user-content-wf-464" href="#wf-464"></a>
## WF 464 - "INFO: Provider email adress empty" (TRIGGER)
### Conditions:
- All:
  - **(provider : (Providers) email)** is empty 
- At least one:
### Tasks:
### Tasks with Details:
<a id="user-content-wf-465" href="#wf-465"></a>
## WF 465 - "Document rejected/not signed" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send e-mail: document rejected/not signed
### Tasks with Details:
- Send e-mail: document rejected/not signed
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N46, email: [], relations_email: -, emailoptout: , smtp: 3, copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-466" href="#wf-466"></a>
## WF 466 - "Signed document" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send e-mail: document signed
### Tasks with Details:
- Send e-mail: document signed
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N47, email: [], relations_email: -, emailoptout: , smtp: 3, copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-749" href="#wf-749"></a>
## WF 749 - "On change of Portfolio" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio** has changed 
- At least one:
### Tasks:
- Call ClaimsSet Portfolio
### Tasks with Details:
- Call ClaimsSet Portfolio
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Claims",
      "otherWorkflowId": "Set Portfolio",
      "otherWorkflowField": "portfolio_purchase",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-834" href="#wf-834"></a>
## WF 834 - "Create the Journal Entries in QB " (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio_purchase_status** has changed to _Funded_ 
- At least one:
### Tasks:
- Create Journal Entries in QB 
### Tasks with Details:
- Create Journal Entries in QB 
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportPurchaseToQuickBooks}, 
    ``` 

<a id="user-content-wf-835" href="#wf-835"></a>
## WF 835 - "Create the Journal Entries in QB " (TRIGGER)
### Conditions:
- All:
  - **portfolio_purchase_status** is _Funded_ 
- At least one:
### Tasks:
- Create Journal Entries in QB 
### Tasks with Details:
- Create Journal Entries in QB 
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportPurchaseToQuickBooks}, 
    ``` 

<a id="user-content-wf-867" href="#wf-867"></a>
## WF 867 - "on chane Invertor" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **investor** has changed 
- At least one:
### Tasks:
- Set Investor
### Tasks with Details:
- Set Investor
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Portfolios",
      "otherWorkflowId": "RECALCULATE_ALL",
      "otherWorkflowField": "portfolio",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

