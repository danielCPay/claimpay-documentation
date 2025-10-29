# Module: Cases
<a id="user-content-wf-105" href="#wf-105"></a>
## WF 105 - "On change of AOB/DTP Attorney" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **attorney** has changed 
  - **lock_automation** is _0_ 
  - **(attorney : (Attorneys) attorney_name)** does not contain _---_ 
- At least one:
### Tasks:
- copy Attorney_user from Attorneys module to Assign to
### Tasks with Details:
- copy Attorney_user from Attorneys module to Assign to
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-106" href="#wf-106"></a>
## WF 106 - "On create - default Case ID" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **case_id** is empty 
  - **case_id** is _(New)_ 
### Tasks:
- set default Case ID
- ~create a task for SUPERVISORS group with Task Name: Review @@CASE_ID@@ to determine that case is ready for start of workflow automation.~
- If PDC Case created set Pre-Litigation Status to &quot;Presuit-Demand Sent&quot; and set Settlers
### Tasks with Details:
- set default Case ID
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: setNewCaseId}, 
    ``` 

- ~~create a task for SUPERVISORS group with Task Name: Review @@CASE_ID@@ to determine that case is ready for start of workflow automation.~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ to determine that case is ready for start of workflow automation' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)"
      }
    }, 
    ``` 

- If PDC Case created set Pre-Litigation Status to &quot;Presuit-Demand Sent&quot; and set Settlers
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CURRENT||Cases",
      "otherWorkflowId": "If PDC Case created",
      "otherWorkflowField": "special-current",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-107" href="#wf-107"></a>
## WF 107 - "On change of Stage" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **stage** has changed 
- At least one:
### Tasks:
- For each Claim: set Claim.Basic Litigation Status := Case.Stage
### Tasks with Details:
- For each Claim: set Claim.Basic Litigation Status := Case.Stage
    ``` 
    taskType: VTUpdateRelatedFieldTask, active: true 
    taskTypeParameters: {
      "Claims::basic_litigation_status": "stage (fieldname)"
    }, 
    ``` 

<a id="user-content-wf-126" href="#wf-126"></a>
## WF 126 - "RECALCULATE_FROM_CLAIMS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CF recalculateFromClaims
- call CF recalculateFromCase
### Tasks with Details:
- call CF recalculateFromClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromClaims}, 
    ``` 

- call CF recalculateFromCase
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromCase}, 
    ``` 

<a id="user-content-wf-172" href="#wf-172"></a>
## WF 172 - "Change of Pre-Litigation Status status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "pre_litigation_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Pre-Litigation (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-177" href="#wf-177"></a>
## WF 177 - "Change of Complaint Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "complaint_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Complaint (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-178" href="#wf-178"></a>
## WF 178 - "Change of Plaintiff Discovery Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "plaintiff_discovery_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Plaintiff Discovery (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-179" href="#wf-179"></a>
## WF 179 - "Change of Plaintiff Deposition Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "plaintiff_deposition_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Plaintiff Deposition (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-180" href="#wf-180"></a>
## WF 180 - "Change of Defendant Discovery Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is not empty 
- At least one:
### Tasks:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "defendant_discovery_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Defendant Discovery (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-181" href="#wf-181"></a>
## WF 181 - "Change of Defendant Deposition Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "defendant_deposition_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Defendant Deposition (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-182" href="#wf-182"></a>
## WF 182 - "Change of Mediation Arbitration Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_arbitration_status** has changed 
  - **mediation_arbitration_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "mediation_arbitration_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Mediation Arbitration (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-183" href="#wf-183"></a>
## WF 183 - "Change of Plaintiff MSJ Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is not empty 
- At least one:
### Tasks:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "plaintiff_msj_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Plaintiff MSJ (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-184" href="#wf-184"></a>
## WF 184 - "Change of Defendant MSJ Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "defendant_msj_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Defendant MSJ (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-185" href="#wf-185"></a>
## WF 185 - "Change of Trial Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **trial_status** has changed 
  - **trial_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "trial_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Trial (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-186" href="#wf-186"></a>
## WF 186 - "Change of Settlement Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "settlement_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Settlement (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-187" href="#wf-187"></a>
## WF 187 - "Change of Appeal Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appeal_status** has changed 
  - **appeal_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "appeal_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Appeal (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-188" href="#wf-188"></a>
## WF 188 - "Pre-Litigation Status: Presuit - Demand Sent  does not change within 10 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _10_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
  - **status** is _Presuit - Demand Sent_ 
  - **case_id** starts with _PDC_ 
- At least one:
### Tasks:
- change status to &quot;Presuit - 2nd Demand Sent&quot;
### Tasks with Details:
- change status to &quot;Presuit - 2nd Demand Sent&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Presuit - 2nd Demand Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-189" href="#wf-189"></a>
## WF 189 - "Status UNDECIDED does not change within 14 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **status** is _UNDECIDED_ 
  - **type_of_claim** is _HO_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
-  create task for HOS PRE-SUIT to &quot;Follow up with prospective client regarding Retainer&quot;
### Tasks with Details:
-  create task for HOS PRE-SUIT to &quot;Follow up with prospective client regarding Retainer&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with prospective client regarding Retainer for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-190" href="#wf-190"></a>
## WF 190 - "Status UNDECIDED does not change within 90 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _90_ 
  - **lock_automation** is _0_ 
  - **status** is _UNDECIDED_ 
  - **type_of_claim** is _HO_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- create task for  HOS PRE-SUIT to &quot;Notify Referral Source that we are closing file&quot;
### Tasks with Details:
- create task for  HOS PRE-SUIT to &quot;Notify Referral Source that we are closing file&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Notify Referral Source that we are closing file re: @@CASE_ID@@ @@INJUREDPARTY_NAME@@ due to failure to return retainer' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-191" href="#wf-191"></a>
## WF 191 - "Status of Pre-Litigation change to New Case Entered - HO" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _New Case Entered - HO_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Referral Date
### Tasks with Details:
- set Referral Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "referral_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-192" href="#wf-192"></a>
## WF 192 - "Pre-Litigation change to New Case Entered - Missing info" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _New Case Entered - Missing info_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to  HOS PRE-SUIT to &quot;Obtain Missing Info&quot;
### Tasks with Details:
- create new task to  HOS PRE-SUIT to &quot;Obtain Missing Info&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Obtain Missing Info for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-194" href="#wf-194"></a>
## WF 194 - "Pre-Litigation Status change to Presuit - Paid and Closed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - Paid and Closed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Pre-Litigation Status to Voluntary Payment in Full - 10% PROVIDER
### Tasks with Details:
- set Pre-Litigation Status to Voluntary Payment in Full - 10% PROVIDER
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Voluntary Payment in Full - 10% PROVIDER (rawtext)",
      "final_status": "CLOSED (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-195" href="#wf-195"></a>
## WF 195 - "Pre-Litigation Status change to Presuit - Paid No Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - Paid No Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Pre-Litigation Status to Voluntary Payment Offer - No fees
### Tasks with Details:
- set Pre-Litigation Status to Voluntary Payment Offer - No fees
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Voluntary Payment Offer - No fees (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-196" href="#wf-196"></a>
## WF 196 - "If status = Presuit - Settlement with fees for 45 days create task for RECEIVABLES to Review if Payment Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Presuit - Settlement with fees_ 
  - **lock_automation** is _0_ 
  - **status_age** equal to _45_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- create task  for RECEIVABLES to &quot;Review if Payment Received in and Closure of Case&quot;
### Tasks with Details:
- create task  for RECEIVABLES to &quot;Review if Payment Received in and Closure of Case&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review if Payment Received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ and Closure of Case' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "RECEIVABLES (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-197" href="#wf-197"></a>
## WF 197 - "Pre-Litigation change to 10-Day Demand - Error" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Error_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to PDC PRE-SUIT to &quot;Review Error in&quot;
### Tasks with Details:
- create new task to PDC PRE-SUIT to &quot;Review Error in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Error in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-198" href="#wf-198"></a>
## WF 198 - "Pre-Litigation change to 10-Day Demand - Missing info" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Missing info_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to PDC PRE-SUIT to &quot;Obtain Missing Info in&quot;
### Tasks with Details:
- create new task to PDC PRE-SUIT to &quot;Obtain Missing Info in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Obtain Missing Info in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-199" href="#wf-199"></a>
## WF 199 - "Pre-Litigation change to 10-Day Demand - Non-Conforming AOB" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Non-Conforming AOB_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to PDC PRE-SUIT to &quot;Review AOB in for Conformity&quot;
### Tasks with Details:
- create new task to PDC PRE-SUIT to &quot;Review AOB in for Conformity&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review AOB in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for Conformity' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-200" href="#wf-200"></a>
## WF 200 - "Pre-Litigation Status change to 10-Day Demand - Paid Through Client" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Paid Through Client_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Final Status to Closed, set Voluntary Payment Date
- send e-mail template &quot;10 Day Demand Payment Closing Letter&quot;
### Tasks with Details:
- set Final Status to Closed, set Voluntary Payment Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "final_status": "CLOSED (rawtext)",
      "voluntary_payment_date": "get_date('today') (expression)"
    }, 
    ``` 

- send e-mail template &quot;10 Day Demand Payment Closing Letter&quot;
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N49, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-201" href="#wf-201"></a>
## WF 201 - "Pre-Litigation Status change to 10-Day Demand - with Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - with Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Pre-Litigation State to Voluntary Payment in Full - 10% PROVIDER
### Tasks with Details:
- set Pre-Litigation State to Voluntary Payment in Full - 10% PROVIDER
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Voluntary Payment in Full - 10% PROVIDER (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-202" href="#wf-202"></a>
## WF 202 - "Pre-Litigation change to 10-Day Demand - Possible Payment Rcvd - Review" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Possible Payment Rcvd - Review_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to PDC PRE-SUIT to &quot;Review for possible Payment in and determine next step&quot;
### Tasks with Details:
- create new task to PDC PRE-SUIT to &quot;Review for possible Payment in and determine next step&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review for possible Payment in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ and determine next step' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-203" href="#wf-203"></a>
## WF 203 - "Pre-Litigation change to 10-Day Demand - Requested Mediation" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Requested Mediation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~set 10-Day Demand Received~
-  create new task to ST - ADR to &quot;Schedule Mediation in for @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot;
### Tasks with Details:
- ~~set 10-Day Demand Received~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "10_day_demand_received": "get_date('today') (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

-  create new task to ST - ADR to &quot;Schedule Mediation in for @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Mediation in for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "ST - ADR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-204" href="#wf-204"></a>
## WF 204 - "Pre-Litigation change to 10-Day Demand - Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~set 10-Day Demand Sent~
- ~draft package &quot;10-day Demand Letter Package&quot;~
- ~send email template &quot;10-Day Demand Letter&quot;~
- ~send email template &quot;10-day Demand Letter Copy - to Insured~
- Generate package &quot;10-day Demand Letter Package&quot;
- set 10-Day Demand Sent
-  create tasks when a 10-day demand package for &quot;Universal Property &amp;amp; Casualty Insurance Company&quot; is created
### Tasks with Details:
- ~~set 10-Day Demand Sent~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "10_day_demand_sent": "get_date('today') (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- ~~draft package &quot;10-day Demand Letter Package&quot;~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Draft package &quot;10-day Demand Letter Package&quot; (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N16') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~send email template &quot;10-Day Demand Letter&quot;~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N116, email: [], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- ~~send email template &quot;10-day Demand Letter Copy - to Insured~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N117, email: [], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- Generate package &quot;10-day Demand Letter Package&quot;
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: 10-day Demand Letter Package, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- set 10-Day Demand Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "10_day_demand_sent": "get_date('today') (expression)"
    }, 
    ``` 

-  create tasks when a 10-day demand package for &quot;Universal Property &amp;amp; Casualty Insurance Company&quot; is created
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Documents",
      "otherWorkflowId": "Create tasks for Universal Property &amp; Casualty Insurance Company",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-205" href="#wf-205"></a>
## WF 205 - "Status Pre-Litigation 10-Day Demand - Sent does not change within 16 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _10-Day Demand - Sent_ 
  - **status_age** equal to _16_ 
  - **lock_automation** is _0_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- change Pre-Litigation Status Ready for Litigation
### Tasks with Details:
- change Pre-Litigation Status Ready for Litigation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Ready for Litigation (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-206" href="#wf-206"></a>
## WF 206 - "If Status = 10-Day Demand - Settled Awaiting Payment for 45 days for RECEIVABLES to Review if Payment Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _10-Day Demand - Settled Awaiting Payment_ 
  - **status_age** equal to _45_ 
  - **lock_automation** is _0_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- create task for RECEIVABLES to &quot;Review if Payment Received in for, if payment Received change status&quot;
### Tasks with Details:
- create task for RECEIVABLES to &quot;Review if Payment Received in for, if payment Received change status&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review if Payment Received in for @@CASE_ID@@ @@INJUREDPARTY_NAME@@, if payment Received change status' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "RECEIVABLES (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-207" href="#wf-207"></a>
## WF 207 - "Pre-Litigation change to 10-Day Demand Response - Denied (failure to cooperate)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand Response - Denied (failure to cooperate)_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set 10-day Demand Response Received
- send email &quot;Letter to Client - Failure to cooperate&quot; to Client
### Tasks with Details:
- set 10-day Demand Response Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "10_day_demand_resp_receive": "get_date('today') (expression)"
    }, 
    ``` 

- send email &quot;Letter to Client - Failure to cooperate&quot; to Client
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N32, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-208" href="#wf-208"></a>
## WF 208 - "Pre-Litigation change to 10-Day Demand Response - Offer pay in full" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand Response - Offer pay in full_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date 10-Day Demand Received
### Tasks with Details:
- set date 10-Day Demand Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "10_day_demand_received": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-209" href="#wf-209"></a>
## WF 209 - "Pre-Litigation change to 10-Day Demand Response - Partial offer" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand Response - Partial offer_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date 10-Day Demand Received
### Tasks with Details:
- set date 10-Day Demand Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "10_day_demand_received": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-210" href="#wf-210"></a>
## WF 210 - "Pre-Litigation change to Voluntary Payment in Full -10-day - 10%" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Voluntary Payment in Full - 10% PROVIDER_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Voluntary Payment Date
- send email template &quot;Pre-Litigation Settlement Statement&quot; to PROVIDER_EMAIL
- create task for SUPERVISOR to &quot;Review file for to Close&quot;
### Tasks with Details:
- set date Voluntary Payment Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_payment_date": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;Pre-Litigation Settlement Statement&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N50, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for SUPERVISOR to &quot;Review file for to Close&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to Close' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-211" href="#wf-211"></a>
## WF 211 - "Pre-Litigation change to Voluntary Payment Offer - No fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Voluntary Payment Offer - No fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date 10-Day Demand Received
- send e-mail template &quot;Pre-Litigation Payment Closing Letter&quot;
- create task for SUPERVISOR to &quot;Review for file to Close&quot;
### Tasks with Details:
- set date 10-Day Demand Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_payment_date": "get_date('today') (expression)"
    }, 
    ``` 

- send e-mail template &quot;Pre-Litigation Payment Closing Letter&quot;
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N51, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for SUPERVISOR to &quot;Review for file to Close&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ file to Close' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-224" href="#wf-224"></a>
## WF 224 - "Plaintiff MSJ Status change to Ps MSJ Drafted" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is _Ps MSJ Drafted_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Ps MSJ Drafted
### Tasks with Details:
- set date Ps MSJ Drafted
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ps_msj_drafted": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-225" href="#wf-225"></a>
## WF 225 - "Plaintiff MSJ Status change to Ps MSJ Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is _Ps MSJ Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Ps MSJ Filed
- create task for Scheduling Team - Hearings to &quot;Coordinate Special Set Hearing on Ps MSJ within the next 45-60 days in&quot;
### Tasks with Details:
- set date Ps MSJ Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ps_msj_filed": "get_date('today') (expression)"
    }, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Coordinate Special Set Hearing on Ps MSJ within the next 45-60 days in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Special Set Hearing on Ps MSJ within the next 45-60 days in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-226" href="#wf-226"></a>
## WF 226 - "Ps MSJ Hearing Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_msj_hearing_date** has changed 
  - **ps_msj_hearing_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff MSJ Status to Ps MSJ Set for Hearing, Ds Response to MSJ Due to  20 days before date in Ps MSJ Hearing Date
### Tasks with Details:
- set Plaintiff MSJ Status to Ps MSJ Set for Hearing, Ds Response to MSJ Due to  20 days before date in Ps MSJ Hearing Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_msj_status": "Ps MSJ Set for Hearing (rawtext)",
      "ds_response_to_msj_due": "get_workingday(0, add_days(ps_msj_hearing_date, -20)) (expression)"
    }, 
    ``` 

<a id="user-content-wf-227" href="#wf-227"></a>
## WF 227 - "Plaintiff MSJ Status change to Ds Response to MSJ Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is _Ds Response to MSJ Received_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Ds Response to MSJ Received
- create task for Assigned Attorney to &quot;Review Ds Response to Ps MSJ in&quot;
### Tasks with Details:
- set date Ds Response to MSJ Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_response_to_msj_received": "get_date('today') (expression)"
    }, 
    ``` 

- create task for Assigned Attorney to &quot;Review Ds Response to Ps MSJ in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Ds Response to Ps MSJ in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-228" href="#wf-228"></a>
## WF 228 - "Plaintiff MSJ Status change to Ps MSJ Granted" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is _Ps MSJ Granted_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ps MSJ
- create task for ASSIGNED ATTORNEY to &quot;Draft Motion for Entitlement to Attorney's Fees and Costs in&quot;
### Tasks with Details:
- set date Order on Ps MSJ
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "order_on_ps_msj": "get_date('today') (expression)"
    }, 
    ``` 

- create task for ASSIGNED ATTORNEY to &quot;Draft Motion for Entitlement to Attorney's Fees and Costs in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Motion for Entitlement to Attorneys Fees and Costs in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-229" href="#wf-229"></a>
## WF 229 - "Plaintiff MSJ Status change to Ps MSJ Denied" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_msj_status** has changed 
  - **plaintiff_msj_status** is _Ps MSJ Denied_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ps MSJ
- create task for ASSIGNED ATTORNEY to &quot;Review Order Denying Ps MSJ in&quot;
### Tasks with Details:
- set date Order on Ps MSJ
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "order_on_ps_msj": "get_date('today') (expression)"
    }, 
    ``` 

- create task for ASSIGNED ATTORNEY to &quot;Review Order Denying Ps MSJ in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Order Denying Ps MSJ in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-230" href="#wf-230"></a>
## WF 230 - "Defendant MSJ Status change to Ds MSJ Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is _Ds MSJ Received_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Ds MSJ Received
- create task for ASSIGNED ATTORNEY to &quot;Review Ds MSJ and Draft Response in&quot;
### Tasks with Details:
- set date Ds MSJ Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_msj_received": "get_date('today') (expression)"
    }, 
    ``` 

- create task for ASSIGNED ATTORNEY to &quot;Review Ds MSJ and Draft Response in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Ds MSJ and Draft Response in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-231" href="#wf-231"></a>
## WF 231 - "Ds MSJ Hearing Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_msj_hearing_date** has changed 
  - **ds_msj_hearing_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set  Defendant MSJ Status to Ds MSJ Set for Hearing, set Ps Response to MSJ Due to  21 days before date in Ds MSJ Hearing Date
### Tasks with Details:
- set  Defendant MSJ Status to Ds MSJ Set for Hearing, set Ps Response to MSJ Due to  21 days before date in Ds MSJ Hearing Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_msj_status": "Ds MSJ Set for Hearing (rawtext)",
      "ps_response_to_msj_due": "get_workingday(0, add_days( ds_msj_hearing_date, -21)) (expression)"
    }, 
    ``` 

<a id="user-content-wf-232" href="#wf-232"></a>
## WF 232 - "Defendant MSJ Status change to Ps Response to MSJ Drafted" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is _Ps Response to MSJ Drafted_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for LEGAL ASSISTANT to &quot;File Ps Response to Ds MSJ in&quot;
### Tasks with Details:
- create task for LEGAL ASSISTANT to &quot;File Ps Response to Ds MSJ in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'File Ps Response to Ds MSJ in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-233" href="#wf-233"></a>
## WF 233 - "Defendant MSJ Status change to Ps Response to MSJ Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is _Ps Response to MSJ Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Ps Response to MSJ Filed
### Tasks with Details:
- set date Ps Response to MSJ Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ps_response_to_msj_filed": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-234" href="#wf-234"></a>
## WF 234 - "Defendant MSJ Status change toDs MSJ Granted" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is _Ds MSJ Granted_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ds MSJ
- create task for ASSIGNED ATTORNEY to &quot;Review Order Granting Ds MSJ and determine whether there are grounds for appeal in&quot;
### Tasks with Details:
- set date Order on Ds MSJ
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "order_on_ds_msj": "get_date('today') (expression)"
    }, 
    ``` 

- create task for ASSIGNED ATTORNEY to &quot;Review Order Granting Ds MSJ and determine whether there are grounds for appeal in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Order Granting Ds MSJ and determine whether there are grounds for appeal in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-235" href="#wf-235"></a>
## WF 235 - "Defendant MSJ Status change to Ds MSJ Denied" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_msj_status** has changed 
  - **defendant_msj_status** is _Ds MSJ Denied_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ds MSJ
### Tasks with Details:
- set date Order on Ds MSJ
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "order_on_ds_msj": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-236" href="#wf-236"></a>
## WF 236 - "Appeal Status change to Notice of Appeal Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appeal_status** has changed 
  - **appeal_status** is _Notice of Appeal Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Notice of Appeal
### Tasks with Details:
- set date Notice of Appeal
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "notice_of_appeal": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-239" href="#wf-239"></a>
## WF 239 - "Settlement Status change to SETTLED - Awaiting Release (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Awaiting Release_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- set Settlement Date
- Create &quot;Notice of Settlement HO&quot;
- send documents to Peru Queue for filing
### Tasks with Details:
- set Settlement Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_date": "get_date('today') (expression)"
    }, 
    ``` 

