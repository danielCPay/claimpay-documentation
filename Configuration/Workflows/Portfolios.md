# Module: Portfolios
<a id="user-content-wf-92" href="#wf-92"></a>
## WF 92 - "ON_CREATE_SET_PORTFOLIO_ID" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **portfolio_id** is _---new---_ 
  - **portfolio_id** is empty 
### Tasks:
- ~Increase Provider.Last Portfolio Number~
- ~set Portfolio ID~
- CF generatePortfolioId
### Tasks with Details:
- ~~Increase Provider.Last Portfolio Number~~
    ``` 
    taskType: VTUpdateRelatedFieldTask, active: false 
    taskTypeParameters: {
      "provider::Providers::last_portfolio_number": "'$(relatedRecord: provider|last_portfolio_number|Providers)$' (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- ~~set Portfolio ID~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "portfolio_id": "'$(relatedRecord: provider|last_portfolio_number|Providers)$' (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- CF generatePortfolioId
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: generatePortfolioId}, 
    ``` 

<a id="user-content-wf-111" href="#wf-111"></a>
## WF 111 - "Recalculate from Claims" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- CF recalculateFromClaims
### Tasks with Details:
- CF recalculateFromClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromClaims}, 
    ``` 

<a id="user-content-wf-124" href="#wf-124"></a>
## WF 124 - "RECALCULATE_FROM_CLAIMS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Call CF recalculateFromClaims
### Tasks with Details:
- Call CF recalculateFromClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

<a id="user-content-wf-129" href="#wf-129"></a>
## WF 129 - "For approval" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _New_ 
  - **total_number_of_claims** greater than _0_ 
- At least one:
### Tasks:
- set Status = For approval, Proposal Underwriter Name = current user, Assigned to = from group Portfolio Purchase Acceptants
- send a Notification to Assigned to: &quot;A Portfolio is ready for approval&quot;
### Tasks with Details:
- set Status = For approval, Proposal Underwriter Name = current user, Assigned to = from group Portfolio Purchase Acceptants
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "For approval (rawtext)",
      "proposal_underwriter": "fromUser-current (rawtext)",
      "assigned_user_id": "fromUserGroup-Portfolio Purchase Acceptants (rawtext)"
    }, 
    ``` 

- send a Notification to Assigned to: &quot;A Portfolio is ready for approval&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: A Portfolio <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> is ready for approval, recipients: fromField-assigned_user_id, title: A Portfolio is ready for approval, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-130" href="#wf-130"></a>
## WF 130 - "Approve" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _For approval_ 
- At least one:
### Tasks:
- set Status = Waiting for acceptance by Provider, Approved date = current day,  Portfolio Approver name to current user
- Send a Notification to Assigned to: &quot;Send an email to the Provider to accept this Portfolio&quot;
### Tasks with Details:
- set Status = Waiting for acceptance by Provider, Approved date = current day,  Portfolio Approver name to current user
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Waiting for acceptance by Provider (rawtext)",
      "approved_date": "get_date('today') (expression)",
      "portfolio_approver_name": "fromUser-current (rawtext)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Send an email to the Provider to accept this Portfolio&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Send an email to the Provider to accept this <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> portfolio., recipients: fromField-assigned_user_id, title: Send an email to the Provider to accept this Portfolio, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-131" href="#wf-131"></a>
## WF 131 - "Reject" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _For approval_ 
- At least one:
### Tasks:
- set Status = Portfolio rejected
- Send a Notification to Assigned to: &quot;Send an email to the Provider that his portfolio was rejected&quot;
### Tasks with Details:
- set Status = Portfolio rejected
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Portfolio rejected (rawtext)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Send an email to the Provider that his portfolio was rejected&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Send an email to the Provider that his portfolio: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> was rejected., recipients: fromField-assigned_user_id, title: Portfolio was rejected, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-132" href="#wf-132"></a>
## WF 132 - "Provider accepted this Portfolio" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _Waiting for acceptance by Provider_ 
- At least one:
### Tasks:
- set Status = Open, Opened date = current date
- Send a Notification to Assigned to: &quot;Portfolio approved and accepted: &quot;
- ~CF exportPortfolioToQuickBooks~
### Tasks with Details:
- set Status = Open, Opened date = current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Open (rawtext)",
      "opened_date": "get_date('today') (expression)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Portfolio approved and accepted: &quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> approved and accepted, recipients: fromField-assigned_user_id, title: Portfolio approved and accepted, skipCurrentUser: }, 
    ``` 

- ~~CF exportPortfolioToQuickBooks~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: exportPortfolioToQuickBooks}, 
    ``` 