- Create &quot;Notice of Settlement HO&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N209, conditionString: , stopOnError: on}, 
    ``` 

- send documents to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Notice of Settlement HO for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-243" href="#wf-243"></a>
## WF 243 - "Settlement Status change to SETTLED - Global Awaiting Release" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Global Awaiting Release_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Settlement Date
### Tasks with Details:
- set date Settlement Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-244" href="#wf-244"></a>
## WF 244 - "Settlement Status change to SETTLED - Proposed Release Rcvd" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Proposed Release Rcvd_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Proposed Release and send to Client in&quot;
### Tasks with Details:
- Create task for Assigned Attorney to &quot;Review Proposed Release and send to Client in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Proposed Release and send to Client in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-246" href="#wf-246"></a>
## WF 246 - "Settlement Status change to SETTLED - Global Release Sent to Client" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Global Release Sent to Client_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Release Sent to Client
### Tasks with Details:
- set date Release Sent to Client
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "release_sent_to_client": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-247" href="#wf-247"></a>
## WF 247 - "Settlement Status change to SETTLED - Release Sent to Client" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Release Sent to Client_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Release Sent to Client
### Tasks with Details:
- set date Release Sent to Client
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "release_sent_to_client": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-248" href="#wf-248"></a>
## WF 248 - "Status SETTLED - Release Sent to Client  does not change within 15 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _SETTLED - Release Sent to Client_ 
  - **status_age** equal to _15_ 
  - **lock_automation** is _0_ 
  - **stage** is _Settlement_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Follow up with client regarding Release&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Follow up with client regarding Release&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with client regarding Release in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-249" href="#wf-249"></a>
## WF 249 - "Settlement Status change to SETTLED - Executed Release Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Executed Release Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Executed Release Sent to OC
### Tasks with Details:
- set date Executed Release Sent to OC
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "executed_release_sent_to_oc": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-250" href="#wf-250"></a>
## WF 250 - "Status SETTLED - Executed Release Sent  does not change within 45 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _SETTLED - Executed Release Sent_ 
  - **status_age** equal to _45_ 
  - **lock_automation** is _0_ 
  - **stage** is _Settlement_ 
- At least one:
### Tasks:
- change status to &quot;Settlement Payment Reminder Letter&quot;
### Tasks with Details:
- change status to &quot;Settlement Payment Reminder Letter&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_status": "Settlement Payment Reminder Letter (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-251" href="#wf-251"></a>
## WF 251 - "Settlement Status change to SETTLED - Global Executed Release Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Global Executed Release Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Executed Release Sent to OC
### Tasks with Details:
- set date Executed Release Sent to OC
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "executed_release_sent_to_oc": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-252" href="#wf-252"></a>
## WF 252 - "Settlement Status change to SETTLED &amp; PAID - Benefits Only - Pending Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED &amp; PAID - Benefits Only - Pending Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;F/U with OC regarding Fees Check&quot;
### Tasks with Details:
- create task for Assigned Attorney &quot;F/U with OC regarding Fees Check&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'F/U with OC regarding Fees Check in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-253" href="#wf-253"></a>
## WF 253 - "Settlement Status change to SETTLED &amp; PAID - Fees Only - Pending Benefits" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED &amp; PAID - Fees Only - Pending Benefits_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;F/U with OC regarding Benefits Check&quot;
### Tasks with Details:
- create task for Assigned Attorney &quot;F/U with OC regarding Benefits Check&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'F/U with OC regarding Benefits Check in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-254" href="#wf-254"></a>
## WF 254 - "Status Settlement Payment Reminder Letter  does not change within 14 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Settlement Payment Reminder Letter_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Settlement_ 
- At least one:
### Tasks:
- change Settlement Status to &quot;Settlement Payment Reminder Letter - 2&quot;
### Tasks with Details:
- change Settlement Status to &quot;Settlement Payment Reminder Letter - 2&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_status": "Settlement Payment Reminder Letter - 2 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-255" href="#wf-255"></a>
## WF 255 - "Settlement Status change to Settlement Payment Reminder Letter" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _Settlement Payment Reminder Letter_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Settlement Payment Reminder&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Settlement Payment Reminder&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N35, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-256" href="#wf-256"></a>
## WF 256 - "Settlement Status change to Settlement Payment Reminder Letter - 2" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _Settlement Payment Reminder Letter - 2_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  e-mail template &quot;Settlement Payment Reminder Letter - 2&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
-  e-mail template &quot;Settlement Payment Reminder Letter - 2&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N36, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-257" href="#wf-257"></a>
## WF 257 - "Status Settlement Payment Reminder Letter - 2  does not change within 14 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Settlement Payment Reminder Letter - 2_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Settlement_ 
- At least one:
### Tasks:
- change status to &quot;Settlement Payment Reminder Letter - Final&quot;
### Tasks with Details:
- change status to &quot;Settlement Payment Reminder Letter - Final&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_status": "Settlement Payment Reminder Letter - Final (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-258" href="#wf-258"></a>
## WF 258 - "Settlement Status change to Settlement Payment Reminder Letter - Final" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _Settlement Payment Reminder Letter - Final_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Settlement Payment Reminder - FINAL&quot; to OPPOSING_COUNSEL_EMAI
### Tasks with Details:
- send e-mail template &quot;Settlement Payment Reminder - FINAL&quot; to OPPOSING_COUNSEL_EMAI
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N37, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-259" href="#wf-259"></a>
## WF 259 - "Status Settlement Payment Reminder Letter - Final  does not change within 14 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Settlement Payment Reminder Letter - Final_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Settlement_ 
- At least one:
### Tasks:
- change Settlement Status to &quot;Motion to Compel Settlement&quot;
### Tasks with Details:
- change Settlement Status to &quot;Motion to Compel Settlement&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_status": "Motion to Compel Settlement (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-260" href="#wf-260"></a>
## WF 260 - "Settlement Status change to SETTLED &amp; PAID" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED &amp; PAID_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set date Settlement Payment Received
- Create &quot;Voluntary Dismissal with Prejudice&quot;
- create Task for Peru Team to &quot;Voluntary Dismissal with Prejudice - send filing&quot; 
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
### Tasks with Details:
- set date Settlement Payment Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_payment_received": "get_date('today') (expression)"
    }, 
    ``` 

- Create &quot;Voluntary Dismissal with Prejudice&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N186, conditionString: , stopOnError: on}, 
    ``` 

- create Task for Peru Team to &quot;Voluntary Dismissal with Prejudice - send filing&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Voluntary Dismissal with Prejudice for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file to determine if file can be Closed in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-261" href="#wf-261"></a>
## WF 261 - "Settlement Status change to SETTLED &amp; PAID - Presuit w Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED &amp; PAID - Presuit w Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
### Tasks with Details:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file to determine if file can be Closed in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-262" href="#wf-262"></a>
## WF 262 - "Settlement Status change to Motion to Compel Settlement" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _Motion to Compel Settlement_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Create &quot;Motion to Compel Settlement&quot;
- send &quot;Motion to Compel Settlement&quot; to Peru Queue for filing
- Create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Plaintiff's Motion to Compel Settlement in&quot;
- set Motion to Compel Settlement
### Tasks with Details:
- Create &quot;Motion to Compel Settlement&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N197, conditionString: , stopOnError: on}, 
    ``` 

- send &quot;Motion to Compel Settlement&quot; to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Motion to Compel Settlement for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Plaintiff's Motion to Compel Settlement in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Plaintiffs Motion to Compel Settlement in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Motion to Compel Settlement
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "motion_to_compel_settlement": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-269" href="#wf-269"></a>
## WF 269 - "Appraisal Status change to NOI - Appraisal Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appraisal_status** has changed to _NOI - Appraisal Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send task to assigned assistant to &quot;Contact client&quot;
### Tasks with Details:
- send task to assigned assistant to &quot;Contact client&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "Appraisal Requested - Contact client (rawtext)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-270" href="#wf-270"></a>
## WF 270 - "Pre-Litigation: NOI - Filed does not change within 16 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _NOI - Filed_ 
  - **status_age** equal to _16_ 
  - **lock_automation** is _0_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- set Pre-Litigation Status to Review for Litigation
### Tasks with Details:
- set Pre-Litigation Status to Review for Litigation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Review for Litigation (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-271" href="#wf-271"></a>
## WF 271 - "Pre-Litigation change to NOI - Information Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _NOI - Information Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to HOS PRE-SUIT to &quot;Review NOI Response in for&quot;
### Tasks with Details:
- create new task to HOS PRE-SUIT to &quot;Review NOI Response in for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review NOI Response in for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-272" href="#wf-272"></a>
## WF 272 - "Pre-Litigation change to NOI - Inspection Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _NOI - Inspection Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to HOS PRE-SUIT to &quot;Schedule Inspection for&quot;
### Tasks with Details:
- create new task to HOS PRE-SUIT to &quot;Schedule Inspection for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Inspection for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-273" href="#wf-273"></a>
## WF 273 - "Pre-Litigation change to NOI – Mediation Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _NOI – Mediation Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to ST - ADR to &quot;Schedule Mediation in for&quot;
### Tasks with Details:
- create new task to ST - ADR to &quot;Schedule Mediation in for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Mediation in for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "ST - ADR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-274" href="#wf-274"></a>
## WF 274 - "Pre-Litigation change to NOI - Offer Made" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _NOI - Offer Made_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to HOS PRE-SUIT to &quot;Review NOI Response in &quot;
### Tasks with Details:
- create new task to HOS PRE-SUIT to &quot;Review NOI Response in &quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review NOI Response in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-275" href="#wf-275"></a>
## WF 275 - "Settlement Status change to SETTLED - Awaiting Release (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED - Awaiting Release_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- Create &quot;Notice of Settlement PROVIDER&quot;
- send documents to Peru Queue for filing
- ~Send e-mail template  &quot;Settlement Email - OC&quot; to OPPOSING_COUNSEL_EMAIL~
- ~Send e-mail template &quot;Settlement Email - PROVIDER&quot; to PROVIDER_EMAIL~
- set Settlement Date
### Tasks with Details:
- Create &quot;Notice of Settlement PROVIDER&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N210, conditionString: , stopOnError: on}, 
    ``` 

- send documents to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Notice of Settlement PROVIDER for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- ~~Send e-mail template  &quot;Settlement Email - OC&quot; to OPPOSING_COUNSEL_EMAIL~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N33, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- ~~Send e-mail template &quot;Settlement Email - PROVIDER&quot; to PROVIDER_EMAIL~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N102, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- set Settlement Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-280" href="#wf-280"></a>
## WF 280 - "ON_SCHEDULE_UPDATE_STATUS_AGE" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is not empty 
- At least one:
### Tasks:
- CF calculateStatusAge
### Tasks with Details:
- CF calculateStatusAge
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateStatusAge}, 
    ``` 

<a id="user-content-wf-281" href="#wf-281"></a>
## WF 281 - "ON_CHANGE_STATUS_DATE" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **status_date** has changed 
- At least one:
### Tasks:
- CF calculateStatusAge
### Tasks with Details:
- CF calculateStatusAge
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateStatusAge}, 
    ``` 

<a id="user-content-wf-283" href="#wf-283"></a>
## WF 283 - "Complaint Status change to Case Filed (Total Balance &gt;=15000)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** is _Case Filed_ 
  - **complaint_status** has changed 
  - **lock_automation** is _0_ 
  - **total_balance** greater than or equal to _15000_ 
- At least one:
### Tasks:
- ~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~
- Set Case Filed date
- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $424.35&quot;
### Tasks with Details:
- ~~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Check docket for executed summons for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "due_date": "get_workingday(0, add_days(2)) (expression)"
      }
    }, 
    ``` 

- Set Case Filed date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case_filed": "get_date('today') (expression)"
    }, 
    ``` 

- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $424.35&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "LitigationCosts",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "litigation_cost_name": "'Fililing Fee for Total Balance = $(record : total_balance)$' (expression)",
        "litigation_cost_amount": "424.35 (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-285" href="#wf-285"></a>
## WF 285 - "Complaint Status change to LSOP Case - Pending Pmt" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _LSOP Case - Pending Pmt_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for SUPERVISOR to &quot;Pay LSOP for&quot;
- add entry to Costs Tab/Module for &quot;Service Fee in the amount of $15.55&quot;
- set Complaint Status to LSOP Case - Service Pending
### Tasks with Details:
- add task for SUPERVISOR to &quot;Pay LSOP for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Pay LSOP for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- add entry to Costs Tab/Module for &quot;Service Fee in the amount of $15.55&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "LitigationCosts",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "litigation_cost_name": "Service Fee in the amount of $15.55 (rawtext)",
        "litigation_cost_amount": "15.55 (rawtext)",
        "assigned_user_id": "adminmk (rawtext)"
      }
    }, 
    ``` 

- set Complaint Status to LSOP Case - Service Pending
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "LSOP Case - Service Pending (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-286" href="#wf-286"></a>
## WF 286 - "Complaint Status change to Correction Queue - in Eportal" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Correction Queue - in Eportal_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case mamager to &quot;Review Correction Queue for&quot;
### Tasks with Details:
- add task for Case mamager to &quot;Review Correction Queue for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Correction Queue for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-287" href="#wf-287"></a>
## WF 287 - "Summons Issued changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **summons_issued** has changed 
  - **summons_issued** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~change Complaint status to &quot;Summons - Executed&quot;~
- ~draft package LSOP Package~
- ~task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;~
- Generate package LSOP Package
- task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;
- change Complaint status to &quot;Summons - Executed&quot;
### Tasks with Details:
- ~~change Complaint status to &quot;Summons - Executed&quot;~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "Summons - Executed (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- ~~draft package LSOP Package~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Draft package LSOP Package (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N13') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Go to Dropbox and Upload LSOP Package for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- Generate package LSOP Package
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: LOR Package, conditionString: , shouldSend: on, stopOnError: on}, 
    ``` 

- task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Go to Dropbox and Upload LSOP Package for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Complaint status to &quot;Summons - Executed&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Summons - Executed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-288" href="#wf-288"></a>
## WF 288 - "Complaint Status change to Motion to Compel Answer" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Motion to Compel Answer_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on Motion to Compel Answer&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on Motion to Compel Answer&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Motion to Compel Answer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-289" href="#wf-289"></a>
## WF 289 - "Motion to Dismiss changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **motion_to_dismiss** has changed 
  - **motion_to_dismiss** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Complaint status to Motion to Dismiss
- Create task for Scheduling Team - Hearings to &quot;Confirm with @@ATTORNEY_NAME@@ that MTD in @@CASE ID@@ @@INJUREDPARTY_NAME@@ can be set for hearing; if so, reach out to OC to set hearing 
### Tasks with Details:
- set Complaint status to Motion to Dismiss
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Motion to Dismiss Date (rawtext)"
    }, 
    ``` 

- Create task for Scheduling Team - Hearings to &quot;Confirm with @@ATTORNEY_NAME@@ that MTD in @@CASE ID@@ @@INJUREDPARTY_NAME@@ can be set for hearing; if so, reach out to OC to set hearing 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Confirm with @@ATTORNEY_NAME@@ that MTD in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ can be set for hearing; if so, reach out to OC to set hearing ' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-290" href="#wf-290"></a>
## WF 290 - "Complaint Status change to Motion to Set Aside Dismissal - Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Motion to Set Aside Dismissal - Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Motion to Set Aside Dismissal in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Motion to Set Aside Dismissal in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Motion to Set Aside Dismissal in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-291" href="#wf-291"></a>
## WF 291 - "Complaint Status change to Motion to Set Aside Dismissal- Prepared" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Motion to Set Aside Dismissal- Prepared_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager to &quot;File Motion to Set Aside Dismissal in&quot;
### Tasks with Details:
- create task for Case Manager to &quot;File Motion to Set Aside Dismissal in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'File Motion to Set Aside Dismissal in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-292" href="#wf-292"></a>
## WF 292 - "PTC (Small Claims) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ptc_small_claims** has changed 
  - **ptc_small_claims** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~create &quot;Ps Motion to Invoke Rules and Waive Appearance&quot; document~
- ~draft package Ps Motion to Invoke Rules and Waive Appearance~
- ~add event to calendar &quot;Pre-Trial Conference&quot; for Assign To and Case Manager~
- ~change status to &quot;Pretrial Conference &quot;~
- Create package Ps Motion to Invoke Rules and Waive Appearance
- add event to calendar &quot;Pre-Trial Conference&quot; for Assign To, Case Manager and AOB/DTP attorney
- change Complaint status to &quot;Pretrial Conference &quot;
### Tasks with Details:
- ~~create &quot;Ps Motion to Invoke Rules and Waive Appearance&quot; document~~
    ``` 
    taskType: VTGenerateTemplate, active: false 
    otherParameters: {active: false, template: N140, conditionString: }, 
    ``` 

- ~~draft package Ps Motion to Invoke Rules and Waive Appearance~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "BatchTasks",
      "reference_field": "item",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": " draft package Ps Motion to Invoke Rules and Waive Appearance (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N20') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~add event to calendar &quot;Pre-Trial Conference&quot; for Assign To and Case Manager~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "'Pre-Trial Conference @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ptc_small_claims (expression)",
        "due_date": "ptc_small_claims (expression)",
        "activitytype": "Pre-Trial Conference (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Pre-Trial Conference @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- ~~change status to &quot;Pretrial Conference &quot;~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "Pretrial Conference (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Create package Ps Motion to Invoke Rules and Waive Appearance
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Ps Motion to Invoke Rules and Waive Appearance, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- add event to calendar &quot;Pre-Trial Conference&quot; for Assign To, Case Manager and AOB/DTP attorney
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "'Pre-Trial Conference @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "activitytype": "Pre-Trial Conference (rawtext)",
        "date_start": "ptc_small_claims (expression)",
        "due_date": "ptc_small_claims (expression)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Pre-Trial Conference @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- change Complaint status to &quot;Pretrial Conference &quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Pretrial Conference (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-293" href="#wf-293"></a>
## WF 293 - "Complaint Status change to Dismissed - Failure to Appear PTC" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Dismissed - Failure to Appear PTC_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
### Tasks with Details:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Motion to Set Asside Dismissal for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-294" href="#wf-294"></a>
## WF 294 - "Complaint Status change to Dismissed - Not Served" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Dismissed - Not Served_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
### Tasks with Details:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Motion to Set Asside Dismissal for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-295" href="#wf-295"></a>
## WF 295 - "Complaint Status change to FWOP - need to set aside" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _FWOP - need to set aside_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Draft Motion to Set Aside FWOP for&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Draft Motion to Set Aside FWOP for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Motion to Set Aside FWOP for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-296" href="#wf-296"></a>
## WF 296 - "Answer changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **answer** has changed 
  - **answer** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@~
- ~draft package Reply~
- ~set Complaint status to Answer~
- Generate package Reply
- create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@
- set Complaint status to Answer
### Tasks with Details:
- ~~create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- ~~draft package Reply~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Draft package Reply (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N18') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~set Complaint status to Answer~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "Answer (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Generate package Reply
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Reply, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Complaint status to Answer
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Answer (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-297" href="#wf-297"></a>
## WF 297 - "Answer Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **answer_deadline** has changed 
  - **answer_deadline** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add event to Attorney  and Case Manager calendar &quot;Answer Due in&quot;
### Tasks with Details:
- add event to Attorney  and Case Manager calendar &quot;Answer Due in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "'Answer Due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "date_start": "answer_deadline (fieldname)",
        "due_date": "answer_deadline (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Answer Due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-298" href="#wf-298"></a>
## WF 298 - "Answer field empty 7 days after after Answer Deadline" (ON_SCHEDULE)
### Conditions:
- All:
  - **answer** is empty 
  - **answer_deadline** is not empty 
  - **answer_deadline** days ago _7_ 
- At least one:
### Tasks:
- ~change Complaint status to Answer Overdue~
- ~draft package Motion for Default~
- ~create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;~
- Generate package Motion for Default
- create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;
- change Complaint status to Answer Overdue
### Tasks with Details:
- ~~change Complaint status to Answer Overdue~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "Answer Overdue (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- ~~draft package Motion for Default~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Draft package Motion for Default (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N17') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally set Ps Motion for Default for hearing in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)"
      }
    }, 
    ``` 

- Generate package Motion for Default
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Motion for Default, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally set Ps Motion for Default for hearing in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Complaint status to Answer Overdue
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Answer Overdue (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-299" href="#wf-299"></a>
## WF 299 - "Trial Status change to Motion to Notice of Trial" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **trial_status** has changed 
  - **trial_status** is _Notice of Trial_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set date Notice for Trial
### Tasks with Details:
- Set date Notice for Trial
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "notice_for_trial": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-300" href="#wf-300"></a>
## WF 300 - "Pre-Trial Conference (Trial) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_trial_conference** has changed 
  - **pre_trial_conference** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  add calendar event &quot;Prepare for Pre-Trial Conference&quot; for Assigned Attorney 21 days before date in field
- add calendar event Assigned and Case Manager &quot;Pre-Trial Conference (Trial)&quot; for same date and time &quot;Pre-Trial Conference (Trial)&quot;
### Tasks with Details:
-  add calendar event &quot;Prepare for Pre-Trial Conference&quot; for Assigned Attorney 21 days before date in field
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Prepare for Pre-Trial Conference (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( pre_trial_conference, -21))  (expression)",
        "due_date": "get_workingday(0, add_days( pre_trial_conference, -21))  (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)",
        "notes": "'Prepare for Pre-Trial Conference @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- add calendar event Assigned and Case Manager &quot;Pre-Trial Conference (Trial)&quot; for same date and time &quot;Pre-Trial Conference (Trial)&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Pre-Trial Conference (Trial) (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "pre_trial_conference (fieldname)",
        "due_date": "pre_trial_conference (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Pre-Trial Conference (Trial)  @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-301" href="#wf-301"></a>
## WF 301 - "Trial Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **trial_date** has changed 
  - **trial_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~create task for Scheduling Team - Mediation/Arbitraion to &quot;Immediately add all deadline dates in&quot;~
- calendar event  for Assigned and Case Manager &quot;Trial&quot; for same date and time Trial Date
-  Set Trial Status to Trial Order Received
### Tasks with Details:
- ~~create task for Scheduling Team - Mediation/Arbitraion to &quot;Immediately add all deadline dates in&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Immediately add all deadline dates in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Mediation Arbitration (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- calendar event  for Assigned and Case Manager &quot;Trial&quot; for same date and time Trial Date
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Trial (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "trial_date (fieldname)",
        "due_date": "trial_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "notes": "'Trial @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

-  Set Trial Status to Trial Order Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "trial_status": "Trial Order Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-302" href="#wf-302"></a>
## WF 302 - "Motion in Limine Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **motion_in_limine_deadline** has changed 
  - **motion_in_limine_deadline** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create Ps Motion in Limine
- Send Ps Motion in Limine to Peru Team
### Tasks with Details:
- create Ps Motion in Limine
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N205, conditionString: , stopOnError: on}, 
    ``` 

- Send Ps Motion in Limine to Peru Team
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion in Limine for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-303" href="#wf-303"></a>
## WF 303 - "Joint Pre-Trial Statement Due changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **joint_pre_trial_statement_due** has changed 
  - **joint_pre_trial_statement_due** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create calendar event &quot;Draft Pre-Trial Statement&quot; for Assigned Attorney 10 days before date in field
- add calendar event to Assigned and Case Manager &quot;Joint Pre-Trial Statement Due&quot; for same date and time Joint Pre-Trial Statement Due
- Create task &quot;Draft Pre-Trial Statement @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
### Tasks with Details:
- create calendar event &quot;Draft Pre-Trial Statement&quot; for Assigned Attorney 10 days before date in field
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Draft Pre-Trial Statement (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days(joint_pre_trial_statement_due, -10)) (expression)",
        "due_date": "get_workingday(0, add_days(joint_pre_trial_statement_due, -10)) (expression)",
        "activitytype": "Task (rawtext)",
        "allday": "true:boolean (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Draft Pre-Trial Statement @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- add calendar event to Assigned and Case Manager &quot;Joint Pre-Trial Statement Due&quot; for same date and time Joint Pre-Trial Statement Due
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Joint Pre-Trial Statement Due/Notice of Compliance (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "joint_pre_trial_statement_due (fieldname)",
        "due_date": "joint_pre_trial_statement_due (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Joint Pre-Trial Statement Due/Notice of Compliance  @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- Create task &quot;Draft Pre-Trial Statement @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Pre-Trial Statement @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-304" href="#wf-304"></a>
## WF 304 - "Daubert Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **daubert_deadline** has changed 
  - **daubert_deadline** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- calendar event &quot;File Daubert Motion and Set for hearing&quot; for Assigned Attorney 30 days before date in field
### Tasks with Details:
- calendar event &quot;File Daubert Motion and Set for hearing&quot; for Assigned Attorney 30 days before date in field
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "File Daubert Motion and Set for hearing (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days(daubert_deadline, -30)) (expression)",
        "due_date": "get_workingday(0, add_days(daubert_deadline, -30)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'File Daubert Motion and Set for hearing in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-305" href="#wf-305"></a>
## WF 305 - "Mediation Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_deadline** has changed 
  - **mediation_deadline** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Arbitration - Deadline&quot; in Mediation Arbitration Statge
### Tasks with Details:
- set Arbitration - Deadline&quot; in Mediation Arbitration Statge
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "arbitration_deadline": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-306" href="#wf-306"></a>
## WF 306 - "Trial Status change to Jury Instuctions/Verdict Form Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **trial_status** has changed 
  - **trial_status** is _Jury Instuctions/Verdict Form Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set date Jury Instructions/Verdict Form
### Tasks with Details:
- Set date Jury Instructions/Verdict Form
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "jury_instructions_verdict_form": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-307" href="#wf-307"></a>
## WF 307 - "Calendar Call changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **calendar_call** has changed 
  - **calendar_call** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event &quot;Prepare for Calendar Call&quot; for Assigned Attorney 3 days before date in field Calendar Call
- add calendar event for Assigned and Case Manager  &quot;Calendar Call&quot; for same date and time Calendar Call
### Tasks with Details:
- add calendar event &quot;Prepare for Calendar Call&quot; for Assigned Attorney 3 days before date in field Calendar Call
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Prepare for Calendar Call (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days(calendar_call, -3)) (expression)",
        "due_date": "get_workingday(0, add_days(calendar_call, -3)) (expression)",
        "activitytype": "Task (rawtext)",
        "allday": "true:boolean (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Prepare for Calendar Call in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- add calendar event for Assigned and Case Manager  &quot;Calendar Call&quot; for same date and time Calendar Call
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Calendar Call (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "calendar_call (fieldname)",
        "due_date": "calendar_call (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Calendar Call in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-308" href="#wf-308"></a>
## WF 308 - "Discovery Cut Off Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **discovery_cut_off_date** has changed 
  - **discovery_cut_off_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event &quot;Draft Final Discovery&quot; for Attorney 45 days before date in field Discovery Cut Off Date
- create task &quot;Draft Final Discovery @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
- create Expert discovery package and forward to DropBox
### Tasks with Details:
- add calendar event &quot;Draft Final Discovery&quot; for Attorney 45 days before date in field Discovery Cut Off Date
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Draft Final Discovery (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days(discovery_cut_off_date, -45))  (expression)",
        "due_date": "get_workingday(0, add_days(discovery_cut_off_date, -45))  (expression)",
        "activitytype": "Task (rawtext)",
        "allday": "true:boolean (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Draft Final Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- create task &quot;Draft Final Discovery @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Final Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create Expert discovery package and forward to DropBox
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Expert discovery package, conditionString: , shouldSend: , shouldDropbox: , stopOnError: on}, 
    ``` 

<a id="user-content-wf-309" href="#wf-309"></a>
## WF 309 - "Add task 30 days before Motion Cut Off Date" (ON_SCHEDULE)
### Conditions:
- All:
  - **motion_cut_off_date** is not empty 
  - **lock_automation** is _0_ 
  - **motion_cut_off_date** days later _30_ 
- At least one:
### Tasks:
- add task &quot;Prepare all outstanding motions and set for hearing&quot; for Attorney 30 days before date in field Motion Cut Off Date
### Tasks with Details:
- add task &quot;Prepare all outstanding motions and set for hearing&quot; for Attorney 30 days before date in field Motion Cut Off Date
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare all outstanding motions and set for hearing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-310" href="#wf-310"></a>
## WF 310 - "Empty Answer date and and Ds MFET to File Answer = current day + 120" (ON_SCHEDULE)
### Conditions:
- All:
  - **answer** is empty 
  - **ds_meet_to_file_answer** is not empty 
  - **ds_meet_to_file_answer** days ago _120_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;Review for re: MFET&quot;
### Tasks with Details:
- create task for Assigned Attorney &quot;Review for re: MFET&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ re: MFET' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-311" href="#wf-311"></a>
## WF 311 - "Ds MFET to File Answer changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_meet_to_file_answer** has changed 
  - **ds_meet_to_file_answer** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Status to Ds MFET (Answer) 
- create task for Scheduling Team - Hearings to &quot;Negotiate agreed order (no more than 30 days extension) with OC or Schedule Motion for Extension of Time for Hearing ASAP for&quot;
### Tasks with Details:
- set Complaint Status to Ds MFET (Answer) 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Ds MFET (Answer) (rawtext)"
    }, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Negotiate agreed order (no more than 30 days extension) with OC or Schedule Motion for Extension of Time for Hearing ASAP for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Negotiate agreed order (no more than 30 days extension) with OC or Schedule Motion for Extension of Time for Hearing ASAP for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-312" href="#wf-312"></a>
## WF 312 - "Ds Notice of Appearance changed" (MANUAL)
### Conditions:
- All:
  - **ds_notice_appearance** has changed 
  - **ds_notice_appearance** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~Set Ds Notice of Appearance Entered~
- ~draft package Ps 2nd Set of Discovery~
- ~set Complaint Status to FWOP - need to set aside~
- Generate package Ps 2nd Set of Discovery
- Set Ds Notice of Appearance Entered, set Complaint Status to FWOP - need to set aside
### Tasks with Details:
- ~~Set Ds Notice of Appearance Entered~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "ds_notice_appearance_entered": "get_date('today') (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- ~~draft package Ps 2nd Set of Discovery~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Draft package Ps 2nd Set of Discovery (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N19') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~set Complaint Status to FWOP - need to set aside~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "FWOP - need to set aside (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Generate package Ps 2nd Set of Discovery
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Ps 2nd Set of Discovery, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- Set Ds Notice of Appearance Entered, set Complaint Status to FWOP - need to set aside
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_notice_appearance_entered": "get_date('today') (expression)",
      "complaint_status": "FWOP - need to set aside (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-313" href="#wf-313"></a>
## WF 313 - "1 day after Ds Notice of Appearance Entered is set" (ON_SCHEDULE)
### Conditions:
- All:
  - **ds_notice_appearance_entered** is not empty 
  - **ds_notice_appearance_entered** days ago _1_ 
- At least one:
### Tasks:
- send email template &quot;Ps Depo Requests&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send email template &quot;Ps Depo Requests&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N62, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-314" href="#wf-314"></a>
## WF 314 - "3 day after Ds Notice of Appearance Entered is set" (ON_SCHEDULE)
### Conditions:
- All:
  - **ds_notice_appearance_entered** is not empty 
  - **ds_notice_appearance_entered** days ago _3_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depoitions to &quot;Coordinate Deposition of D's Corp Rep and Field Adjuster in&quot;
- create task for Case Manager to &quot;Add Opposing Counsel's info to file in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depoitions to &quot;Coordinate Deposition of D's Corp Rep and Field Adjuster in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Deposition of D\\'s Corp Rep and Field Adjuster in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Case Manager to &quot;Add Opposing Counsel's info to file in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Add Opposing Counsel\\'s info to file in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-315" href="#wf-315"></a>
## WF 315 - "Ps MPO (Plaintiff) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_mpo_plaintiff** has changed 
  - **ps_mpo_plaintiff** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Plaintiff) in&quot;
- Set Defendant Deposition Status to Plaintiff Depo - MPO Filed
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Plaintiff) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps Motion for Protective Order (Plaintiff) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Deposition Status to Plaintiff Depo - MPO Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Plaintiff Depo - MPO Filed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-317" href="#wf-317"></a>
## WF 317 - "Defendant Deposition change to Plaintiff Depo - Requested (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Plaintiff Depo - Requested_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) PROVIDER&quot; to PROVIDER_EMAIL
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
### Tasks with Details:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N103, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Plaintiff in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition Plaintiff for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-318" href="#wf-318"></a>
## WF 318 - "Depo of Plaintiff Date changed (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **depo_of_plaintiff_date** has changed 
  - **depo_of_plaintiff_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
- send email template &quot;Plaintiff Depo Set HO&quot; to CLIENT_EMAIL
- Set Defendant Deposition Status to Plaintiff Depo - Set
### Tasks with Details:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of Plaintiff (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "depo_of_plaintiff_date (fieldname)",
        "due_date": "depo_of_plaintiff_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Plaintiff in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- send email template &quot;Plaintiff Depo Set HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N104, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- Set Defendant Deposition Status to Plaintiff Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Plaintiff Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-319" href="#wf-319"></a>
## WF 319 - "Ps MPO (Engineer) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_mpo_engineer** has changed 
  - **ps_mpo_engineer** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Engineer) in&quot; 
- change  Defendant Deposition status to &quot;Engineer Depo - MPO Filed&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Engineer) in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps Motion for Protective Order (P Engineer) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change  Defendant Deposition status to &quot;Engineer Depo - MPO Filed&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Engineer Depo - MPO Filed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-321" href="#wf-321"></a>
## WF 321 - "Defendant Deposition Status change to Engineer Expert Depo - Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Engineer Expert Depo - Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Engineer in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Engineer) for Possible MPO in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Ps Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Engineer) for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition (Engineer) for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-322" href="#wf-322"></a>
## WF 322 - "Defendant Deposition change to Plaintiff Depo - Requested (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Plaintiff Depo - Requested_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) HO&quot; to CLIENT_EMAIL
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
### Tasks with Details:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N39, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Plaintiff in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition Plaintiff for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-323" href="#wf-323"></a>
## WF 323 - "Ps Engineer Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_engineer_depo_date** has changed 
  - **ps_engineer_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Engineer in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Engineer in&quot;
- Set Defendant Deposition Status to Engineer Expert Depo - Set
### Tasks with Details:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of P's Engineer (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ps_engineer_depo_date (fieldname)",
        "due_date": "ps_engineer_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ps Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send calendar invite and confirmation email to Ps Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Deposition Status to Engineer Expert Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Engineer Expert Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-324" href="#wf-324"></a>
## WF 324 - "Ps MPO (Ins Expert) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_mpo_ins_exp** is not empty 
  - **ps_mpo_ins_exp** has changed 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Ins Expert) in&quot;
- set Defendant Deposition Status to Ins Expert Depo - MPO Filed
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Ins Expert) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps Motion for Protective Order (P Ins Expert) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Defendant Deposition Status to Ins Expert Depo - MPO Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Ins Expert Depo - MPO Filed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-326" href="#wf-326"></a>
## WF 326 - "Defendant Deposition Status change to Ins Expert Depo - Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Ins Expert Depo - Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Ins Expert in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Ins Expert) for Possible MPO in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Ins Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Ps Ins Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Ins Expert) for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition (Ins Expert) for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-327" href="#wf-327"></a>
## WF 327 - "Ps Insurance Expert Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_insurance_expert_depo_date** has changed 
  - **ps_insurance_expert_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Ins Expert in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Ins Expert in&quot;
- Set Defendant Deposition Status to Ins Expert Depo - Set
### Tasks with Details:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Ins Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of P's Insurance Expert (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ps_insurance_expert_depo_date (fieldname)",
        "due_date": "ps_insurance_expert_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ps Ins Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Ins Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send calendar invite and confirmation email to Ps Ins Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Deposition Status to Ins Expert Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Ins Expert Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-328" href="#wf-328"></a>
## WF 328 - "Ps MPO (Insured) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_mpo_insured** has changed 
  - **ps_mpo_insured** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Insured) in&quot; 
- Set Defendant Deposition Status to Insured Depo - MPO Filed 
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Insured) in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps Motion for Protective Order (Insured) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Deposition Status to Insured Depo - MPO Filed 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Insured Depo - MPO Filed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-330" href="#wf-330"></a>
## WF 330 - "Defendant Deposition Status change to Insured Depo - Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Insured Depo - Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Insured in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Insured) for Possible MPO in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Insured) for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition (Insured) for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-331" href="#wf-331"></a>
## WF 331 - "Insured Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **insured_depo_date** has changed 
  - **insured_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of Insured in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to Insured in&quot;
- Set Defendant Deposition Status to  Insured Depo - Set
### Tasks with Details:
- add calendar event to Assigned and Case Manager &quot;Deposition of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of Insured (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "insured_depo_date (fieldname)",
        "due_date": "insured_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send calendar invite and confirmation email to Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Deposition Status to  Insured Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Insured Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-332" href="#wf-332"></a>
## WF 332 - "Ps MPO (Pricing Expert) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_mpo_pricing_exp** is not empty 
  - **ps_mpo_pricing_exp** has changed 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Ps Pricing Expert) in&quot; 
- change Defendant Deposition Satatus to &quot;Pricing Expert Depo - MPO Filed&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Ps Pricing Expert) in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps Motion for Protective Order (Ps Pricing Expert) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Defendant Deposition Satatus to &quot;Pricing Expert Depo - MPO Filed&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Pricing Expert Depo - MPO Filed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-334" href="#wf-334"></a>
## WF 334 - "Defendant Deposition Status change to Pricing Expert Depo - Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_deposition_status** has changed 
  - **defendant_deposition_status** is _Pricing Expert Depo - Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Pricing Expert in&quot; 
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Pricing Expert) for Possible MPO in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Pricing Expert in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Depo of Ps Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Pricing Expert) for Possible MPO in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Notice of Taking Deposition (Pricing Expert) for Possible MPO in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-335" href="#wf-335"></a>
## WF 335 - "Ps Pricing Expert Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_pricing_expert_depo_date** has changed 
  - **ps_pricing_expert_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Pricing Expert in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Pricing Expert in&quot;
- Set  Defendant Deposition Status to Pricing Expert Depo - Set
### Tasks with Details:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Pricing Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of P's Pricing Expert (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ps_pricing_expert_depo_date (fieldname)",
        "due_date": "ps_pricing_expert_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ps Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Pricing Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send calendar invite and confirmation email to Ps Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set  Defendant Deposition Status to Pricing Expert Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Pricing Expert Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-336" href="#wf-336"></a>
## WF 336 - "Ds Notice of Appearance changed to NULL" (MANUAL)
### Conditions:
- All:
  - **ds_notice_appearance** has changed 
  - **ds_notice_appearance** is empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Clear Ds Notice of Appearance Entered
### Tasks with Details:
- Clear Ds Notice of Appearance Entered
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_notice_appearance_entered": " (expression)"
    }, 
    ``` 

<a id="user-content-wf-337" href="#wf-337"></a>
## WF 337 - "Ds MPO (Contractor) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_contractor** has changed 
  - **ds_mpo_contractor** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Coordiante hearing for Ds Depo Motion for Protective Order in&quot;
- set Plaintiff Deposition Status to Contractor Depo - Motion for Protective Order
### Tasks with Details:
- create task for Scheduling Team - Hearings to &quot;Coordiante hearing for Ds Depo Motion for Protective Order in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordiante hearing for Ds Depo Motion for Protective Order in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to Contractor Depo - Motion for Protective Order
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Contractor Depo - Motion for Protective Order (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-338" href="#wf-338"></a>
## WF 338 - "Plaintiff Deposition Status change to Contractor Depo - MTC Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is _Contractor Depo - MTC Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordiante hearing on P's Motion for Compel Depo (Contractor) for&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordiante hearing on P's Motion for Compel Depo (Contractor) for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordiante hearing on Ps Motion for Compel Depo (Contractor) for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-339" href="#wf-339"></a>
## WF 339 - "Contractor Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **contractor_depo_date** has changed 
  - **contractor_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- calendar event for Assigned and Case Manager &quot;Deposition of D's Contractor in&quot;
- set Plaintiff Deposition Status to Contractor Depo - Set
### Tasks with Details:
- calendar event for Assigned and Case Manager &quot;Deposition of D's Contractor in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of D's Contractor (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "contractor_depo_date (fieldname)",
        "due_date": "contractor_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ds Contractor in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to Contractor Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Contractor Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-340" href="#wf-340"></a>
## WF 340 - "Ds MPO (Corp Rep) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_corp_rep** has changed 
  - **ds_mpo_corp_rep** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (CR) in &quot;
- set Plaintiff Deposition Status to CR Depo - Motion for Protective Order
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (CR) in &quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ds Depo Motion for Protective Order (CR) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to CR Depo - Motion for Protective Order
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "CR Depo - Motion for Protective Order (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-341" href="#wf-341"></a>
## WF 341 - "Plaintiff Deposition Status change to CR Depo - MTC Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is _CR Depo - MTC Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Corp Rep) in&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Corp Rep) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps  Motion for Compel Depo (Corp Rep) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-342" href="#wf-342"></a>
## WF 342 - "Corp Rep Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **corp_rep_depo_date** has changed 
  - **corp_rep_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event for Assigned and Case Manager &quot;Deposition of D's Corp Rep in&quot;
- set Plaintiff Deposition Status to CR Depo - Set
### Tasks with Details:
- add calendar event for Assigned and Case Manager &quot;Deposition of D's Corp Rep in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of D's Corp Rep (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "corp_rep_depo_date (fieldname)",
        "due_date": "corp_rep_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ds Corp Rep in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to CR Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "CR Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-343" href="#wf-343"></a>
## WF 343 - "Ds MPO (Engineer) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_engineer** has changed 
  - **ds_mpo_engineer** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Engineer) in&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Engineer) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ds Depo Motion for Protective Order (Engineer) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-344" href="#wf-344"></a>
## WF 344 - "Plaintiff Deposition Status change to Engineer Depo - MTC Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is _Engineer Depo - MTC Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Engineer) in&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Engineer) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps  Motion for Compel Depo (Engineer) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-345" href="#wf-345"></a>
## WF 345 - "Engineer Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **engineer_depo_date** has changed 
  - **engineer_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assign and Case Manager &quot;Deposition of D's Engineerin&quot;
- set Plaintiff Deposition Status to Engineer Depo - Set
### Tasks with Details:
- add calendar event to Assign and Case Manager &quot;Deposition of D's Engineerin&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of D's Engineer (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "engineer_depo_date (fieldname)",
        "due_date": "engineer_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ds Engineerin @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to Engineer Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Engineer Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-346" href="#wf-346"></a>
## WF 346 - "FA Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **fa_depo_date** has changed 
  - **fa_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of D's Field Adjuster in&quot;
- set Plaintiff Deposition Status to FA Depo - Set
### Tasks with Details:
- add calendar event to Assigned and Case Manager &quot;Deposition of D's Field Adjuster in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of D's Field Adjuster (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "fa_depo_date (fieldname)",
        "due_date": "fa_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ds Field Adjuster in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to FA Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "FA Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-347" href="#wf-347"></a>
## WF 347 - "Ds MPO (FA) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_fa** has changed 
  - **ds_mpo_fa** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearing to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (FA) in&quot;
- set Plaintiff Deposition Status to FA Depo - Motion for Protective Order  
### Tasks with Details:
- create a task for Scheduling Team - Hearing to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (FA) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ds Depo Motion for Protective Order (FA) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to FA Depo - Motion for Protective Order  
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "FA Depo - Motion for Protective Order (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-348" href="#wf-348"></a>
## WF 348 - "Plaintiff Deposition Status change to FA Depo - MTC Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is _FA Depo - MTC Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (FA) in&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (FA) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps  Motion for Compel Depo (FA) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-349" href="#wf-349"></a>
## WF 349 - "Ds MPO (Insured) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_insured** has changed 
  - **ds_mpo_insured** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Insured) in&quot;
- set Plaintiff Deposition Status to Insured Depo - Motion for Protective Order
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Insured) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ds Depo Motion for Protective Order (Insured) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to Insured Depo - Motion for Protective Order
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Insured Depo - Motion for Protective Order (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-350" href="#wf-350"></a>
## WF 350 - "Insured Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **insured_depo_date_pd** has changed 
  - **insured_depo_date_pd** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Deposition Status to Insured Depo - Set
- add calendar event to Assigned and Case Manager &quot;Deposition of Insured in&quot;
### Tasks with Details:
- set Plaintiff Deposition Status to Insured Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Insured Depo - Set (rawtext)"
    }, 
    ``` 

- add calendar event to Assigned and Case Manager &quot;Deposition of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of Insured (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "insured_depo_date_pd (fieldname)",
        "due_date": "insured_depo_date_pd (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-351" href="#wf-351"></a>
## WF 351 - "Ds MPO (Pricing Expert) changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_mpo_pricing_expert** has changed 
  - **ds_mpo_pricing_expert** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearing to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Pricing Expert) in&quot;
- set Plaintiff Deposition Status to Pricing Expert Depo - Motion for Protective Order
### Tasks with Details:
- create a task for Scheduling Team - Hearing to &quot;Coordinate hearing on Ds Depo Motion for Protective Order (Pricing Expert) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ds Depo Motion for Protective Order (Pricing Expert) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Plaintiff Deposition Status to Pricing Expert Depo - Motion for Protective Order
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Pricing Expert Depo - Motion for Protective Order (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-352" href="#wf-352"></a>
## WF 352 - "Plaintiff Deposition Status change to Pricing Expert Depo - MTC Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_deposition_status** has changed 
  - **plaintiff_deposition_status** is _Pricing Expert Depo - MTC Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Pricing Expert) in&quot;
### Tasks with Details:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on P's  Motion for Compel Depo (Pricing Expert) in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps  Motion for Compel Depo (Pricing Expert) in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-353" href="#wf-353"></a>
## WF 353 - "Pricing Expert Depo Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pricing_expert_depo_date** has changed 
  - **pricing_expert_depo_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Deposition Status to Pricing Expert Depo - Set
- add calendar event  to Assigned and Case Manager &quot;Deposition of D's Pricing Expert in&quot;
### Tasks with Details:
- set Plaintiff Deposition Status to Pricing Expert Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_deposition_status": "Pricing Expert Depo - Set (rawtext)"
    }, 
    ``` 

- add calendar event  to Assigned and Case Manager &quot;Deposition of D's Pricing Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of D's Pricing Expert (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "pricing_expert_depo_date (fieldname)",
        "due_date": "pricing_expert_depo_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Ds Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-354" href="#wf-354"></a>
## WF 354 - "on change of Provider" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **provider** has changed 
- At least one:
### Tasks:
- set Corporate Representative, Engineer, Insurance Expert, Pricing Expert, Public Adjuster, Indoor Environmental Professional, Inspector
### Tasks with Details:
- set Corporate Representative, Engineer, Insurance Expert, Pricing Expert, Public Adjuster, Indoor Environmental Professional, Inspector
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "corporate_representative": "$(relatedRecordId : provider|corporate_representative|Providers)$ (expression)",
      "engineer": "$(relatedRecordId : provider|engineer|Providers)$ (expression)",
      "insurance_expert": "$(relatedRecordId : provider|insurance_expert|Providers)$ (expression)",
      "pricing_expert": "$(relatedRecordId : provider|pricing_expert|Providers)$ (expression)",
      "indoor_environmental_professio": "$(relatedRecordId : provider|indoor_environmental_professio|Providers)$ (expression)",
      "inspector": "$(relatedRecordId : provider|inspector|Providers)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-356" href="#wf-356"></a>
## WF 356 - "on change Insurance Company" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **insurance_company** has changed 
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

<a id="user-content-wf-357" href="#wf-357"></a>
## WF 357 - "Plaintiff Deposition Status = Contractor Depo - Requested and no date has been entered within 7" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Contractor Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 2nd Request for dates for Contractor Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Ps 2nd Request for dates for Contractor Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N74, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-358" href="#wf-358"></a>
## WF 358 - "Plaintiff Deposition Status = Contractor Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Contractor Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
-  send e-mail template &quot;Ps 3rd Request for dates for Contractor Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
-  send e-mail template &quot;Ps 3rd Request for dates for Contractor Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N75, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-359" href="#wf-359"></a>
## WF 359 - "Plaintiff Deposition Status = Contractor Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Contractor Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's Contractor in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's Contractor in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Ds Contractor in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-360" href="#wf-360"></a>
## WF 360 - "Plaintiff Deposition Status  = CR Depo - Requested and no date has been entered within 7" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _CR Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 2nd Request for dates for CRs Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Ps 2nd Request for dates for CRs Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N76, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-361" href="#wf-361"></a>
## WF 361 - "Plaintiff Deposition Status = CR Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _CR Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 3rd Request for dates for CR Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Ps 3rd Request for dates for CR Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N77, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-362" href="#wf-362"></a>
## WF 362 - "Plaintiff Deposition Status = CR Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _CR Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's CR in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's CR in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Ds CR in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-363" href="#wf-363"></a>
## WF 363 - "Plaintiff Deposition Status = Engineer Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Engineer Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depo  to &quot;Unilaterally Set Depo of D's Engineer in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depo  to &quot;Unilaterally Set Depo of D's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Ds Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-364" href="#wf-364"></a>
## WF 364 - "Plaintiff Deposition Status = Engineer Depo - Requested and no date has been entered within 7Status " (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Engineer Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 2nd Request for dates for Engineer Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Ps 2nd Request for dates for Engineer Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N78, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-365" href="#wf-365"></a>
## WF 365 - "Plaintiff Deposition Status = Engineer Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Engineer Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail &quot;Ps 3rd Request for dates for Engineer Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail &quot;Ps 3rd Request for dates for Engineer Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N79, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-366" href="#wf-366"></a>
## WF 366 - "Plaintiff Deposition Status = FA Depo - Requested and no date has been entered within 7" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _FA Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 2nd Request for dates for FA Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail template &quot;Ps 2nd Request for dates for FA Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N80, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-367" href="#wf-367"></a>
## WF 367 - "Plaintiff Deposition Status = FA Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _FA Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail &quot;Ps 3rd Request for dates for FA Depo&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send e-mail &quot;Ps 3rd Request for dates for FA Depo&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N81, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-368" href="#wf-368"></a>
## WF 368 - "Plaintiff Deposition Status = FA Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _FA Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's FA in&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's FA in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Ds FA in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-369" href="#wf-369"></a>
## WF 369 - "Plaintiff Deposition Status  = Insured Depo - Requested and no date has been entered within 7" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Insured Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail &quot;Ps 2nd Request for dates for Insured Depo&quot; to Opposing Counsel
### Tasks with Details:
- send e-mail &quot;Ps 2nd Request for dates for Insured Depo&quot; to Opposing Counsel
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N82, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-370" href="#wf-370"></a>
## WF 370 - "Plaintiff Deposition Status = Insured Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Insured Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail &quot;Ps 3rd Request for dates for Insured Depo&quot; to Opposing Counsel
### Tasks with Details:
- send e-mail &quot;Ps 3rd Request for dates for Insured Depo&quot; to Opposing Counsel
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N83, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-371" href="#wf-371"></a>
## WF 371 - "Plaintiff Deposition Status = Insured Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Insured Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Unilaterally Set Depo of Insured in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings to &quot;Unilaterally Set Depo of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-372" href="#wf-372"></a>
## WF 372 - "Plaintiff Deposition Status = Pricing Expert Depo - Requested and no date has been entered within 7Status " (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Pricing Expert Depo - Requested_ 
  - **status_age** equal to _7_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 2nd Request for dates for Pricing Expert Depo&quot; to Opposing Counsel
### Tasks with Details:
- send e-mail template &quot;Ps 2nd Request for dates for Pricing Expert Depo&quot; to Opposing Counsel
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N84, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-373" href="#wf-373"></a>
## WF 373 - "Plaintiff Deposition Status = Pricing Expert Depo - Requested and no date has been entered within 14" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Pricing Expert Depo - Requested_ 
  - **status_age** equal to _14_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- send e-mail template &quot;Ps 3rd Request for dates for Pricing Expert Depo&quot; to Opposing Counse
### Tasks with Details:
- send e-mail template &quot;Ps 3rd Request for dates for Pricing Expert Depo&quot; to Opposing Counse
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N85, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-374" href="#wf-374"></a>
## WF 374 - "Plaintiff Deposition Status = Pricing Expert Depo - Requested and no date has been entered within 21" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Pricing Expert Depo - Requested_ 
  - **status_age** equal to _21_ 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Deposition_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's Pricing Expert&quot;
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Unilaterally Set Depo of D's Pricing Expert&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Unilaterally Set Depo of Ds Pricing Expert @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-388" href="#wf-388"></a>
## WF 388 - "Find County" (TRIGGER)
### Conditions:
- All:
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

<a id="user-content-wf-405" href="#wf-405"></a>
## WF 405 - "Plaintiff Discovery Status change to 1st Disco Set - MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _1st Disco Set - MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on 's Motion to Compel Better Responses to s 1st Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on 's Motion to Compel Better Responses to s 1st Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on \\'s Motion to Compel Better Responses to Ps 1st Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-406" href="#wf-406"></a>
## WF 406 - "Plaintiff Discovery Status change to 1st Disco Set - MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _1st Disco Set - MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 1st Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 1st Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Plaintiffs Motion to Compel Responses to Plaintiffs 1st Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-407" href="#wf-407"></a>
## WF 407 - "Plaintiff Discovery Status change to 2nd Disco Set - MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _2nd Disco Set - MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 2nd Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 2nd Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on P\\'s Motion to Compel Better Responses to Ps 2nd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-408" href="#wf-408"></a>
## WF 408 - "Plaintiff Discovery Status change to 2nd Disco Set - MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _2nd Disco Set - MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 2nd Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 2nd Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Plaintiffs Motion to Compel Responses to Plaintiffs 2nd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-409" href="#wf-409"></a>
## WF 409 - "Plaintiff Discovery Status change to 3rd Disco Set - MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _3rd Disco Set - MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 3rd Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 3rd Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on s Motion to Compel Better Responses to Ps 3rd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-410" href="#wf-410"></a>
## WF 410 - "Plaintiff Discovery Status change to 3rd Disco Set - MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _3rd Disco Set - MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 3rd Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 3rd Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Plaintiffs Motion to Compel Responses to Plaintiffs 3rd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-411" href="#wf-411"></a>
## WF 411 - "Plaintiff Discovery Status change to Expert Disco Set - MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _Expert Disco Set - MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps Expert Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps Expert Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on P\\'s Motion to Compel Better Responses to Ps Expert Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-412" href="#wf-412"></a>
## WF 412 - "Plaintiff Discovery Status change to Expert Disco Set - MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **plaintiff_discovery_status** has changed 
  - **plaintiff_discovery_status** is _Expert Disco Set - MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's Expert Disco Set in&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's Expert Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Plaintiffs Motion to Compel Responses to Plaintiffs Expert Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-413" href="#wf-413"></a>
## WF 413 - "Ps 1st Disco Set - Ds MFET changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_1st_disco_set_ds_mfet** has changed 
  - **ps_1st_disco_set_ds_mfet** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 1st Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
- Set Plaintiff Discovery Status to 1st Disco Set - Ds MFET
### Tasks with Details:
- send email template  &quot;Response to MFET Disco - 1st Set&quot;  to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N65, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for Agreed Order (no more than 30 days); if not sent for hearing ASAP' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Plaintiff Discovery Status to 1st Disco Set - Ds MFET
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "1st Disco Set - Ds MFET (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-414" href="#wf-414"></a>
## WF 414 - "Ps 1st Disco Set - Response Received changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_1_disco_set_resp_received** has changed 
  - **ps_1_disco_set_resp_received** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 1st Disco Set - Response Received
- create task for Attorney(User) to &quot;Review Discovery Responses to 1st Set of Discovery&quot;
### Tasks with Details:
- Set Plaintiff Discovery Status to 1st Disco Set - Response Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "1st Disco Set - Response Received (rawtext)"
    }, 
    ``` 

- create task for Attorney(User) to &quot;Review Discovery Responses to 1st Set of Discovery&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses to 1st Set of Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-415" href="#wf-415"></a>
## WF 415 - "2nd Disco Set - Response Received changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_2_disco_set_resp_received** has changed 
  - **ps_2_disco_set_resp_received** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;2nd Disco Set - Response Received&quot;
- create task for Assigned Attorney to &quot;Review Discovery Responses to 2nd Set of Discovery&quot;
### Tasks with Details:
- set Plaintiff Discovery Status to &quot;2nd Disco Set - Response Received&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "2nd Disco Set - Response Received (rawtext)"
    }, 
    ``` 

- create task for Assigned Attorney to &quot;Review Discovery Responses to 2nd Set of Discovery&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses to 2nd Set of Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-416" href="#wf-416"></a>
## WF 416 - "Ps 2nd Disco Set - Served changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_2_disco_set_served** has changed 
  - **ps_2_disco_set_served** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 2nd Disco Set - Response Received
### Tasks with Details:
- set Plaintiff Discovery Status to 2nd Disco Set - Response Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "2nd Disco Set - Served (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-417" href="#wf-417"></a>
## WF 417 - "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 45" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _2nd Disco Set - Served_ 
  - **status_age** equal to _45_ 
  - **ps_2_disco_set_resp_received** is empty 
  - **ps_2_disco_set_agree_due_date** is empty 
  - **ps_2_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 2nd Set&quot; to OPPOSING_COUNSEL_EMAIL;  
### Tasks with Details:
- send email template &quot;Overdue Discovery Responses - 2nd Set&quot; to OPPOSING_COUNSEL_EMAIL;  
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N71, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-418" href="#wf-418"></a>
## WF 418 - "Ps 2nd Disco Set - Ds MFET date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_2_disco_set_ds_mfet** has changed 
  - **ps_2_disco_set_ds_mfet** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 2nd Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
### Tasks with Details:
- send email template  &quot;Response to MFET Disco - 2nd Set&quot;  to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N67, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for Agreed Order (no more than 30 days); if not sent for hearing ASAP' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-419" href="#wf-419"></a>
## WF 419 - "Ps 3rd Disco Set - Ds MFET date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_3_disco_set_ds_mfet** has changed 
  - **ps_3_disco_set_ds_mfet** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 3rd Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
### Tasks with Details:
- send email template  &quot;Response to MFET Disco - 3rd Set&quot;  to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N68, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for Agreed Order (no more than 30 days); if not sent for hearing ASAP' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-420" href="#wf-420"></a>
## WF 420 - "Ps 3rd Disco Set - Response Received changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_3_disco_set_resp_received** has changed 
  - **ps_3_disco_set_resp_received** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 3rd Disco Set - Response Received
- create task for Assigned Attorney to &quot;Review Discovery Responses to 3rd Set of Discovery&quot;
### Tasks with Details:
- Set Plaintiff Discovery Status to 3rd Disco Set - Response Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "3rd Disco Set - Response Received (rawtext)"
    }, 
    ``` 

- create task for Assigned Attorney to &quot;Review Discovery Responses to 3rd Set of Discovery&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses to 3rd Set of Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-421" href="#wf-421"></a>
## WF 421 - "Ps 3rd Disco Set - Served changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_3_disco_set_served** has changed 
  - **ps_3_disco_set_served** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;3rd Disco Set - Served&quot;
### Tasks with Details:
- set Plaintiff Discovery Status to &quot;3rd Disco Set - Served&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "3rd Disco Set - Served (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-422" href="#wf-422"></a>
## WF 422 - "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 45" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _3rd Disco Set - Served_ 
  - **status_age** equal to _45_ 
  - **ps_3_disco_set_resp_received** is empty 
  - **ps_3_disco_set_agreed_due_date** is empty 
  - **ps_3_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 3rd Set&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send email template &quot;Overdue Discovery Responses - 3rd Set&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N72, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-423" href="#wf-423"></a>
## WF 423 - "Ps Expert Disco Set - Ds MFET date change" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_expert_disco_set_ds_mfet** has changed 
  - **ps_expert_disco_set_ds_mfet** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - Expert Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
### Tasks with Details:
- send email template  &quot;Response to MFET Disco - Expert Set&quot;  to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N69, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for Agreed Order (no more than 30 days); if not sent for hearing ASAP' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-424" href="#wf-424"></a>
## WF 424 - "Expert Disco Set - Response Received changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_exp_disco_set_resp_received** has changed 
  - **ps_exp_disco_set_resp_received** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Expert Disco Set - Response Received
- create task for Assigned Attorney to &quot;Review Discovery Responses to Expert Set of Discovery&quot;
### Tasks with Details:
- Set Plaintiff Discovery Status to Expert Disco Set - Response Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "Expert Disco Set - Response Received (rawtext)"
    }, 
    ``` 

- create task for Assigned Attorney to &quot;Review Discovery Responses to Expert Set of Discovery&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses to Expert Set of Discovery @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-425" href="#wf-425"></a>
## WF 425 - "Ps Expert Disco Set - Served changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_expert_disco_set_served** has changed 
  - **ps_expert_disco_set_served** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;Expert Disco Set - Served&quot;
### Tasks with Details:
- set Plaintiff Discovery Status to &quot;Expert Disco Set - Served&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "Expert Disco Set - Served (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-426" href="#wf-426"></a>
## WF 426 - "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 45" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Expert Disco Set - Served_ 
  - **status_age** equal to _45_ 
  - **ps_exp_disco_set_resp_received** is empty 
  - **ps_exp_disco_set_agrd_due_date** is empty 
  - **ps_expert_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - Expert&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send email template &quot;Overdue Discovery Responses - Expert&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N73, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-441" href="#wf-441"></a>
## WF 441 - "New e-mail received (Case)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- ~Send Notification to Assigned to: attaching an e-mail to the Case~
### Tasks with Details:
- ~~Send Notification to Assigned to: attaching an e-mail to the Case~~
    ``` 
    taskType: VTWatchdog, active: false 
    otherParameters: {srcWatchdogModule: Notification, active: false, type: PLL_USERS, message: The e-mail has been attached to the Case: <a href="$(record : CrmDetailViewURL)$">$(record : case_id)$</a>, recipients: fromField-assigned_user_id, title: New e-mail received, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-445" href="#wf-445"></a>
## WF 445 - "Pre-Litigation Status change to Retainer Agreement - Received (LIT)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Retainer Agreement - Received (LIT)_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send E-Mail Template &quot;Welcome Letter&quot; to CLIENT_EMAIL
- create task for HOS PRE-SUIT to &quot;Create NOIL Online&quot;
### Tasks with Details:
- send E-Mail Template &quot;Welcome Letter&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N48, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create task for HOS PRE-SUIT to &quot;Create NOIL Online&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Create NOIL Online for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-446" href="#wf-446"></a>
## WF 446 - "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 60" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _2nd Disco Set - Served_ 
  - **status_age** equal to _60_ 
  - **ps_2_disco_set_resp_received** is empty 
  - **ps_2_disco_set_agree_due_date** is empty 
  - **ps_2_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- create Ps Motion to Compel Response to 2nd Set of Discovery
- deposit Ps Motion to Compel Response to 2nd Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 2nd Set in&quot;
### Tasks with Details:
- create Ps Motion to Compel Response to 2nd Set of Discovery
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N192, conditionString: , stopOnError: }, 
    ``` 

- deposit Ps Motion to Compel Response to 2nd Set of Discovery to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion to Compel Response to 2nd Set of Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 2nd Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps MTC - 2nd Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-447" href="#wf-447"></a>
## WF 447 - "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 60" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _3rd Disco Set - Served_ 
  - **status_age** equal to _60_ 
  - **ps_3_disco_set_resp_received** is empty 
  - **ps_3_disco_set_agreed_due_date** is empty 
  - **ps_3_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- create Ps Motion to Compel Response to 3rd Set of Discovery
- deposit Ps Motion to Compel Response to 3rd Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 3rd Set in&quot;
### Tasks with Details:
- create Ps Motion to Compel Response to 3rd Set of Discovery
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N191, conditionString: , stopOnError: }, 
    ``` 

- deposit Ps Motion to Compel Response to 3rd Set of Discovery to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion to Compel Response to 3rd Set of Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 3rd Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps MTC - 3rd Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-448" href="#wf-448"></a>
## WF 448 - "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 60" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Expert Disco Set - Served_ 
  - **status_age** equal to _60_ 
  - **ps_exp_disco_set_resp_received** is empty 
  - **ps_exp_disco_set_agrd_due_date** is empty 
  - **ps_expert_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- generate Ps Motion to Compel Response to Expert Set of Discovery
- deposit  Ps Motion to Compel Response to Expert Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - Expert Set in&quot;
### Tasks with Details:
- generate Ps Motion to Compel Response to Expert Set of Discovery
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N194, conditionString: , stopOnError: }, 
    ``` 

- deposit  Ps Motion to Compel Response to Expert Set of Discovery to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion to Compel Response to Expert Set of Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - Expert Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps MTC - Expert Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-452" href="#wf-452"></a>
## WF 452 - "Plaintiff Discovery Status = 1st Disco Set - Served and no date has been entered within 60" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _1st Disco Set - Served_ 
  - **status_age** equal to _60_ 
  - **ps_1_disco_set_resp_received** is empty 
  - **ps_1_disco_set_agreed_due_date** is empty 
  - **ps_1st_disco_set_ds_mfet** is empty 
  - **lock_automation** is _0_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
-  generate Ps Motion to Compel Response to 1st Set of Discovery
-  deposit Ps Motion to Compel Response to 1st Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 1st Set in  @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot;
### Tasks with Details:
-  generate Ps Motion to Compel Response to 1st Set of Discovery
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N193, conditionString: , stopOnError: }, 
    ``` 

-  deposit Ps Motion to Compel Response to 1st Set of Discovery to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion to Compel Response to 1st Set of Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 1st Set in  @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Ps MTC - 1st Set in  @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-453" href="#wf-453"></a>
## WF 453 - "Generate documents 45 days before Discovery Cut Off Date" (ON_SCHEDULE)
### Conditions:
- All:
  - **discovery_cut_off_date** is not empty 
  - **discovery_cut_off_date** days later _45_ 
  - **lock_automation** is _0_ 
  - **request_4_disco_update_served** is empty 
- At least one:
### Tasks:
- create &quot;Notice of Request for Updated Discovery Reponses&quot;
- Deposit Notice of Request for Updated Discovery Reponses in Peru Queue for filing
- Set Request for Disco Update - Served
### Tasks with Details:
- create &quot;Notice of Request for Updated Discovery Reponses&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N195, conditionString: , stopOnError: }, 
    ``` 

- Deposit Notice of Request for Updated Discovery Reponses in Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Notice of Request for Updated Discovery Reponses for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Request for Disco Update - Served
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "request_4_disco_update_served": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-454" href="#wf-454"></a>
## WF 454 - "1 day after Notice for Trial date" (MANUAL)
### Conditions:
- All:
  - **notice_for_trial** is not empty 
  - **notice_for_trial** days ago _1_ 
- At least one:
### Tasks:
- Generate trial package
- Send trial package to Peru Queue
- Set Trial Status to Trial Package Prepared and Sent
### Tasks with Details:
- Generate trial package
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N196, conditionString: , stopOnError: }, 
    ``` 

- Send trial package to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "Trial package (rawtext)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Trial Status to Trial Package Prepared and Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "trial_status": "Trial Package Prepared and Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-467" href="#wf-467"></a>
## WF 467 - "Recalculate" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- call CF recalculateAll
### Tasks with Details:
- call CF recalculateAll
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

<a id="user-content-wf-469" href="#wf-469"></a>
## WF 469 - "Pre-Litigation Status change to Retainer Agreement - Received (PRE-SUIT)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed to _Retainer Agreement - Received (PRE-SUIT)_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send E-Mail Template &quot;Welcome Letter&quot; to CLIENT_EMAIL
- ~create LOR PACKAGE~
### Tasks with Details:
- send E-Mail Template &quot;Welcome Letter&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N48, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- ~~create LOR PACKAGE~~
    ``` 
    taskType: VTGeneratePackage, active: false 
    otherParameters: {active: false, package: LOR Package, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

<a id="user-content-wf-470" href="#wf-470"></a>
## WF 470 - "Pre-Litigation change to Presuit - Partial Offer" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - Partial Offer_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for PDC PRE-SUIT to &quot;Review @@CASE ID@@ @@INJUREDPARTY_NAME@@ to determine pending amount and reason for partial pay and create 10-day Demand Letter - Adjuster Package&quot; for remaining balance.&quot;
### Tasks with Details:
- add task for PDC PRE-SUIT to &quot;Review @@CASE ID@@ @@INJUREDPARTY_NAME@@ to determine pending amount and reason for partial pay and create 10-day Demand Letter - Adjuster Package&quot; for remaining balance.&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to determine pending amount and reason for partial pay and create &quot;10-day Demand Letter - Adjuster Package&quot; for remaining balance' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-471" href="#wf-471"></a>
## WF 471 - "Pre-Litigation Status change to 10-Day Demand - No Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - No Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Pre-Litigation State to Voluntary Payment Offer -No Fees
### Tasks with Details:
- set Pre-Litigation State to Voluntary Payment Offer -No Fees
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Voluntary Payment Offer - No fees (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-472" href="#wf-472"></a>
## WF 472 - "Pre-Litigation change to 10-Day Demand - Partial Payment" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Partial Payment_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for PDC PRE-SUIT to &quot;Review to determine pending amount and reason for partial pay&quot;
### Tasks with Details:
- create task for PDC PRE-SUIT to &quot;Review to determine pending amount and reason for partial pay&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to determine pending amount and reason for partial pay' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-473" href="#wf-473"></a>
## WF 473 - "Pre-Litigation Status change to 10-Day Demand - Payment Rcvd by Client" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _10-Day Demand - Payment Rcvd by Client_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Pre-Litigation State to Voluntary Payment Offer - No Fees
### Tasks with Details:
- set Pre-Litigation State to Voluntary Payment Offer - No Fees
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Voluntary Payment Offer - No fees (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-475" href="#wf-475"></a>
## WF 475 - "Pre-Litigation change to Mediation - Demanded" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Mediation - Demanded_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create new task to ST - ADR to &quot;Schedule Mediation for&quot;
### Tasks with Details:
- create new task to ST - ADR to &quot;Schedule Mediation for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Mediation for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "ST - ADR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-476" href="#wf-476"></a>
## WF 476 - "If Status = Mediation - Settled Awaiting Payment for 45 days  create task for RECEIVABLES to Review if Payment Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Mediation - Settled Awaiting Payment_ 
  - **status_age** equal to _45_ 
  - **lock_automation** is _0_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- create task for RECEIVABLES to &quot;Review if Payment Received in , if payment Received change status&quot;
### Tasks with Details:
- create task for RECEIVABLES to &quot;Review if Payment Received in , if payment Received change status&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review if Payment Received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@, if payment Received change status' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "RECEIVABLES (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-477" href="#wf-477"></a>
## WF 477 - "Pre-Litigation change to SPOL - Request Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _SPOL - Request Received_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;SPOL Requested&quot; to CLIENT_EMAIL
- set SPOL Request Received
- add due date to Calendar in 50 days
### Tasks with Details:
- send email template &quot;SPOL Requested&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N52, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- set SPOL Request Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "spol_request_received": "get_date('today') (expression)"
    }, 
    ``` 

- add due date to Calendar in 50 days
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Due date for SPOL Requested (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "date_start": "get_workingday(0, add_days(50)) (expression)",
        "due_date": "get_workingday(0, add_days(50)) (expression)",
        "activitytype": "Task (rawtext)",
        "taskpriority": "High (rawtext)",
        "notes": "'Due date for SPOL Requested (case: &lt;a href=&quot;$(record : CrmDetailViewURL)$&quot;&gt;$(record : case_id)$&lt;/a&gt;)' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-478" href="#wf-478"></a>
## WF 478 - "Pre-Litigation change to SPOL - Completed Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _SPOL - Completed Received_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for HOS PRE-SUIT to &quot;Review  SPOL for&quot; 
### Tasks with Details:
- create task for HOS PRE-SUIT to &quot;Review  SPOL for&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review  SPOL for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-479" href="#wf-479"></a>
## WF 479 - "Pre-Litigation change to SPOL - Sent to Ins Co" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _SPOL - Sent to Ins Co_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Completed SPOL Sent
### Tasks with Details:
- set Completed SPOL Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "completed_spol_sent": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-480" href="#wf-480"></a>
## WF 480 - "Pre-Litigation change to EUO Request Received - HO" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _EUO Request Received - HO_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Schedule EUO for&quot;
- set EUO Requested
- send email template &quot;EUO Requested&quot; to CLIENT_EMAIL
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Schedule EUO for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule EUO for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set EUO Requested
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "euo_requested": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;EUO Requested&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N53, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-481" href="#wf-481"></a>
## WF 481 - "EUO Scheduled date changed HO" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **euo_date** has changed 
  - **euo_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to EUO Scheduled
- send email template &quot;EUO Confirmation&quot; to CLIENT_EMAIL
### Tasks with Details:
- Set Pre-Litigation Status to EUO Scheduled
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "EUO Scheduled (rawtext)"
    }, 
    ``` 

- send email template &quot;EUO Confirmation&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N54, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-482" href="#wf-482"></a>
## WF 482 - "Pre-Litigation change to Record Statement Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Record Statement Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Schedule Recorded Statement for&quot;
- set Recorded Statement Requested
- send email template &quot;Recorded Statement Requested&quot; to CLIENT_EMAIL
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Schedule Recorded Statement for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Recorded Statement for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Recorded Statement Requested
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "recorded_statement_requested": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;Recorded Statement Requested&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N55, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-483" href="#wf-483"></a>
## WF 483 - "Recorded Statement Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **recorded_statement_date** has changed 
  - **recorded_statement_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to Record Statement Scheduled
- send email template &quot;Recorded Statement Confirmation&quot; to CLIENT_EMAIL
### Tasks with Details:
- Set Pre-Litigation Status to Record Statement Scheduled
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Record Statement Scheduled (rawtext)"
    }, 
    ``` 

- send email template &quot;Recorded Statement Confirmation&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N56, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-484" href="#wf-484"></a>
## WF 484 - "Pre-Litigation change to Inspection Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Inspection Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for HOS Pre-Suit Team to &quot;Reach out to PA or Schedule Inspection for&quot;
- set Inspection Requested
- send email template &quot;Inspection Requested&quot; to CLIENT_EMAIL and PA_EMAIL
### Tasks with Details:
- create task for HOS Pre-Suit Team to &quot;Reach out to PA or Schedule Inspection for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to PA or Schedule Inspection for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Inspection Requested
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "inspection_requested": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;Inspection Requested&quot; to CLIENT_EMAIL and PA_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N57, email: [$(relatedRecord : public_adjuster|email|Adjusters)$, $(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-485" href="#wf-485"></a>
## WF 485 - "Inspection Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **inspection_date** has changed 
  - **inspection_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to Inspection Scheduled
- send email template &quot;Inspection Confirmation&quot; to CLIENT_EMAIL
### Tasks with Details:
- Set Pre-Litigation Status to Inspection Scheduled
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Inspection Scheduled (rawtext)"
    }, 
    ``` 

- send email template &quot;Inspection Confirmation&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N58, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-486" href="#wf-486"></a>
## WF 486 - "Pre-Litigation change to 2nd Inspection Requested" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _2nd Inspection Requested_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for HOS Pre-Suit Team to &quot;Reach out to PA or Schedule 2nd Inspection for&quot;
- set 2nd Inspection Requested
-  send email template &quot;2nd Inspection Requested&quot; to CLIENT_EMAIL and PA_EMAIL
### Tasks with Details:
- create task for HOS Pre-Suit Team to &quot;Reach out to PA or Schedule 2nd Inspection for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to PA or Schedule 2nd Inspection for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set 2nd Inspection Requested
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "2nd_inspection_requested": "get_date('today') (expression)"
    }, 
    ``` 

-  send email template &quot;2nd Inspection Requested&quot; to CLIENT_EMAIL and PA_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N59, email: [$(relatedRecord : public_adjuster|email|Adjusters)$, $(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-487" href="#wf-487"></a>
## WF 487 - "2nd Inspection Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **2nd_inspection_date** has changed 
  - **2nd_inspection_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to 2nd Inspection Scheduled
- send email template &quot;Inspection Confirmation&quot; to CLIENT_EMAIL
### Tasks with Details:
- Set Pre-Litigation Status to 2nd Inspection Scheduled
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "2nd Inspection Scheduled (rawtext)"
    }, 
    ``` 