<a id="user-content-wf-133" href="#wf-133"></a>
## WF 133 - "Close (Write-off)" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _Open_ 
- At least one:
### Tasks:
- set Status = Closed,  Closed date = current date , Portfolio Write-Off := Adjusted Face Value – Total Collections (if result &amp;gt;0)
- Send a Notification to Assigned to: &quot;Portfolio closed with write-off&quot;
### Tasks with Details:
- set Status = Closed,  Closed date = current date , Portfolio Write-Off := Adjusted Face Value – Total Collections (if result &amp;gt;0)
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Closed (rawtext)",
      "closed_date": "get_date('today') (expression)",
      "portfolio_write_off": "if total_adjusted_face_value -  total_collections &gt; 0 then total_adjusted_face_value -  total_collections else 0 end (expression)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Portfolio closed with write-off&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> closed with write-off, recipients: fromField-assigned_user_id, title: Portfolio closed with write-off, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-134" href="#wf-134"></a>
## WF 134 - "Proposal rejected by Provider" (TRIGGER)
### Conditions:
- All:
  - **portfolio_status** is _Waiting for acceptance by Provider_ 
- At least one:
### Tasks:
- set Status = Proposal rejected by Provider
- Send a Notification to all users with Approver role: &quot;Portfolio proposal rejected by Provider&quot;
### Tasks with Details:
- set Status = Proposal rejected by Provider
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Proposal rejected by Provider (rawtext)"
    }, 
    ``` 

- Send a Notification to all users with Approver role: &quot;Portfolio proposal rejected by Provider&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio proposal <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> rejected by Provider, recipients: Roles:H10, title: Portfolio proposal rejected by Provider, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-135" href="#wf-135"></a>
## WF 135 - "ON_CHANGE_OF_HURDLE_COLLECTIONS" (ON_MODIFY)
### Conditions:
- All:
  - **remaining_to_hurdle** has changed 
  - **remaining_to_hurdle** equal to _0_ 
  - **total_collections** greater than _0_ 
  - **hurdle** greater than _0_ 
- At least one:
### Tasks:
- set Status = Closed, Closed date = current date
### Tasks with Details:
- set Status = Closed, Closed date = current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_status": "Closed (rawtext)",
      "closed_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-137" href="#wf-137"></a>
## WF 137 - "On creating record set Created date" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- set Created date
### Tasks with Details:
- set Created date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "created_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-278" href="#wf-278"></a>
## WF 278 - "ON_CHANGE_FINANCIAL_SUMMARY" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **total_number_of_claims** has changed 
  - **total_number_of_aob_claims** has changed 
  - **total_claim_value** has changed 
  - **total_num_of_rejected_claims** has changed 
  - **total_value_of_rejected_claims** has changed 
  - **adjusted_claim_value** has changed 
  - **total_number_accepted_claims** has changed 
  - **total_value_accepted_claims** has changed 
  - **total_adjusted_face_value** has changed 
  - **total_purchase_price** has changed 
  - **total_factor_fee** has changed 
  - **hurdle** has changed 
  - **hurdle_percent** has changed 
  - **total_number_of_paid_claims** has changed 
  - **total_number_of_buybacks** has changed 
  - **total_buybacks** has changed 
  - **total_voluntary_collections** has changed 
  - **total_presuit_collections** has changed 
  - **total_litigated_collections** has changed 
  - **total_collections** has changed 
  - **total_balance_owed** has changed 
  - **remaining_to_hurdle** has changed 
  - **total_profit** has changed 
  - **portfolio_write_off** has changed 
  - **refundable_reserve** has changed 
  - **total_limit_reserve** has changed 
  - **total_reserves** has changed 
  - **opened_date** has changed 
  - **closed_date** has changed 
### Tasks:
- WF Provider.CALCULATE_KPIS_FROM_PORTFOLIOS
### Tasks with Details:
- WF Provider.CALCULATE_KPIS_FROM_PORTFOLIOS
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Providers",
      "otherWorkflowId": "CALCULATE_KPIS_FROM_PORTFOLIOS",
      "otherWorkflowField": "provider",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-282" href="#wf-282"></a>
## WF 282 - "INFO: Program or Investor is not set or no Claims attached" (TRIGGER)
### Conditions:
- All:
- At least one:
  - **program** is empty 
  - **total_number_of_claims** equal to _0_ 
### Tasks:
### Tasks with Details:
<a id="user-content-wf-389" href="#wf-389"></a>
## WF 389 - "ON_CHANGE_ASSIGNED_TO" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **assigned_user_id** has changed 
  - **assigned_user_id** is not _18_ 
- At least one:
### Tasks:
- Send notification to Assigned to
### Tasks with Details:
- Send notification to Assigned to
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio ID: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a>, recipients: fromField-assigned_user_id, title: A Portfolio was assigned to you, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-402" href="#wf-402"></a>
## WF 402 - "STOP_IF_MORE_CLAIMS_TO_UNDERWRITE" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CF STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
### Tasks with Details:
- call CF STOP_IF_MORE_CLAIMS_TO_UNDERWRITE
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: stopIfMoreClaimsToUnderwrite}, 
    ``` 