- send email template &quot;Inspection Confirmation&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N58, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-488" href="#wf-488"></a>
## WF 488 - "Pre-Litigation change to Request for Documents Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Request for Documents Received_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for HOS Pre-Suit Team to &quot;Reach out to Homeowner to discuss request for additional damages for&quot;
- set Request for Documents Received
- send email template &quot;Request for Documents&quot; to CLIENT_EMAIL and PA_EMAIL
### Tasks with Details:
- create task for HOS Pre-Suit Team to &quot;Reach out to Homeowner to discuss request for additional damages for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reach out to Homeowner to discuss request for additional damages for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Request for Documents Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "request_for_documents_received": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;Request for Documents&quot; to CLIENT_EMAIL and PA_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N60, email: [$(relatedRecord : public_adjuster|email|Adjusters)$, $(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-489" href="#wf-489"></a>
## WF 489 - "Pre-Litigation change to Request for Documents Responded" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Request for Documents Responded_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Request for Documents Response
### Tasks with Details:
- Set Request for Documents Response
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "request_for_documents_response": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-490" href="#wf-490"></a>
## WF 490 - "Pre-Litigation change to Voluntary Payment in Full - 10% HOMEOWNER" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Voluntary Payment in Full - 10% HOMEOWNER_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for SUPERVISOR to &quot;Review file for to Close&quot;
- set Voluntary Payment Date
- send email template &quot;Pre-Litigation Settlement Statement HO&quot; to Client_EMAIL
### Tasks with Details:
- create task for SUPERVISOR to &quot;Review file for to Close&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to Close' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Voluntary Payment Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_payment_date": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;Pre-Litigation Settlement Statement HO&quot; to Client_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N61, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-491" href="#wf-491"></a>
## WF 491 - "Pre-Litigation change to EUO Request Received - PROVIDER" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _EUO Request Received - PROVIDER_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Schedule EUO for&quot;
- set EUO Requested
- send email template &quot;EUO Requested&quot; to PROVIDER_EMAIL
### Tasks with Details:
- create task for Scheduling Team - Depositions to &quot;Schedule EUO for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule EUO for @@CAS_ ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Depositions (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set EUO Requested
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "euo_requested": "get_date('today') (expression)"
    }, 
    ``` 

- send email template &quot;EUO Requested&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N53, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-493" href="#wf-493"></a>
## WF 493 - "Appraisal Status change to Appraisal - Demanded PROVIDER" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appraisal_status** has changed to _Appraisal - Demanded PROVIDER_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to PROVIDER_EMAIL
### Tasks with Details:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N63, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-494" href="#wf-494"></a>
## WF 494 - "Appraisal Status change to Appraisal - Demanded HOMEOWNER" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appraisal_status** has changed to _Appraisal - Demanded HOMEOWNER_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to CLIENT_EMAIL
### Tasks with Details:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N63, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-495" href="#wf-495"></a>
## WF 495 - "EUO Scheduled date changed AOB" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **euo_date** has changed 
  - **euo_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to EUO Scheduled
- send email template &quot;EUO Confirmation&quot; to PROVIDER_EMAIL
### Tasks with Details:
- Set Pre-Litigation Status to EUO Scheduled
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "EUO Scheduled (rawtext)"
    }, 
    ``` 

- send email template &quot;EUO Confirmation&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N54, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-496" href="#wf-496"></a>
## WF 496 - "Pre-Litigation Status:  90 days  have passed since FNOL" (ON_SCHEDULE)
### Conditions:
- All:
  - **first_notice_of_loss** days ago _90_ ()
  - **lock_automation** is _0_ 
  - **stage** is _Pre-Litigation_ 
  - **status** is _Retainer Agreement - Received (PRE-SUIT)_ 
- At least one:
### Tasks:
- create task for HOS PRE-SUIT to &quot;Create NOIL Online for&quot;
### Tasks with Details:
- create task for HOS PRE-SUIT to &quot;Create NOIL Online for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Create NOIL Online for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-497" href="#wf-497"></a>
## WF 497 - "Ps 1st Disco Set - Agreed Due Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_1_disco_set_agreed_due_date** has changed 
  - **ps_1_disco_set_agreed_due_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Plaintiff Discovery Status to to 1st Disco Set - Ds MFET Agreed Extenstion
### Tasks with Details:
- Plaintiff Discovery Status to to 1st Disco Set - Ds MFET Agreed Extenstion
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "1st Disco Set - Ds MFET Agreed Extension (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-498" href="#wf-498"></a>
## WF 498 - "7 days after Ps 1st Disco Set - Agreed Due Date" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _1st Disco Set - Ds MFET Agreed Extension_ 
  - **ps_1_disco_set_resp_received** is empty 
  - **ps_1_disco_set_agreed_due_date** days ago _7_ ()
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 1st Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 1st Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for overdue discovery responses to 1st Disco Set and draft Motion to Compel with Sanctions if Necessary' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-499" href="#wf-499"></a>
## WF 499 - "If status = SPOL - Request Received for 45 days create task for HOS PRE-SUIT to Review file for completed SPOL" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _SPOL - Request Received_ 
  - **lock_automation** is _0_ 
  - **status_age** equal to _45_ 
  - **stage** is _Pre-Litigation_ 
- At least one:
### Tasks:
- create task for HOS PRE-SUIT to &quot;Review file for completed SPOL&quot; 
### Tasks with Details:
- create task for HOS PRE-SUIT to &quot;Review file for completed SPOL&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file for completed SPOL - case: @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-500" href="#wf-500"></a>
## WF 500 - "Ps 1st Disco Set - Ds MFET Hearing date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_1_disco_set_ds_mfet_hearing** has changed 
  - **ps_1_disco_set_ds_mfet_hearing** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 1st Disco Set - Ds MFET Hearing Set
- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 1st Disco Set in&quot; 
### Tasks with Details:
- set Plaintiff Discovery Status to 1st Disco Set - Ds MFET Hearing Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "1st Disco Set - Ds MFET Hearing Set (rawtext)"
    }, 
    ``` 

- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 1st Disco Set in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Ds MFET Hearing re: 1st Disco Set (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ps_1_disco_set_ds_mfet_hearing (fieldname)",
        "due_date": "ps_1_disco_set_ds_mfet_hearing (fieldname)",
        "activitytype": "Task (rawtext)",
        "notes": "'Ds MFET Hearing re: 1st Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-501" href="#wf-501"></a>
## WF 501 - "1 day before Ps 1st Disco Set - Ds MFET Hearing date create task  for Attorney to " (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_1_disco_set_ds_mfet_hearing** is not empty 
  - **ps_1_disco_set_ds_mfet_hearing** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney 1 day before to &quot;Prepare for D's MFET - 1st Set in&quot;
### Tasks with Details:
- create task for Assigned Attorney 1 day before to &quot;Prepare for D's MFET - 1st Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Ds MFET - 1st Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-502" href="#wf-502"></a>
## WF 502 - "Service of Process date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **service_of_process** has changed 
  - **service_of_process** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 1st Disco Set - Served, 1st Disco Set - Served
### Tasks with Details:
- Set Plaintiff Discovery Status to 1st Disco Set - Served, 1st Disco Set - Served
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "1st Disco Set - Served (rawtext)",
      "ps_1_disco_set_served": "service_of_process (expression)"
    }, 
    ``` 

<a id="user-content-wf-503" href="#wf-503"></a>
## WF 503 - "45 days after Ps 1st Disco Set - Served" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _1st Disco Set - Served_ 
  - **lock_automation** is _0_ 
  - **ps_1_disco_set_resp_received** is empty 
  - **ps_1_disco_set_agreed_due_date** is empty 
  - **ps_1st_disco_set_ds_mfet** is empty 
  - **status_age** equal to _45_ 
  - **stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 1st Set&quot; to OPPOSING_COUNSEL_EMAIL
### Tasks with Details:
- send email template &quot;Overdue Discovery Responses - 1st Set&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N66, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

<a id="user-content-wf-505" href="#wf-505"></a>
## WF 505 - "Ps 2nd Disco Set - Agreed Due Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_2_disco_set_agree_due_date** has changed 
  - **ps_2_disco_set_agree_due_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to to 2nd Disco Set - Ds MFET Agreed Extenstion
### Tasks with Details:
- Set Plaintiff Discovery Status to to 2nd Disco Set - Ds MFET Agreed Extenstion
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "2nd Disco Set - Ds MFET Agreed Extension (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-506" href="#wf-506"></a>
## WF 506 - "7 days after Ps 2nd Disco Set - Agreed Due Date no date has been entered" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _2nd Disco Set - Ds MFET Agreed Extension_ 
  - **ps_2_disco_set_agree_due_date** days ago _7_ 
  - **ps_2_disco_set_resp_received** is empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 2nd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 2nd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for overdue discovery responses to 2nd Disco Set and draft Motion to Compel with Sanctions if Necessary' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-507" href="#wf-507"></a>
## WF 507 - "Ps 2nd Disco Set - Ds MFET Hearing date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_2_disco_set_ds_mfet_hearin** has changed 
  - **ps_2_disco_set_ds_mfet_hearin** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 2nd Disco Set - Ds MFET Hearing Set
- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 2nd Disco Set in&quot;
### Tasks with Details:
- set Plaintiff Discovery Status to 2nd Disco Set - Ds MFET Hearing Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "2nd Disco Set - Ds MFET Hearing Set (rawtext)"
    }, 
    ``` 

- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 2nd Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Ds MFET Hearing re: 2nd Disco (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "ps_2_disco_set_ds_mfet_hearin (fieldname)",
        "due_date": "ps_2_disco_set_ds_mfet_hearin (fieldname)",
        "activitytype": "Task (rawtext)",
        "notes": "'Ds MFET Hearing re: 2nd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-508" href="#wf-508"></a>
## WF 508 - "1 day before Ps 2nd Disco Set - Ds MFET Hearing date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_2_disco_set_ds_mfet_hearin** is not empty 
  - **ps_2_disco_set_ds_mfet_hearin** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps 2nd Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - 2nd Set in&quot;
### Tasks with Details:
- 1 day before Ps 2nd Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - 2nd Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Ds MFET - 2nd Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-509" href="#wf-509"></a>
## WF 509 - "Ps 3rd Disco Set - Agreed Due Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_3_disco_set_agreed_due_date** has changed 
  - **ps_3_disco_set_agreed_due_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Agreed Extenstion
### Tasks with Details:
- Set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Agreed Extenstion
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "3rd Disco Set - Ds MFET Agreed Extension (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-510" href="#wf-510"></a>
## WF 510 - " IF 7 days after Ps 3rd Disco Set - Agreed Due Date no date has been entered" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _3rd Disco Set - Ds MFET Agreed Extension_ 
  - **ps_3_disco_set_resp_received** is empty 
  - **ps_3_disco_set_agreed_due_date** days ago _7_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 3rd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 3rd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for overdue discovery responses to 3rd Disco Set and draft Motion to Compel with Sanctions if Necessary' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-511" href="#wf-511"></a>
## WF 511 - "Ps 3rd Disco Set - Ds MFET Hearing date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_3_disco_set_ds_mfet_hearing** has changed 
  - **ps_3_disco_set_ds_mfet_hearing** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Hearing Set
- create calendar event for Assigned and Case Manager &quot;Ds MFET Hearing re: 3rd Disco Set in&quot; 
### Tasks with Details:
- set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Hearing Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "3rd Disco Set - Ds MFET Hearing Set (rawtext)"
    }, 
    ``` 

- create calendar event for Assigned and Case Manager &quot;Ds MFET Hearing re: 3rd Disco Set in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Ds MFET Hearing re: 3rd Disco Set (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "ps_3_disco_set_ds_mfet_hearing (fieldname)",
        "due_date": "ps_3_disco_set_ds_mfet_hearing (fieldname)",
        "activitytype": "Task (rawtext)",
        "notes": "'Ds MFET Hearing re: 3rd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-512" href="#wf-512"></a>
## WF 512 - "1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_3_disco_set_ds_mfet_hearing** is not empty 
  - **ps_3_disco_set_ds_mfet_hearing** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Assigned Attorney to  &quot;Prepare for D's MFET - 3rd Set in&quot;
### Tasks with Details:
- 1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Assigned Attorney to  &quot;Prepare for D's MFET - 3rd Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Ds MFET - 3rd Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-513" href="#wf-513"></a>
## WF 513 - "Ps Expert Disco Set - Agreed Due Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_exp_disco_set_agrd_due_date** has changed 
  - **ps_exp_disco_set_agrd_due_date** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Agreed Extenstion
### Tasks with Details:
- Set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Agreed Extenstion
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "Expert Disco Set - Ds MFET Agreed Extension (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-514" href="#wf-514"></a>
## WF 514 - "7 days after Ps Expert Disco Set - Agreed Due Date no date has been entered" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Expert Disco Set - Ds MFET Agreed Extension_ 
  - **ps_exp_disco_set_resp_received** is empty 
  - **ps_exp_disco_set_agrd_due_date** days ago _7_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to Expert Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to Expert Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review @@CASE_ID@@ @@INJUREDPARTY_NAME@@ for overdue discovery responses to Expert Disco Set and draft Motion to Compel with Sanctions if Necessary' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-515" href="#wf-515"></a>
## WF 515 - "Ps Expert Disco Set - Ds MFET Hearing date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ps_exp_disco_set_ds_mfet_hearg** has changed 
  - **ps_exp_disco_set_ds_mfet_hearg** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Hearing Set
- create calendar event &quot;Ds MFET Hearing re: Expert Disco Set in&quot;
### Tasks with Details:
- set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Hearing Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "Expert Disco Set - Ds MFET Hearing Set (rawtext)"
    }, 
    ``` 

- create calendar event &quot;Ds MFET Hearing re: Expert Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "'Ds MFET Hearing re: Expert Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "ps_exp_disco_set_ds_mfet_hearg (fieldname)",
        "due_date": "ps_exp_disco_set_ds_mfet_hearg (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-516" href="#wf-516"></a>
## WF 516 - "1 day before Ps Expert Disco Set - Ds MFET Hearing date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_exp_disco_set_ds_mfet_hearg** is not empty 
  - **ps_exp_disco_set_ds_mfet_hearg** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Expert Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - Expert Set in&quot;
### Tasks with Details:
- 1 day before Ps Expert Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - Expert Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Ds MFET - Expert Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-517" href="#wf-517"></a>
## WF 517 - "No date in Request for Disco Update - Received within 30 days of Request for Disco Update - Served" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Request for Disco Update - Served_ 
  - **request_4_disco_update_receive** is empty 
  - **request_4_disco_update_served** days ago _30_ ()
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - Update&quot; to OPPOSING_COUNSEL_EMAIL
- create &quot;Ps Motion to Compel Update&quot;
- deposit Ps Motion to Compel Update to Peru Queue
### Tasks with Details:
- send email template &quot;Overdue Discovery Responses - Update&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N70, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- create &quot;Ps Motion to Compel Update&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N202, conditionString: , stopOnError: }, 
    ``` 

- deposit Ps Motion to Compel Update to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion to Compel Update for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-518" href="#wf-518"></a>
## WF 518 - "1 day before Contractor Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **contractor_depo_date** is not empty 
  - **contractor_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Contractor Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Contractor Depo in&quot;