<a id="user-content-wf-438" href="#wf-438"></a>
## WF 438 - "New e-mail received (Portfolio)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send Notification to Assigned to: attaching an e-mail to Portfolio
### Tasks with Details:
- Send Notification to Assigned to: attaching an e-mail to Portfolio
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: The e-mail has been attached to the Portfolio: <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a>, recipients: fromField-assigned_user_id, title: New e-mail received, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-687" href="#wf-687"></a>
## WF 687 - "ON_CHANGE_STATUS_CLOSED" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio_status** has changed to _Closed_ 
  - **remaining_to_hurdle** equal to _0_ 
- At least one:
### Tasks:
- Closed date = current date
- Send a Notification to Assigned to: &quot;Portfolio closed (hurdle was filled)&quot;
### Tasks with Details:
- Closed date = current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "closed_date": "get_date('today') (expression)"
    }, 
    ``` 

- Send a Notification to Assigned to: &quot;Portfolio closed (hurdle was filled)&quot;
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Portfolio <a href="$(record : CrmDetailViewURL)$">$(record : portfolio_id)$</a> closed (hurdle was filled), recipients: fromField-assigned_user_id, title: Portfolio closed (hurdle was filled), skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-729" href="#wf-729"></a>
## WF 729 - "Release Reserves To Provider" (ON_SCHEDULE)
### Conditions:
- All:
- At least one:
### Tasks:
- CF releaseReservesToProvider
### Tasks with Details:
- CF releaseReservesToProvider
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: releaseReservesToProvider}, 
    ``` 

<a id="user-content-wf-737" href="#wf-737"></a>
## WF 737 - "CREATE_HO_ATTORNEY_CONFIRMATION_REQUESTS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CREATE_HO_ATTORNEY_CONFIRMATION_REQUESTS
### Tasks with Details:
- call CREATE_HO_ATTORNEY_CONFIRMATION_REQUESTS
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createHOAttorneyConfirmationRequests}, 
    ``` 

<a id="user-content-wf-739" href="#wf-739"></a>
## WF 739 - "Send request for confirmation to HO Attorneys" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- call CREATE_HO_ATTORNEY_CONFIRMATION_REQUESTS
### Tasks with Details:
- call CREATE_HO_ATTORNEY_CONFIRMATION_REQUESTS
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createHOAttorneyConfirmationRequests}, 
    ``` 

<a id="user-content-wf-811" href="#wf-811"></a>
## WF 811 - "Reset Status to New" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _DOTS (H46)_ 
- At least one:
### Tasks:
- reset Status to New
### Tasks with Details:
- reset Status to New
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: resetToNew}, 
    ``` 

<a id="user-content-wf-830" href="#wf-830"></a>
## WF 830 - "Claims sent successfully (email to Provider)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Email to Provider: Claims sent successfully
### Tasks with Details:
- Email to Provider: Claims sent successfully
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N154, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-831" href="#wf-831"></a>
## WF 831 - "Claims sent with error (email to Provider)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Email to Provider: Claims sent with error
### Tasks with Details:
- Email to Provider: Claims sent with error
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N155, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-832" href="#wf-832"></a>
## WF 832 - "Portfolio open for collection of new claims" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio_status** has changed to _New_ 
  - **(provider : (Providers) portal_is_active)** is _1_ 
- At least one:
### Tasks:
- Email to Provider: Portfolio open for collection of new claims
### Tasks with Details:
- Email to Provider: Portfolio open for collection of new claims
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N159, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-842" href="#wf-842"></a>
## WF 842 - "Claims submitted by the user" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Email to underwriters: Claims submitted by the user
### Tasks with Details:
- Email to underwriters: Claims submitted by the user
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N160, email: [], relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-866" href="#wf-866"></a>
## WF 866 - "RECALCULATE_ALL" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call recalculateAll
### Tasks with Details:
- call recalculateAll
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