### Tasks with Details:
- 1 day before Contractor Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Contractor Depo in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ds Contractor Depo in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-519" href="#wf-519"></a>
## WF 519 - "1 day before Corp Rep Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **corp_rep_depo_date** is not empty 
  - **corp_rep_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  create task for Assigned Attorney to &quot;Prepare for Deposition of D's Corp Rep Depo in&quot;
### Tasks with Details:
-  create task for Assigned Attorney to &quot;Prepare for Deposition of D's Corp Rep Depo in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ds Corp Rep Depo in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-520" href="#wf-520"></a>
## WF 520 - "1 day before Engineer Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **engineer_depo_date** is not empty 
  - **engineer_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Engineer Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Engineer in&quot;
### Tasks with Details:
- 1 day before Engineer Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ds Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-521" href="#wf-521"></a>
## WF 521 - "1 day before FA Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **fa_depo_date** is not empty 
  - **fa_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Prepare for Deposition of D's Field Adjuster&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Prepare for Deposition of D's Field Adjuster&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ds Field Adjuster @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-522" href="#wf-522"></a>
## WF 522 - "1 day before Insured Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **insured_depo_date_pd** is not empty 
  - **insured_depo_date_pd** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Insured Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of Insured in&quot;
### Tasks with Details:
- 1 day before Insured Depo Date create task for Assigned Attorney to &quot;Prepare for Deposition of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-523" href="#wf-523"></a>
## WF 523 - "1 day Pricing Expert Depo Date create task for Attorney" (ON_SCHEDULE)
### Conditions:
- All:
  - **pricing_expert_depo_date** is not empty 
  - **pricing_expert_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Pricing Expert Depo Date date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Pricing Expert in&quot;
### Tasks with Details:
- 1 day before Pricing Expert Depo Date date create task for Assigned Attorney to &quot;Prepare for Deposition of D's Pricing Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ds Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-524" href="#wf-524"></a>
## WF 524 - "Ds 1st Disco Set - Received Date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_1st_disco_set_received** is not empty 
  - **ds_1st_disco_set_received** has changed 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds 1st Disco Set - Received date: &quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds 1st Disco Set in&quot;
- Set Defendant Discovery Status to 1st Disco Set - Received
### Tasks with Details:
- add calendar event to Attoreny (User) 29 after Ds 1st Disco Set - Received date: &quot;Responses due in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Responses due (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( ds_1st_disco_set_received, 29)) (expression)",
        "due_date": "get_workingday(0, add_days( ds_1st_disco_set_received, 29)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Responses due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- create task for Case Manager to &quot;Draft Responses to Ds 1st Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Responses to Ds 1st Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Discovery Status to 1st Disco Set - Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "1st Disco Set - Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-525" href="#wf-525"></a>
## WF 525 - "No date in Ds 1st Disco Set - Response Served within 25 days of Ds 1st Disco Set - Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _1st Disco Set - Received_ 
  - **ds_1st_disco_set_resp_seerved** is empty 
  - **ds_1st_disco_set_received** days ago _25_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to 1st Disco Set - Ps MFET Filed,  set Ps Motion For Extension Of Time
### Tasks with Details:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N126, conditionString: , stopOnError: }, 
    ``` 

- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion for Extension of Time - Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Defendnat Discovery Status to 1st Disco Set - Ps MFET Filed,  set Ps Motion For Extension Of Time
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "1st Disco Set - Ps MFET Filed (rawtext)",
      "ps_motion_for_extension_of_tim": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-526" href="#wf-526"></a>
## WF 526 - "Defendnat Discovery change to 1st Disco Set - Response Pending Review" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _1st Disco Set - Response Pending Review_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 1st Set in&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 1st Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses Draft to 1st Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-527" href="#wf-527"></a>
## WF 527 - "Defendnat Discovery change to 1st Disco Set - Ds MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _1st Disco Set - Ds MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft Response to Ds MTC Better Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide better responses' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-528" href="#wf-528"></a>
## WF 528 - "Defendnat Discovery change to 1st Disco Set - Ds MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _1st Disco Set - Ds MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft response to Ds MTC Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide discovery responses' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-529" href="#wf-529"></a>
## WF 529 - "Defendnat Discovery change to 1st Disco Set - Response Served" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _1st Disco Set - Response Served_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add date to &quot;Ds 1st Disco Set - Response Served&quot; 
### Tasks with Details:
- add date to &quot;Ds 1st Disco Set - Response Served&quot; 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_1st_disco_set_resp_seerved": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-530" href="#wf-530"></a>
## WF 530 - "Ds 2nd Disco Set - Received date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_2nd_disco_set_received** is not empty 
  - **ds_2nd_disco_set_received** has changed 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds 2nd Disco Set - Received: &quot;&quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds 2nd Disco Set in&quot; 
- Set Defendant Discovery Status to 2nd Disco Set - Received
### Tasks with Details:
- add calendar event to Attoreny (User) 29 after Ds 2nd Disco Set - Received: &quot;&quot;Responses due in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Responses due (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days(ds_2nd_disco_set_received, 29)) (expression)",
        "due_date": "get_workingday(0, add_days(ds_2nd_disco_set_received, 29)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Responses due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- create task for Case Manager to &quot;Draft Responses to Ds 2nd Disco Set in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Responses to Ds 2nd Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Discovery Status to 2nd Disco Set - Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "2nd Disco Set - Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-531" href="#wf-531"></a>
## WF 531 - "No date in Ds 2nd Disco Set - Response Served within 25 days of Ds 2nd Disco Set - Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _2nd Disco Set - Received_ 
  - **ds_2nd_disco_set_resp_served** is empty 
  - **ds_2nd_disco_set_received** days ago _25_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to 2nd Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
### Tasks with Details:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N126, conditionString: , stopOnError: }, 
    ``` 

- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion for Extension of Time - Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Defendnat Discovery Status to 2nd Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "2nd Disco Set - Ps MFET Filed (rawtext)",
      "ps_motion_for_extension_of_tim": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-532" href="#wf-532"></a>
## WF 532 - "Defendnat Discovery change to 2nd Disco Set - Response Pending Review" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _2nd Disco Set - Response Pending Review_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 2nd Set in&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 2nd Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses Draft to 2nd Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-533" href="#wf-533"></a>
## WF 533 - "Defendnat Discovery change to 2nd Disco Set - Ds MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _2nd Disco Set - Ds MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft Response to Ds MTC Better Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide better responses&quot;' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-534" href="#wf-534"></a>
## WF 534 - "Defendnat Discovery change to 2nd Disco Set - Ds MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _2nd Disco Set - Ds MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft response to Ds MTC Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide discovery responses' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-535" href="#wf-535"></a>
## WF 535 - "Defendnat Discovery change to 2nd Disco Set - Response Served" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _2nd Disco Set - Response Served_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Ds 2nd Disco Set - Response Served date
### Tasks with Details:
- Set Ds 2nd Disco Set - Response Served date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_2nd_disco_set_resp_served": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-536" href="#wf-536"></a>
## WF 536 - "Ds Expert Disco Set - Received date changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **ds_expert_disco_set_received** is not empty 
  - **ds_expert_disco_set_received** has changed 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds Expert Disco Set - Received date: &quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds Expert Disco Set in&quot;
- Set Defendant Discovery Status to Expert Disco Set - Received
### Tasks with Details:
- add calendar event to Attoreny (User) 29 after Ds Expert Disco Set - Received date: &quot;Responses due in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Responses due (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( ds_expert_disco_set_received, 29)) (expression)",
        "due_date": "get_workingday(0, add_days( ds_expert_disco_set_received, 29)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Responses due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- create task for Case Manager to &quot;Draft Responses to Ds Expert Disco Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Draft Responses to Ds Expert Disco Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Defendant Discovery Status to Expert Disco Set - Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "Expert Disco Set - Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-537" href="#wf-537"></a>
## WF 537 - "No date in Ds Expert Disco Set - Response Served within 25 days of Ds Expert Disco Set - Received" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Expert Disco Set - Received_ 
  - **ds_expert_disco_set_response** is empty 
  - **ds_expert_disco_set_received** days ago _25_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to Expert Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
### Tasks with Details:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N126, conditionString: }, 
    ``` 

- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Document Ps Motion for Extension of Time - Discovery for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- change Defendnat Discovery Status to Expert Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_discovery_status": "Expert Disco Set - Ps MFET Filed (rawtext)",
      "ps_motion_for_extension_of_tim": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-538" href="#wf-538"></a>
## WF 538 - "Defendnat Discovery change to Expert Disco Set - Response Pending Review" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _Expert Disco Set - Response Pending Review_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to Expert Set in&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to Expert Set in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Discovery Responses Draft to Expert Set in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-539" href="#wf-539"></a>
## WF 539 - "Defendnat Discovery change to Expert Disco Set - Ds MTC Better Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _Expert Disco Set - Ds MTC Better Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft Response to Ds MTC Better Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide better responses' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-540" href="#wf-540"></a>
## WF 540 - "Defendnat Discovery change to Expert Disco Set - Ds MTC Responses" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _Expert Disco Set - Ds MTC Responses_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and draft response to Ds MTC Responses in @@CASE_ID@@ @@INJUREDPARTY_NAME@@ or provide discovery responses' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-541" href="#wf-541"></a>
## WF 541 - "Defendnat Discovery change to Expert Disco Set - Response Served" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_discovery_status** has changed 
  - **defendant_discovery_status** is _Expert Disco Set - Response Served_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Ds Expert Disco Set - Response Served
### Tasks with Details:
- Set Ds Expert Disco Set - Response Served
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "ds_expert_disco_set_response": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-542" href="#wf-542"></a>
## WF 542 - "Safe Harbor Letter Received date changed (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **safe_harbor_letter_received** has changed 
  - **safe_harbor_letter_received** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
- send email teplate &quot;Safe Harbor Letter HO&quot; to CLIENT_EMAIL
- send email template &quot;Request for Explanation 57.105 HO&quot; to OPPOSING_COUNSEL_EMAIL
- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager &quot;Safe Harbor Deadline in&quot;
- Set PFS CRN 57.105 Status to 57.105 Received
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Safe Haror Letter received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email teplate &quot;Safe Harbor Letter HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N86, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- send email template &quot;Request for Explanation 57.105 HO&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N87, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager &quot;Safe Harbor Deadline in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Safe Harbor Deadline (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "get_workingday(0, add_days( safe_harbor_letter_received, 19)) (expression)",
        "due_date": "get_workingday(0, add_days( safe_harbor_letter_received, 19)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Safe Harbor Deadline in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- Set PFS CRN 57.105 Status to 57.105 Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pfs_crn_57_105_status": "57.105 Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-543" href="#wf-543"></a>
## WF 543 - "Change of PFS CRN 57.105 Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_crn_57_105_status** has changed 
  - **pfs_crn_57_105_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "pfs_crn_57_105_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "PFS CRN 57.105 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-544" href="#wf-544"></a>
## WF 544 - "Safe Harbor Letter Received date changed (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **safe_harbor_letter_received** has changed 
  - **safe_harbor_letter_received** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
- send email teplate &quot;Safe Harbor Letter PROVIDER&quot; to PROVIDER_EMAIL
- send email template &quot;Request for Explanation 57.105 PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager: &quot;Safe Harbor Deadline in&quot;
- Set PFS CRN 57.105 Status to 57.105 Received
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Safe Haror Letter received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email teplate &quot;Safe Harbor Letter PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N88, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- send email template &quot;Request for Explanation 57.105 PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N89, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager: &quot;Safe Harbor Deadline in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Safe Harbor Deadline (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "get_workingday(0, add_days( safe_harbor_letter_received, 19)) (expression)",
        "due_date": "get_workingday(0, add_days( safe_harbor_letter_received, 19)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Safe Harbor Deadline in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- Set PFS CRN 57.105 Status to 57.105 Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pfs_crn_57_105_status": "57.105 Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-545" href="#wf-545"></a>
## WF 545 - "PFS CRN 57.105 change to CRN Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_crn_57_105_status** has changed 
  - **pfs_crn_57_105_status** is _CRN Filed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set CRN Filed
### Tasks with Details:
- Set CRN Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "crn_filed": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-546" href="#wf-546"></a>
## WF 546 - "PFS CRN 57.105 change to CRN Ready" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_crn_57_105_status** has changed 
  - **pfs_crn_57_105_status** is _CRN Ready_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;Upload completed CRN on CFO Website in&quot;
### Tasks with Details:
- create task for Case Manager &quot;Upload completed CRN on CFO Website in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Upload completed CRN on CFO Website in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-547" href="#wf-547"></a>
## WF 547 - "PFS Received date changed (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_received** has changed 
  - **pfs_received** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
- send email teplate &quot;PFS Letter HO&quot; to CLIENT_EMAIL
- send email template &quot;Request for Explanation PFS HO&quot; to OPPOSING_COUNSEL_EMAIL AND 
- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
- Set PFS CRN 57.105 Status to PFS Received
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review PFS received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email teplate &quot;PFS Letter HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N90, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- send email template &quot;Request for Explanation PFS HO&quot; to OPPOSING_COUNSEL_EMAIL AND 
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N91, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deadline to respond to PFS (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "get_workingday(0, add_days( pfs_received, 25)) (expression)",
        "due_date": "get_workingday(0, add_days( pfs_received, 25)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deadline to respond to PFS in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- Set PFS CRN 57.105 Status to PFS Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pfs_crn_57_105_status": "PFS Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-548" href="#wf-548"></a>
## WF 548 - "PFS Received date changed (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_received** has changed 
  - **pfs_received** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
- send email teplate &quot;PFS Letter PROVIDER&quot; to PROVIDER_EMAIL
- send email template &quot;Request for Explanation PFS PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
- Set PFS CRN 57.105 Status to PFS Received
### Tasks with Details:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review PFS received in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email teplate &quot;PFS Letter PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N92, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- send email template &quot;Request for Explanation PFS PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N93, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All}, 
    ``` 

- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deadline to respond to PFS (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "get_workingday(0, add_days( pfs_received, 25)) (expression)",
        "due_date": "get_workingday(0, add_days( pfs_received, 25)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deadline to respond to PFS in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- Set PFS CRN 57.105 Status to PFS Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pfs_crn_57_105_status": "PFS Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-549" href="#wf-549"></a>
## WF 549 - "PFS CRN 57.105 change to PROVIDER PFS Ready" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_crn_57_105_status** has changed 
  - **pfs_crn_57_105_status** is _PROVIDER PFS Ready_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;File Notice of PFS and E-Mail PFS Package to OC in&quot;
### Tasks with Details:
- create task for Case Manager &quot;File Notice of PFS and E-Mail PFS Package to OC in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'File Notice of PFS and E-Mail PFS Package to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-550" href="#wf-550"></a>
## WF 550 - "PFS CRN 57.105 change to PROVIDER PFS Served" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pfs_crn_57_105_status** has changed 
  - **pfs_crn_57_105_status** is _PROVIDER PFS Served_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set PFS Served
### Tasks with Details:
- Set PFS Served
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pfs_served": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-553" href="#wf-553"></a>
## WF 553 - "Mediation Arbitration change to Arbitration - Award Entered (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_arbitration_status** has changed 
  - **mediation_arbitration_status** is _Arbitration - Award Entered_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
- send email template &quot;Letter to Client - Arbitration Award HO&quot; to CLIENT_EMAIL
- set Arbitration Award
### Tasks with Details:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email template &quot;Letter to Client - Arbitration Award HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N94, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- set Arbitration Award
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "arbitration_award": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-554" href="#wf-554"></a>
## WF 554 - "Mediation Arbitration change to Arbitration - Award Entered (ABO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_arbitration_status** has changed 
  - **mediation_arbitration_status** is _Arbitration - Award Entered_ 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
- send email template &quot;Letter to Client - Arbitration Award PROVIDER&quot; to PROVIDER_EMAIL
- set Arbitration Award
### Tasks with Details:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- send email template &quot;Letter to Client - Arbitration Award PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N95, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- set Arbitration Award
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "arbitration_award": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-555" href="#wf-555"></a>
## WF 555 - "Arbitration - Deadline date  changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **arbitration_deadline** has changed 
  - **arbitration_deadline** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Letter to OC re Arbitration&quot; to OPPOSING_COUNSEL_EMAIL and 
- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Arbitration with OC's office in&quot;
### Tasks with Details:
- send email template &quot;Letter to OC re Arbitration&quot; to OPPOSING_COUNSEL_EMAIL and 
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N96, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Arbitration with OC's office in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Arbitration with OCs office in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Mediation Arbitration (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-556" href="#wf-556"></a>
## WF 556 - "Mediation Arbitration change to Arbitration - Mtn for Trial De Novo" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_arbitration_status** has changed 
  - **mediation_arbitration_status** is _Arbitration - Mtn for Trial De Novo_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Mtn for Trial De Novo&quot;
### Tasks with Details:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Mtn for Trial De Novo&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate hearing on Mtn for Trial De Novo in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-557" href="#wf-557"></a>
## WF 557 - "Arbitration Date changed (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **arbitration_date** has changed 
  - **arbitration_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Arbitration HO&quot; to CLIENT_EMAIL
### Tasks with Details:
- send email template &quot;Letter to Client re Arbitration HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N97, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-558" href="#wf-558"></a>
## WF 558 - "Arbitration Date changed (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **arbitration_date** has changed 
  - **arbitration_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Arbitration PROVIDER&quot; to PROVIDER_EMAIL
### Tasks with Details:
- send email template &quot;Letter to Client re Arbitration PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N98, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-559" href="#wf-559"></a>
## WF 559 - "Mediation - Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_deadline_ma** has changed 
  - **mediation_deadline_ma** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Letter to OC re Mediation&quot; to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Mediation with OC's office in&quot;
### Tasks with Details:
- send email template &quot;Letter to OC re Mediation&quot; to OPPOSING_COUNSEL_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N99, email: [$(relatedRecord : opposing_counsel|email|Attorneys)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Mediation with OC's office in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Coordinate Mediation with OCs office in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Mediation Arbitration (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-560" href="#wf-560"></a>
## WF 560 - "Mediation Date changed (HO)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_date** has changed 
  - **mediation_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _HO_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Mediation HO&quot; to CLIENT_EMAIL
### Tasks with Details:
- send email template &quot;Letter to Client re Mediation HO&quot; to CLIENT_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N100, email: [$(relatedRecord : insured|e_mail|Insureds)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-561" href="#wf-561"></a>
## WF 561 - "Mediation Date changed (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_date** has changed 
  - **mediation_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Mediation PROVIDER&quot; to Provider_EMAIL
### Tasks with Details:
- send email template &quot;Letter to Client re Mediation PROVIDER&quot; to Provider_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N101, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

<a id="user-content-wf-562" href="#wf-562"></a>
## WF 562 - "Mediation Arbitration change to Mediation - Settled" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **mediation_arbitration_status** has changed 
  - **mediation_arbitration_status** is _Mediation - Settled_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Settlement Status to Settled - Awaiting Release
### Tasks with Details:
- Set Settlement Status to Settled - Awaiting Release
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_status": "SETTLED - Awaiting Release (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-563" href="#wf-563"></a>
## WF 563 - "45 day before Motion in Limine Deadline date create task for Scheduling Team - Hearings" (MANUAL)
### Conditions:
- All:
  - **motion_in_limine_deadline** is not empty 
  - **motion_in_limine_deadline** days later _45_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 45 day before Motion in Limine Deadline create task to Scheduling Team - Hearings to &quot;Schedule Motion in Limine for Hearing in&quot; 
### Tasks with Details:
- 45 day before Motion in Limine Deadline create task to Scheduling Team - Hearings to &quot;Schedule Motion in Limine for Hearing in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Schedule Motion in Limine for Hearing in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Scheduling Team - Hearings (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-564" href="#wf-564"></a>
## WF 564 - "Request for Disco Update - Received changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **request_4_disco_update_receive** has changed 
  - **request_4_disco_update_receive** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Request for Disco Update - Received
### Tasks with Details:
- Set Plaintiff Discovery Status to Request for Disco Update - Received
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "plaintiff_discovery_status": "Request for Disco Update - Received (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-565" href="#wf-565"></a>
## WF 565 - "Answer date (Complaint stage) changed (AOB or HO Cases)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **answer** has changed 
  - **answer** is not empty 
  - **lock_automation** is _0_ 
  - **insurance_company** does not contain _Citizens Property_ 
- At least one:
  - **type_of_claim** is _HO_ 
  - **type_of_claim** is _AOB_ 
### Tasks:
- generate package CRN
- create task for RPA Team to &quot;Send @@CASE_ID@@ Civil Remedy Notice CRN&quot;
### Tasks with Details:
- generate package CRN
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: CRN, conditionString: , shouldSend: , shouldDropbox: , stopOnError: on}, 
    ``` 

- create task for RPA Team to &quot;Send @@CASE_ID@@ Civil Remedy Notice CRN&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send @@CASE_ID@@ Civil Remedy Notice CRN' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "RPA Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-567" href="#wf-567"></a>
## WF 567 - "90 days after Service of Process change (AOB)" (ON_SCHEDULE)
### Conditions:
- All:
  - **type_of_claim** is _AOB_ 
  - **service_of_process** is not empty 
  - **service_of_process** days ago _90_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create document template &quot;Ps PFS&quot;
- create task for Assigned Attorney to &quot;Review and Edit Ps PFS to send to Defendant in AOB case re:&quot;
### Tasks with Details:
- create document template &quot;Ps PFS&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N208, conditionString: }, 
    ``` 

- create task for Assigned Attorney to &quot;Review and Edit Ps PFS to send to Defendant in AOB case re:&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and Edit Ps PFS to send to Defendant in AOB case re: @@CASE_ID@@ @@INJUREDPARTY_NAME@@&quot;' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-568" href="#wf-568"></a>
## WF 568 - "Settlement Status change to SETTLED &amp; PAID - Global" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settlement_status** has changed 
  - **settlement_status** is _SETTLED &amp; PAID - Global_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
### Tasks with Details:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file to determine if file can be Closed in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-569" href="#wf-569"></a>
## WF 569 - "After Notice for Trial date Entered" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **notice_for_trial** has changed 
  - **lock_automation** is _0_ 
  - **notice_for_trial** is not empty 
- At least one:
### Tasks:
- create document &quot;Pre-trial Catalog&quot;
- create task for Assigned Attorney to &quot;Review and Edit Pre-trial Catalog in; once complete send for filing unless Order specifically states not to file (ie Broward)&quot;
- set Trial Status to Trial Package
- Generate trial package
- Send trial package to Peru Queue
- Set Trial Status to Trial Package Prepared and Sent
### Tasks with Details:
- create document &quot;Pre-trial Catalog&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N196, conditionString: }, 
    ``` 

- create task for Assigned Attorney to &quot;Review and Edit Pre-trial Catalog in; once complete send for filing unless Order specifically states not to file (ie Broward)&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review and Edit Pre-trial Catalog in @@CASE_ID@@ @@INJUREDPARTY_NAME@@; once complete send for filing unless Order specifically states not to file (ie Broward)&quot;' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Trial Status to Trial Package
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "trial_status": "Trial Package (rawtext)"
    }, 
    ``` 

- Generate trial package
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N196, conditionString: , stopOnError: }, 
    ``` 

- Send trial package to Peru Queue
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "Trial package (rawtext)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Trial Status to Trial Package Prepared and Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "trial_status": "Trial Package Prepared and Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-570" href="#wf-570"></a>
## WF 570 - "1 day before Depo of Plaintiff Date create task for Attorney (User)" (ON_SCHEDULE)
### Conditions:
- All:
  - **depo_of_plaintiff_date** is not empty 
  - **depo_of_plaintiff_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Depo of Plaintiff Date create task for Assigned Attorney &quot;Prepare for Deposition of Plaintiff&quot;
### Tasks with Details:
- 1 day before Depo of Plaintiff Date create task for Assigned Attorney &quot;Prepare for Deposition of Plaintiff&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Plaintiff @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-571" href="#wf-571"></a>
## WF 571 - "Depo of Plaintiff Date changed (AOB)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **depo_of_plaintiff_date** has changed 
  - **depo_of_plaintiff_date** is not empty 
  - **lock_automation** is _0_ 
  - **type_of_claim** is _AOB_ 
- At least one:
### Tasks:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
- send email template &quot;Plaintiff Depo Set PROVIDER&quot; to PROVIDER_EMAIL
- Set Defendant Deposition Status to Plaintiff Depo - Set
### Tasks with Details:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Deposition of Plaintiff (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "depo_of_plaintiff_date (fieldname)",
        "due_date": "depo_of_plaintiff_date (fieldname)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Deposition of Plaintiff in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

- send email template &quot;Plaintiff Depo Set PROVIDER&quot; to PROVIDER_EMAIL
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N105, email: [$(relatedRecord : provider|email|Providers)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -}, 
    ``` 

- Set Defendant Deposition Status to Plaintiff Depo - Set
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "defendant_deposition_status": "Plaintiff Depo - Set (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-572" href="#wf-572"></a>
## WF 572 - "1 day before Ps Engineer Depo Date create task for Attorney (User)" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_engineer_depo_date** is not empty 
  - **ps_engineer_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Engineer Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Engineer in&quot;
### Tasks with Details:
- 1 day before Ps Engineer Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Engineer in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ps Engineer in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-573" href="#wf-573"></a>
## WF 573 - "1 day before Ps Insurance Expert Depo Date create task for Attorney (User)" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_insurance_expert_depo_date** is not empty 
  - **ps_insurance_expert_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Insurance Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Ins Expert in&quot;
### Tasks with Details:
- 1 day before Ps Insurance Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Ins Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ps Ins Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-574" href="#wf-574"></a>
## WF 574 - "1 day before Insured Depo Date create task for Attorney (User)" (ON_SCHEDULE)
### Conditions:
- All:
  - **insured_depo_date** is not empty 
  - **insured_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Insured Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of Insured in&quot;
### Tasks with Details:
- 1 day before Insured Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of Insured in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Insured in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-575" href="#wf-575"></a>
## WF 575 - "1 day before Ps Pricing Expert Depo Date create task for Attorney (User)" (ON_SCHEDULE)
### Conditions:
- All:
  - **ps_pricing_expert_depo_date** is not empty 
  - **ps_pricing_expert_depo_date** days later _1_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Pricing Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Pricing Expert in&quot;
### Tasks with Details:
- 1 day before Ps Pricing Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Pricing Expert in&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare for Deposition of Ps Pricing Expert in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-580" href="#wf-580"></a>
## WF 580 - "On create - set default Assigned to, Attorney, Attorney (User) = Robert Gonzalez" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **attorney** is empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set default Attorney = Robert Gonzalez, Assigned to = Robert Gonzalez
### Tasks with Details:
- set default Attorney = Robert Gonzalez, Assigned to = Robert Gonzalez
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "attorney": "get_id('Attorneys', 'attorney_name', 'Robert F. Gonzalez, Esq.') (expression)",
      "assigned_user_id": "13 (rawtext)",
      "attorney_user": "13 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-590" href="#wf-590"></a>
## WF 590 - "2 days after Complaint Status set to Filing Team" (ON_SCHEDULE)
### Conditions:
- All:
  - **stage** is _Complaint_ 
  - **status** is _Case Filed_ 
  - **status_age** equal to _2_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager in 2 days to after Complayant status is set to Case Filed &quot;Check docket for executed summons for&quot;
### Tasks with Details:
- add task for Case Manager in 2 days to after Complayant status is set to Case Filed &quot;Check docket for executed summons for&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Check docket for executed summons for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-591" href="#wf-591"></a>
## WF 591 - "Complaint Status change to Need to Reissue or Pay for Summons" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Need to Reissue or Pay for Summons_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Reissue or Pay for Summons for Case Manager
### Tasks with Details:
- Reissue or Pay for Summons for Case Manager
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Reissue or Pay for Summons for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-592" href="#wf-592"></a>
## WF 592 - "Complaint Status change to Summons - Reissued" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Summons - Reissued_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve Summons on Defendant via LSOP
### Tasks with Details:
- add task for Case Manager &quot;Serve Summons on Defendant via LSOP
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Serve Summons on Defendant via LSOP in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-593" href="#wf-593"></a>
## WF 593 - "Complaint Status change to Summons - Reissued Miami Dade" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Summons - Reissued Miami Dade_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve Summons on Defendant
### Tasks with Details:
- add task for Case Manager &quot;Serve Summons on Defendant
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Serve Summons on Defendant via LSOP in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-594" href="#wf-594"></a>
## WF 594 - "Complaint Status change to LSOP Package Prepared" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _LSOP Package Prepared_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve LSOP PACKAGE through LSOP website
### Tasks with Details:
- add task for Case Manager &quot;Serve LSOP PACKAGE through LSOP website
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Serve LSOP PACKAGE through LSOP website in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-595" href="#wf-595"></a>
## WF 595 - "Complaint Status change to Pending Filing" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Pending Filing_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;E-file initial package in Florida E-file Portal
### Tasks with Details:
- add task for Case Manager &quot;E-file initial package in Florida E-file Portal
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'E-file initial package in Florida E-file Portal for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-596" href="#wf-596"></a>
## WF 596 - "Complaint Status change to Possible Paid Prior to Filing" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Possible Paid Prior to Filing_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for SUPERVISOR &quot;Check with Claimpay and/or client for possible payment prior to filing&quot;
### Tasks with Details:
- add task for SUPERVISOR &quot;Check with Claimpay and/or client for possible payment prior to filing&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Check with Claimpay and/or client for possible payment prior to filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@ and possibly close with comment' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-599" href="#wf-599"></a>
## WF 599 - "Assign to change" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **assigned_user_id** has changed 
- At least one:
### Tasks:
- Copy Assign to to Attoreny (user)
### Tasks with Details:
- Copy Assign to to Attoreny (user)
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "attorney_user": "fromField-assigned_user_id (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-600" href="#wf-600"></a>
## WF 600 - "Testy generacji pakietu i wysyłki do dropbox" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _DOTS (H46)_ 
  - **total_balance** has changed 
- At least one:
### Tasks:
- ~generuj dokument z pakietu~
### Tasks with Details:
- ~~generuj dokument z pakietu~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Generuj testowy pakiet (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N5') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

<a id="user-content-wf-603" href="#wf-603"></a>
## WF 603 - "Pre-Litigation Status: New Case Entered - Not Ripe does not change within 10 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _10_ 
  - **status** is _New Case Entered - Not Ripe_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- change status to &quot;Presuit - Demand Sent&quot;
### Tasks with Details:
- change status to &quot;Presuit - Demand Sent&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Presuit - Demand Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-604" href="#wf-604"></a>
## WF 604 - "Pre-Litigation Status change to Contact Pending" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Contact Pending_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for HOS Pre-Suit to &quot;Contact $(record : insured)$ in Order to discuss retainer&quot;
### Tasks with Details:
- add task for HOS Pre-Suit to &quot;Contact $(record : insured)$ in Order to discuss retainer&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Contact $(record : insured)$ in Order to discuss retainer' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(3)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-605" href="#wf-605"></a>
## WF 605 - "Pre-Litigation Status: Retainer Agreement - Pending not change within 3 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _3_ 
  - **status** is _Retainer Agreement - Pending_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  add task for HOS Pre-Suit to &quot;Contact $(record : insured)$ to follow up re Pending Retainer&quot;
### Tasks with Details:
-  add task for HOS Pre-Suit to &quot;Contact $(record : insured)$ to follow up re Pending Retainer&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Contact $(record : insured)$ to follow up re Pending Retainer' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "HOS PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(3)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-606" href="#wf-606"></a>
## WF 606 - "Pre-Litigation Status change to Presuit - 2nd Demand Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - 2nd Demand Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Second Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding 2nd Pre-Suit Demand&quot;
### Tasks with Details:
- send e-mail template &quot;Second Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N112, email: [$(relatedRecord : adjuster|email|Adjusters)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding 2nd Pre-Suit Demand&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with Adjuster regarding 2nd Pre-Suit Demand @@CASE_ID@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-607" href="#wf-607"></a>
## WF 607 - "Pre-Litigation Status: Presuit - 2nd Demand Sent does not change within 10 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _10_ 
  - **status** is _Presuit - 2nd Demand Sent_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- change status to &quot;Presuit - 3rd Demand Sent&quot;
### Tasks with Details:
- change status to &quot;Presuit - 3rd Demand Sent&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Presuit - 3rd Demand Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-608" href="#wf-608"></a>
## WF 608 - "Pre-Litigation Status change to Presuit - 3rd Demand Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - 3rd Demand Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  send e-mail template &quot;Third Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding 3rd Pre-Suit Demand&quot;
### Tasks with Details:
-  send e-mail template &quot;Third Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N113, email: [$(relatedRecord : adjuster|email|Adjusters)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding 3rd Pre-Suit Demand&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with Adjuster regarding 3rd Pre-Suit Demand @@CASE_ID@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-609" href="#wf-609"></a>
## WF 609 - "Pre-Litigation Status: Presuit - 3rd Demand Sent does not change within 10 days" (ON_SCHEDULE)
### Conditions:
- All:
  - **status_age** equal to _10_ 
  - **status** is _Presuit - 3rd Demand Sent_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- change status to &quot;Presuit - 4th Demand Sen&quot;
### Tasks with Details:
- change status to &quot;Presuit - 4th Demand Sen&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Presuit - 4th Demand Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-610" href="#wf-610"></a>
## WF 610 - "Pre-Litigation Status change to Presuit - 4th Demand Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - 4th Demand Sent_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Fourth Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
### Tasks with Details:
- send e-mail template &quot;Fourth Demand for Pre-Suit Payment&quot; to $(record : adjuster)$
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N114, email: [$(relatedRecord : adjuster|email|Adjusters)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-611" href="#wf-611"></a>
## WF 611 - "Pre-Litigation Status: Presuit - 4th Demand Sent does not change 90 days since First Notice of Loss" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Presuit - 4th Demand Sent_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
  - **first_notice_of_loss** days ago _90_ 
- At least one:
### Tasks:
- change status to &quot;10-Day Demand - Sent&quot;
### Tasks with Details:
- change status to &quot;10-Day Demand - Sent&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "10-Day Demand - Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-612" href="#wf-612"></a>
## WF 612 - "Pre-Litigation Status: Presuit - Settlement Negotiations does not change 90 days since First Notice of Loss" (ON_SCHEDULE)
### Conditions:
- All:
  - **status** is _Presuit - Settlement Negotiations_ 
  - **stage** is _Pre-Litigation_ 
  - **lock_automation** is _0_ 
  - **first_notice_of_loss** days ago _90_ 
- At least one:
### Tasks:
- change status to &quot;10-Day Demand - Sent&quot;
### Tasks with Details:
- change status to &quot;10-Day Demand - Sent&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "10-Day Demand - Sent (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-613" href="#wf-613"></a>
## WF 613 - "Pre-Litigation Status change to Presuit - Offer to Pay in Full" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - Offer to Pay in Full_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- stop all workflow automation
- send email template &quot;Presuit-Offer to Pay in Full&quot;
### Tasks with Details:
- stop all workflow automation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

- send email template &quot;Presuit-Offer to Pay in Full&quot;
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N115, email: [], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-614" href="#wf-614"></a>
## WF 614 - "Pre-Litigation Status change to Ready for Litigation" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Ready for Litigation_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- add task for SUPERVISOR to &quot;Review file for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to determine if ready to activate status to Complaint Printed&quot;
- Set Assigned to from users from User Group = Attorneys
- Set AOB/DTP Attorney according to user from Assigned to field (based on User group Attorneys)
### Tasks with Details:
- add task for SUPERVISOR to &quot;Review file for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to determine if ready to activate status to Complaint Printed&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review file for @@CASE_ID@@ @@INJUREDPARTY_NAME@@ to determine if ready to activate status to Complaint Printed' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "SUPERVISOR (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Set Assigned to from users from User Group = Attorneys
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "assigned_user_id": "fromUserGroup-Attorneys (rawtext)"
    }, 
    ``` 

- Set AOB/DTP Attorney according to user from Assigned to field (based on User group Attorneys)
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: setAttorneyByAssignedTo}, 
    ``` 

<a id="user-content-wf-615" href="#wf-615"></a>
## WF 615 - "Complaint Status change to Complaint Printed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Complaint Printed_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~create package &quot;Complaint Package&quot;~
- ~create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;~
- ~set Complaint Package Prepared~
- Generate package &quot;Complaint Package&quot;
- create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;
- set Complaint Package Prepared
### Tasks with Details:
- ~~create package &quot;Complaint Package&quot;~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Create package &quot;Complaint Package&quot; (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N11') (expression)",
        "send_to_dropbox": "$(relatedRecordId : document_package|send_to_dropbox|DocumentPackages)$ (expression)"
      }
    }, 
    ``` 

- ~~create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Go to Dropbox and File Complaint Package for @@CASE_ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

- ~~set Complaint Package Prepared~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_package_prepared": "get_date('today') (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Generate package &quot;Complaint Package&quot;
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Complaint Package, conditionString: , shouldSend: , stopOnError: on, shouldDropbox: }, 
    ``` 

- create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Go to Dropbox and File Complaint Package for @@CASE_ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Complaint Package Prepared
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_package_prepared": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-616" href="#wf-616"></a>
## WF 616 - "Complaint Status change to LSOP Case - Service Pending" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _LSOP Case - Service Pending_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;Check for and add Notice of Service of Process to @@CASE ID@@ @@INJUREDPARTY_NAME@@; once added change status to LSOP Case - Served.&quot;
### Tasks with Details:
- create task for Case Manager &quot;Check for and add Notice of Service of Process to @@CASE ID@@ @@INJUREDPARTY_NAME@@; once added change status to LSOP Case - Served.&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Check for and add Notice of Service of Process to @@CASE_ID@@ @@INJUREDPARTY_NAME@@; once added change status to LSOP Case - Served' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-617" href="#wf-617"></a>
## WF 617 - "Service of Process has changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **service_of_process** has changed 
  - **service_of_process** is not empty 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- change Complaint Status to LSOP Case Served
- add calendar event 23 days after Service of Process for Assign To and Case Manager
### Tasks with Details:
- change Complaint Status to LSOP Case Served
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "LSOP Case Served (rawtext)"
    }, 
    ``` 

- add calendar event 23 days after Service of Process for Assign To and Case Manager
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "'Response to Complaint Due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "date_start": "concat(get_workingday(0, add_days( service_of_process, 23)), ' 07:00:00') (expression)",
        "due_date": "concat(get_workingday(0, add_days( service_of_process, 23)), ' 07:00:00') (expression)",
        "activitytype": "Task (rawtext)",
        "notes": "'Response to Complaint Due in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "shownerid": "fromField-case_manager,fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-618" href="#wf-618"></a>
## WF 618 - "Complaint Status change to Case Filed (Total Balance&lt;15000)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** is _Case Filed_ 
  - **complaint_status** has changed 
  - **lock_automation** is _0_ 
  - **total_balance** less than _15000_ 
- At least one:
### Tasks:
- ~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~
- Set Case Filed date
- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $320.85&quot;
### Tasks with Details:
- ~~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Check docket for executed summons for @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "due_date": "get_workingday(0, add_days(2)) (expression)"
      }
    }, 
    ``` 

- Set Case Filed date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case_filed": "get_date('today') (expression)"
    }, 
    ``` 

- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $320.85&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "LitigationCosts",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "litigation_cost_name": "'Fililing Fee for Total Balance = $(record : total_balance)$' (expression)",
        "litigation_cost_amount": "320.85 (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-619" href="#wf-619"></a>
## WF 619 - "Add to Popup Message changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **add_to_popup_message** has changed 
  - **add_to_popup_message** is not empty 
- At least one:
### Tasks:
- update Popup Message
### Tasks with Details:
- update Popup Message
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "popup_message": "concat( popup_message, '\\n', get_datetime(), ': ', add_to_popup_message, ' by ', '$(record : modifiedby)$') (expression)",
      "add_to_popup_message": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-620" href="#wf-620"></a>
## WF 620 - "Remove white chars on Policy Number and Claim Number" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **policy_number** has changed 
  - **claim_number** has changed 
### Tasks:
- Remove white chars on Policy Number and all non-alphanumeric from Claim Number
### Tasks with Details:
- Remove white chars on Policy Number and all non-alphanumeric from Claim Number
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "claim_number": "remove_nonalphanumeric_chars(claim_number) (expression)",
      "policy_number": "remove_white_chars(policy_number) (expression)"
    }, 
    ``` 

<a id="user-content-wf-622" href="#wf-622"></a>
## WF 622 - "Assign a Case Manager to Shared with" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- Copy &quot;Case Manager&quot; to &quot;Share with users&quot;
### Tasks with Details:
- Copy &quot;Case Manager&quot; to &quot;Share with users&quot;
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "shownerid": "fromField-case_manager (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-624" href="#wf-624"></a>
## WF 624 - "ON_CHANGE Settl. Negot. Demand" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settl_negot_demand** has changed 
  - **settl_negot_demand** is not empty 
- At least one:
### Tasks:
- Add new note to Demand Notes
### Tasks with Details:
- Add new note to Demand Notes
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settl_negot_demand_last_date": "get_datetime() (expression)",
      "internal_temp_note": "'$(record : settl_negot_demand_last_date)$: $(record : settl_negot_demand)$ by $(record : demand_sender)$' (expression)",
      "settl_negot_demand_notes": "concat( settl_negot_demand_notes, '\\n', internal_temp_note ) (expression)",
      "settl_negot_demand_age": "0 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-625" href="#wf-625"></a>
## WF 625 - "ON_CHANGE Settl. Negot. Offer" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **settl_negot_offer** has changed 
  - **settl_negot_offer** is not empty 
- At least one:
### Tasks:
- Add new note to Offer Notes
### Tasks with Details:
- Add new note to Offer Notes
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settl_negot_offer_last_date": "get_datetime() (expression)",
      "internal_temp_note": "'$(record : settl_negot_offer_last_date)$: $(record : settl_negot_offer)$ by $(record : settl_negot_offer_oc_adjuster)$' (expression)",
      "settl_negot_offer_notes": "concat( settl_negot_offer_notes, '\\n', internal_temp_note ) (expression)",
      "settl_negot_offer_age": "0 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-626" href="#wf-626"></a>
## WF 626 - "On change of County set Court" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **total_balance** greater than _0_ 
  - **county** is not empty 
  - **lock_automation** is _0_ 
- At least one:
  - **county** has changed 
### Tasks:
- Set Court 
### Tasks with Details:
- Set Court 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "court": "if total_balance &lt;50000 then $(relatedRecordId : county|county_court|Counties)$ else $(relatedRecordId : county|circuit_court|Counties)$ end (expression)"
    }, 
    ``` 

<a id="user-content-wf-628" href="#wf-628"></a>
## WF 628 - "Clear Court when Total balance or County empty" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **court** is not empty 
- At least one:
  - **total_balance** equal to _0_ 
  - **county** is empty 
### Tasks:
- Crear Court 
### Tasks with Details:
- Crear Court 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "court": " (expression)"
    }, 
    ``` 

<a id="user-content-wf-631" href="#wf-631"></a>
## WF 631 - "Find Similar Cases" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- CF findSimilarCases
### Tasks with Details:
- CF findSimilarCases
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: findSimilarCases}, 
    ``` 

<a id="user-content-wf-632" href="#wf-632"></a>
## WF 632 - "Status of Pre-Litigation change to Presuit-Demand Sent" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed 
  - **pre_litigation_status** is _Presuit - Demand Sent_ 
  - **lock_automation** is _0_ 
  - **case_id** starts with _PDC_ 
- At least one:
### Tasks:
- ~send e-mail template &quot;Demand for Pre-Suit Payment&quot; to Adjuster~
- ~Create Package &quot;Pre-Suit Demand&quot;~
- ~add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;~
- ~Update Pre-Suit Demand Sent~
- Create Package &quot;Pre-Suit Demand&quot;
- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;
- Update Pre-Suit Demand Sent
### Tasks with Details:
- ~~send e-mail template &quot;Demand for Pre-Suit Payment&quot; to Adjuster~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N118, email: [$(relatedRecord : adjuster|email|Adjusters)$], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- ~~Create Package &quot;Pre-Suit Demand&quot;~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Create Package &quot;Pre-Suit Demand&quot; (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "fromField-assigned_user_id (rawtext)",
        "document_package": "get_id('DocumentPackages', 'number', 'N26') (expression)"
      }
    }, 
    ``` 

- ~~add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with Adjuster regarding Pre-Suit Demand @@CASE_ID@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)"
      }
    }, 
    ``` 

- ~~Update Pre-Suit Demand Sent~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "pre_suit_demand_sent": "get_date('today') (expression)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Create Package &quot;Pre-Suit Demand&quot;
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Pre-Suit Demand, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with Adjuster regarding Pre-Suit Demand @@CASE_ID@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)",
        "case": "$(record : RecordId)$ (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Update Pre-Suit Demand Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_suit_demand_sent": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-633" href="#wf-633"></a>
## WF 633 - "On create - common tasks" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- CF findSimilarCases
### Tasks with Details:
- CF findSimilarCases
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: findSimilarCases}, 
    ``` 

<a id="user-content-wf-636" href="#wf-636"></a>
## WF 636 - "Complaint Status change to Voluntary Dismissal w/o Prejudice - Re-file" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Voluntary Dismissal w/o Prejudice - Re-file_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared
- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice Re-File
- create task for Case Manager to &quot;Review case for deficiencies to cure before re-filing&quot;. 
### Tasks with Details:
- set Complaint Package Prepared
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_dismissal": "get_date('today') (expression)"
    }, 
    ``` 

- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice Re-File
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N120, email: , relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- create task for Case Manager to &quot;Review case for deficiencies to cure before re-filing&quot;. 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Review case  @@CASE_ID@@ for deficiencies to cure before re-filing' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-case_manager (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-637" href="#wf-637"></a>
## WF 637 - "Complaint Status change to Voluntary Dismissal w/o Prejudice - No Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Voluntary Dismissal w/o Prejudice - No Fees_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared, Final Status
- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice No Fees
### Tasks with Details:
- set Complaint Package Prepared, Final Status
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_dismissal": "get_date('today') (expression)",
      "final_status": "CLOSED (rawtext)"
    }, 
    ``` 

- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice No Fees
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N121, email: [], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-638" href="#wf-638"></a>
## WF 638 - "Complaint Status change to Voluntary Dismissal w/ Prejudice" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed 
  - **complaint_status** is _Voluntary Dismissal w/ Prejudice_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared, Final Status
- send e-mail template Closing Email - Voluntary Dismissal w Prejudice
### Tasks with Details:
- set Complaint Package Prepared, Final Status
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "voluntary_dismissal": "get_date('today') (expression)",
      "final_status": "CLOSED (rawtext)"
    }, 
    ``` 

- send e-mail template Closing Email - Voluntary Dismissal w Prejudice
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N122, email: [], relations_email: -, emailoptout: , smtp: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-641" href="#wf-641"></a>
## WF 641 - "Update Total Settlement" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **attorney_fee** has changed 
  - **settlement_amount** has changed 
  - **settlement_costs** has changed 
### Tasks:
- set Total Settlement=Settlement Amount + Attorney Fee + Settlement Costs
### Tasks with Details:
- set Total Settlement=Settlement Amount + Attorney Fee + Settlement Costs
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "total_settlement": "settlement_amount+attorney_fee+settlement_costs (expression)"
    }, 
    ``` 

<a id="user-content-wf-644" href="#wf-644"></a>
## WF 644 - "Default for Status Date" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- Set Status Date
### Tasks with Details:
- Set Status Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "status_date": "nvl(status_date, get_datetime()) (expression)"
    }, 
    ``` 

<a id="user-content-wf-647" href="#wf-647"></a>
## WF 647 - "Create Complaint Package" (MANUAL)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- ~Create package Complaint Package~
- ~Set Complaint Status = Complaint Printed~
- Generate package Complaint Package
- Set Complaint Status = Complaint Printed
### Tasks with Details:
- ~~Create package Complaint Package~~
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
        "mod_name": "Cases (rawtext)",
        "batch_task_type": "Document Package (rawtext)",
        "batch_task_name": "Create package &quot;Complaint Package&quot; (from WF) (rawtext)",
        "batch_task_status": "Pending (rawtext)",
        "assigned_user_id": "triggerUser (rawtext)",
        "document_package": "get_id('DocumentPackages', 'document_package_name', 'Complaint Package') (expression)"
      }
    }, 
    ``` 

- ~~Set Complaint Status = Complaint Printed~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "complaint_status": "Complaint Printed (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Generate package Complaint Package
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Complaint Package, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: on}, 
    ``` 

- Set Complaint Status = Complaint Printed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "complaint_status": "Complaint Printed (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-648" href="#wf-648"></a>
## WF 648 - "ON_CHANGE of Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **status** has changed 
  - **status** is not empty 
- At least one:
### Tasks:
- Set Status Date and Status Age
### Tasks with Details:
- Set Status Date and Status Age
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "status_date": "get_datetime() (expression)",
      "status_age": "0 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-651" href="#wf-651"></a>
## WF 651 - "Set Court " (TRIGGER)
### Conditions:
- All:
  - **total_balance** greater than _0_ 
  - **lock_automation** is _0_ 
  - **county** is not empty 
- At least one:
### Tasks:
- Set Court 
### Tasks with Details:
- Set Court 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "court": "if total_balance &lt;50000 then $(relatedRecordId : county|county_court|Counties)$ else $(relatedRecordId : county|circuit_court|Counties)$ end (expression)"
    }, 
    ``` 

<a id="user-content-wf-652" href="#wf-652"></a>
## WF 652 - "Copy AOB/DTP Attorney to Demand Sender" (ONCE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **stage** has changed to _Settlement_ 
- At least one:
### Tasks:
- Set AOB/DTP Attorney to Demand Sender
### Tasks with Details:
- Set AOB/DTP Attorney to Demand Sender
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "demand_sender": "fromField-attorney_user (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-653" href="#wf-653"></a>
## WF 653 - "Add task 30 days before Date Fact Witness Deadline" (ON_SCHEDULE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **fact_witness_deadline** is not empty 
  - **fact_witness_deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Fact Witness Deadline
### Tasks with Details:
- add task for Attorney 30 days before date in field Fact Witness Deadline
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare Fact Witness List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-654" href="#wf-654"></a>
## WF 654 - "Fact Witness Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **fact_witness_deadline** is not empty 
  - **fact_witness_deadline** has changed 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline 
### Tasks with Details:
- create calendar event for Attorney 10-days before deadline 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Prepare Fact Witness List or Pre-Trial Catalog (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( fact_witness_deadline, -10))  (expression)",
        "due_date": "get_workingday(0, add_days( fact_witness_deadline, -10))  (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Prepare Fact Witness List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-655" href="#wf-655"></a>
## WF 655 - "Add task 30 days before Expert Witness Deadline" (ON_SCHEDULE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **expert_witnes_deadline** is not empty 
  - **expert_witnes_deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Expert Witness Deadline
### Tasks with Details:
- add task for Attorney 30 days before date in field Expert Witness Deadline
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare Expert Witness List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-656" href="#wf-656"></a>
## WF 656 - "Expert Witness Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **expert_witnes_deadline** has changed 
  - **expert_witnes_deadline** is not empty 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline
### Tasks with Details:
- create calendar event for Attorney 10-days before deadline
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Prepare Expert Witness List or Pre-Trial Catalog (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( expert_witnes_deadline, -10)) (expression)",
        "due_date": "get_workingday(0, add_days( expert_witnes_deadline, -10)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Prepare Expert Witness List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-657" href="#wf-657"></a>
## WF 657 - "Add task 30 days before Date Exhibit List Deadline" (ON_SCHEDULE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **exhibit_list_deadline** is not empty 
  - **exhibit_list_deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Exhibit List Deadline
### Tasks with Details:
- add task for Attorney 30 days before date in field Exhibit List Deadline
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Prepare Exhibit List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-relatedRecordId:attorney:attorney_user:Attorneys (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

<a id="user-content-wf-658" href="#wf-658"></a>
## WF 658 - "Exhibit List Deadline changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **exhibit_list_deadline** is not empty 
  - **exhibit_list_deadline** has changed 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline 
### Tasks with Details:
- create calendar event for Attorney 10-days before deadline 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Calendar",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "subject": "Prepare Exhibit List or Pre-Trial Catalog (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "date_start": "get_workingday(0, add_days( exhibit_list_deadline, -10)) (expression)",
        "due_date": "get_workingday(0, add_days( exhibit_list_deadline, -10)) (expression)",
        "activitytype": "Task (rawtext)",
        "case": "$(record : RecordId)$ (expression)",
        "notes": "'Prepare Exhibit List or Pre-Trial Catalog @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "allday": "true:boolean (rawtext)",
        "shownerid": "fromField-case_manager (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-659" href="#wf-659"></a>
## WF 659 - "ON_CHANGE Case financial parameters" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **attorney_fees_demand_letter** has changed 
  - **total_balance** has changed 
  - **total_partial_settlements** has changed 
  - **total_bill_amount** has changed 
### Tasks:
- call CF recalculateFromCase
### Tasks with Details:
- call CF recalculateFromCase
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromCase}, 
    ``` 

<a id="user-content-wf-661" href="#wf-661"></a>
## WF 661 - "Case Collections Summary data changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **total_collections** has changed 
  - **total_collections** greater than _0_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- send a Notification to Assigned to: “Case Collections Summary data was changed: [link to the Case]”.
### Tasks with Details:
- send a Notification to Assigned to: “Case Collections Summary data was changed: [link to the Case]”.
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_SYSTEM, message: Case Collections Summary data was changed: <a href="$(record : CrmDetailViewURL)$">$(record : case_id)$</a>, recipients: fromField-assigned_user_id, title: Case Collections Summary changed, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-664" href="#wf-664"></a>
## WF 664 - "If PDC Case created" (MANUAL)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **case_id** starts with _PDC_ 
- At least one:
### Tasks:
- Set Pre-Litigation Status to &quot;Presuit - Demand Sent&quot; and Settler
### Tasks with Details:
- Set Pre-Litigation Status to &quot;Presuit - Demand Sent&quot; and Settler
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_litigation_status": "Presuit - Demand Sent (rawtext)",
      "settler": "fromUserGroup-Settlers (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-665" href="#wf-665"></a>
## WF 665 - "Set Fees and Costs" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **attorney_fee** has changed 
  - **settlement_costs** has changed 
### Tasks:
- Set Fees and Costs = Attorney Fee + Settlement Cost
### Tasks with Details:
- Set Fees and Costs = Attorney Fee + Settlement Cost
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "fees_and_costs": "attorney_fee +  settlement_costs (expression)"
    }, 
    ``` 

<a id="user-content-wf-666" href="#wf-666"></a>
## WF 666 - "DOTS: Copy PDC Case ID to Case ID" (TRIGGER)
### Conditions:
- All:
  - **pdc_case_id** is not empty 
- At least one:
  - **current-role** is _DOTS (H46)_ 
  - **current-role** is _Board of Management (H2)_ 
### Tasks:
- copy PDC Case ID to Case ID
### Tasks with Details:
- copy PDC Case ID to Case ID
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case_id": "pdc_case_id (fieldname)",
      "pdc_sync_date": "get_datetime() (expression)"
    }, 
    ``` 

<a id="user-content-wf-672" href="#wf-672"></a>
## WF 672 - "Set Lock Automation = Yes when Final status change Closed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **final_status** has changed to _CLOSED_ 
- At least one:
### Tasks:
- Set Lock Automation
### Tasks with Details:
- Set Lock Automation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-673" href="#wf-673"></a>
## WF 673 - "Set Lock Automation when Complaint status changed to FIGA - Litigation Stay" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **complaint_status** has changed to _FIGA - Litigation Stay_ 
- At least one:
### Tasks:
- Set Lock Automation = Yes
### Tasks with Details:
- Set Lock Automation = Yes
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-689" href="#wf-689"></a>
## WF 689 - "RECALCULATE_FROM_COLLECTIONS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CF recalculateFromCollections
- call CF recalculateFromCase
### Tasks with Details:
- call CF recalculateFromCollections
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromCollections}, 
    ``` 

- call CF recalculateFromCase
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromCase}, 
    ``` 

<a id="user-content-wf-690" href="#wf-690"></a>
## WF 690 - "Generate Pre-Suit Demand Package" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **case_id** starts with _PDC_ 
  - **pre_litigation_status** is _Presuit - Demand Sent_ 
- At least one:
### Tasks:
- Create Package "Pre-Suit Demand"
- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;
- Update Pre-Suit Demand Sent
### Tasks with Details:
- Create Package "Pre-Suit Demand"
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Pre-Suit Demand, conditionString: , shouldSend: on, stopOnError: on}, 
    ``` 

- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Follow up with Adjuster regarding Pre-Suit Demand @@CASE_ID@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "PDC PRE-SUIT (rawtext)",
        "due_date": "get_workingday(0, add_days(5)) (expression)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- Update Pre-Suit Demand Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "pre_suit_demand_sent": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-701" href="#wf-701"></a>
## WF 701 - "Revert to Previous Status" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- call revertToPreviousStatus
### Tasks with Details:
- call revertToPreviousStatus
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: revertToPreviousStatus}, 
    ``` 

<a id="user-content-wf-705" href="#wf-705"></a>
## WF 705 - "RECALCULATE_FROM_OTHERS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CF recalculateFromOthers
- call CF recalculateFromCase
### Tasks with Details:
- call CF recalculateFromOthers
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromOthers}, 
    ``` 

- call CF recalculateFromCase
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromCase}, 
    ``` 

<a id="user-content-wf-706" href="#wf-706"></a>
## WF 706 - "RECALCULATE_ALL" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call CF recalculateAll
### Tasks with Details:
- call CF recalculateAll
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

<a id="user-content-wf-707" href="#wf-707"></a>
## WF 707 - "Recalculate Demand" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **demand_perc** is not empty 
  - **demand_based_off** is not empty 
- At least one:
### Tasks:
- call recalculateAll
- call recalculateSettlementNegotiations
### Tasks with Details:
- call recalculateAll
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

- call recalculateSettlementNegotiations
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateSettlementNegotiations}, 
    ``` 

<a id="user-content-wf-715" href="#wf-715"></a>
## WF 715 - "Send again 10-day Demand Letter Package" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- Generate package &quot;10-day Demand Letter Package&quot;
- set 10-Day Demand Sent
-  create tasks when a 10-day demand package for &quot;Universal Property &amp;amp; Casualty Insurance Company&quot; is created
### Tasks with Details:
- Generate package &quot;10-day Demand Letter Package&quot;
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: 10-day Demand Letter Package, conditionString: , shouldSend: on, stopOnError: on, shouldDropbox: }, 
    ``` 

- set 10-Day Demand Sent
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "10_day_demand_sent": "get_date('today') (expression)"
    }, 
    ``` 

-  create tasks when a 10-day demand package for &quot;Universal Property &amp;amp; Casualty Insurance Company&quot; is created
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Documents",
      "otherWorkflowId": "Create tasks for Universal Property &amp; Casualty Insurance Company",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-717" href="#wf-717"></a>
## WF 717 - "Complaint Status change to Case Closed-Plaintiff to pay Fees/Costs" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **complaint_status** has changed to _Case Closed-Plaintiff to pay Fees/Costs_ 
- At least one:
### Tasks:
- Set Lock automation
### Tasks with Details:
- Set Lock automation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-721" href="#wf-721"></a>
## WF 721 - "Change of Defendant MTD Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **defendant_mtd_status** has changed 
  - **defendant_mtd_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "defendant_mtd_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Defendant MTD (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-722" href="#wf-722"></a>
## WF 722 - "Order on Ds MTD changed to an option that closes the case" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **order_on_ds_mtd** has changed 
- At least one:
  - **order_on_ds_mtd** has changed to _MTD Granted With Prejudice_ 
  - **order_on_ds_mtd** has changed to _MTD Granted Without Prejudice-No Leave to Amend_ 
### Tasks:
- Close the case, lock automation
### Tasks with Details:
- Close the case, lock automation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "final_status": "CLOSED (rawtext)",
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-723" href="#wf-723"></a>
## WF 723 - "Generate again Notice of Settlement HO document" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- Create &quot;Notice of Settlement HO&quot;
- send documents to Peru Queue for filing
- set Settlement Date
### Tasks with Details:
- Create &quot;Notice of Settlement HO&quot;
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N209, conditionString: , stopOnError: on}, 
    ``` 

- send documents to Peru Queue for filing
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Document Notice of Settlement HO for filing @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "Peru Team (rawtext)",
        "insured": "insured (fieldname)"
      }
    }, 
    ``` 

- set Settlement Date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settlement_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-724" href="#wf-724"></a>
## WF 724 - "Complaint Status change to Withdrew as Counsel" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **complaint_status** has changed to _Withdrew as Counsel_ 
- At least one:
### Tasks:
- Set Final Status CLOSED and set Locked Automation 
### Tasks with Details:
- Set Final Status CLOSED and set Locked Automation 
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "final_status": "CLOSED (rawtext)",
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-732" href="#wf-732"></a>
## WF 732 - "Settlement Status change to Settlement Negotiation - Offer Received" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **settlement_status** has changed to _Settlement Negotiation - Offer Received_ 
- At least one:
### Tasks:
- create Task for Assigned Attorney to &quot;Send counter-offer to client and respond to OC in&quot; 
### Tasks with Details:
- create Task for Assigned Attorney to &quot;Send counter-offer to client and respond to OC in&quot; 
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "case",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "task_name": "'Send counter-offer to client and respond to OC in @@CASE_ID@@ @@INJUREDPARTY_NAME@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "fromField-attorney_user (rawtext)",
        "insured": "insured (expression)"
      }
    }, 
    ``` 

<a id="user-content-wf-733" href="#wf-733"></a>
## WF 733 - "Pre-Litigation change to NOI - Filed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **pre_litigation_status** has changed to _NOI - Filed_ 
- At least one:
### Tasks:
- set NOI Filed
### Tasks with Details:
- set NOI Filed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "noi_filed": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-742" href="#wf-742"></a>
## WF 742 - "Set Lock Automation = YES if Final Status changed to Buyback" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **final_status** has changed to _Buyback_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
-  Set Lock Automation = YES
### Tasks with Details:
-  Set Lock Automation = YES
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-754" href="#wf-754"></a>
## WF 754 - "ON_CHANGE Type of Claim to FIGA - lock automation" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **type_of_claim** has changed to _FIGA_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Set Lock Automation = Yes
### Tasks with Details:
- Set Lock Automation = Yes
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-764" href="#wf-764"></a>
## WF 764 - "Action: Customer Contact Result changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **action_customer_contact_result** is not empty 
  - **action_customer_contact_result** has changed 
- At least one:
### Tasks:
- set date, set last result, set list of results, clear action
- Update Comments: using the &quot;Customer Contacted Date&quot; as the date and the content of &quot;Customer Contact Results&quot; as the comment text.
### Tasks with Details:
- set date, set last result, set list of results, clear action
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "customer_contact_last_date": "get_date('today') (expression)",
      "customer_contact_last_result": "action_customer_contact_result (fieldname)",
      "customer_contact_all_results": "concat(customer_contact_all_results, '\\r\\n', customer_contact_last_date , ': ', action_customer_contact_result)  (expression)",
      "action_customer_contact_result": " (rawtext)"
    }, 
    ``` 

- Update Comments: using the &quot;Customer Contacted Date&quot; as the date and the content of &quot;Customer Contact Results&quot; as the comment text.
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "ModComments",
      "reference_field": "related_to",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "0",
      "set_fields_in_new_entity": {
        "commentcontent": "concat(customer_contact_last_date , ': ',customer_contact_last_result) (expression)",
        "assigned_user_id": "triggerUser (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-833" href="#wf-833"></a>
## WF 833 - "EXTREME CAUTION! Copy PMC Case ID to Case ID" (TRIGGER)
### Conditions:
- All:
  - **pmc_case_id** is not empty 
  - **lock_automation** is not _1_ 
- At least one:
### Tasks:
- update Case ID from PMC Case ID
### Tasks with Details:
- update Case ID from PMC Case ID
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case_id": "pmc_case_id (fieldname)"
    }, 
    ``` 

<a id="user-content-wf-844" href="#wf-844"></a>
## WF 844 - "Set Final Status to CLOSED when Complaint Status changed to ..." (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **complaint_status** has changed to _Voluntary Dismissal w/o Prejudice-Recover in HOS_ 
  - **complaint_status** has changed to _Defendant's Motion for Judgment on the Pleadings Granted with Prejudice_ 
  - **complaint_status** has changed to _Defendant's Motion for Summary Judgment Granted_ 
  - **complaint_status** has changed to _Plaintiff's Motion for Summary Judgment Granted_ 
  - **complaint_status** has changed to _Defendant's Motion for Fees/Costs Filed_ 
  - **complaint_status** has changed to _Plaintiff's Motion for Fees/Costs Filed_ 
  - **complaint_status** has changed to _Appeal Filed_ 
  - **complaint_status** has changed to _Appeal Lost_ 
  - **complaint_status** has changed to _No Longer Attorney-Attorney Lien Filed_ 
  - **complaint_status** has changed to _Defendant's Motion to Dismiss Granted Without Prejudice-No Leave to Amend_ 
  - **complaint_status** has changed to _Plaintiff's Motion for New Trial_ 
  - **complaint_status** has changed to _Trial Lost at Directed Verdict_ 
  - **complaint_status** has changed to _Trial Lost by Jury Verdict_ 
  - **complaint_status** has changed to _Trial won_ 
  - **complaint_status** has changed to _Dismissed at FWOP Hearing_ 
### Tasks:
- Set Final Status to CLOSED
### Tasks with Details:
- Set Final Status to CLOSED
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "final_status": "CLOSED (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-850" href="#wf-850"></a>
## WF 850 - "Send WITHDRAWAL LETTER email when Pre-Litigation Status sets to WITHDRAWAL_LTR to INS_CO" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed to _WITHDRAWAL_LTR to INS_CO_ 
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- Send Withdrawal Email
### Tasks with Details:
- Send Withdrawal Email
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N161, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-851" href="#wf-851"></a>
## WF 851 - "Set Lock Automation = yes (Confession of Judgment Granted, Do not File-anti AOB clause)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **pre_litigation_status** has changed to _Do not File-anti AOB clause_ 
  - **complaint_status** has changed to _Confession of Judgment Granted_ 
### Tasks:
- Set Lock Automation = YES
### Tasks with Details:
- Set Lock Automation = YES
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-852" href="#wf-852"></a>
## WF 852 - "Set Final Status to CLOSED and set Lock Automation  when Pre-litigation Status changed to Do not File-No Longer Attorney" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pre_litigation_status** has changed to _Do not File-No Longer Attorney_ 
- At least one:
### Tasks:
- Set Final Status to CLOSED, set Lock Automation
### Tasks with Details:
- Set Final Status to CLOSED, set Lock Automation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "final_status": "CLOSED (rawtext)",
      "lock_automation": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-853" href="#wf-853"></a>
## WF 853 - "Change of Appraisal Status" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **appraisal_status** has changed 
  - **appraisal_status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
### Tasks with Details:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "previous_stage": "stage (fieldname)",
      "previous_status": "status (fieldname)",
      "status": "appraisal_status (fieldname)",
      "status_age": "0 (rawtext)",
      "status_date": "get_datetime() (expression)",
      "stage": "Appraisal (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-858" href="#wf-858"></a>
## WF 858 - "Fill Cases-Same Claim Number if Simmilar Case changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **similar_cases** has changed 
- At least one:
### Tasks:
- Recalculate All
### Tasks with Details:
- Recalculate All
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateAll}, 
    ``` 

<a id="user-content-wf-859" href="#wf-859"></a>
## WF 859 - "Recalculate Similar Cases" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **total_collections** has changed 
  - **adjusted_face_value** has changed 
  - **total_balance** has changed 
  - **claim_number** has changed 
  - **hurdle** has changed 
### Tasks:
- Call recalculateOthers
### Tasks with Details:
- Call recalculateOthers
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||SimilarCases",
      "otherWorkflowId": "Call recalculateOthers in all similar cases",
      "otherWorkflowField": "similar_cases",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

