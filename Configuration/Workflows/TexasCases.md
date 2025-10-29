# Module: TexasCases
<a id="user-content-wf-767" href="#wf-767"></a>
## WF 767 - "On change of AOB/DTP Attorney" (ON_EVERY_SAVE)
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

<a id="user-content-wf-768" href="#wf-768"></a>
## WF 768 - "On create - default Case ID" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **case_id** is empty 
  - **case_id** is _(New)_ 
### Tasks:
- set default Case ID
### Tasks with Details:
- set default Case ID
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: setNewCaseId}, 
    ``` 

<a id="user-content-wf-769" href="#wf-769"></a>
## WF 769 - "On change of Stage" (ON_EVERY_SAVE)
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

<a id="user-content-wf-770" href="#wf-770"></a>
## WF 770 - "RECALCULATE_FROM_CLAIMS" (MANUAL)
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

<a id="user-content-wf-771" href="#wf-771"></a>
## WF 771 - "Change of Pre-Litigation Status status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-772" href="#wf-772"></a>
## WF 772 - "Change of Complaint Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-773" href="#wf-773"></a>
## WF 773 - "Change of Plaintiff Discovery Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-774" href="#wf-774"></a>
## WF 774 - "Change of Plaintiff Deposition Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-775" href="#wf-775"></a>
## WF 775 - "Change of Defendant Discovery Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-776" href="#wf-776"></a>
## WF 776 - "Change of Defendant Deposition Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-777" href="#wf-777"></a>
## WF 777 - "Change of Mediation Arbitration Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-778" href="#wf-778"></a>
## WF 778 - "Change of Plaintiff MSJ Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-779" href="#wf-779"></a>
## WF 779 - "Change of Defendant MSJ Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-780" href="#wf-780"></a>
## WF 780 - "Change of Trial Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-781" href="#wf-781"></a>
## WF 781 - "Change of Settlement Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-782" href="#wf-782"></a>
## WF 782 - "Change of Appeal Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-783" href="#wf-783"></a>
## WF 783 - "ON_SCHEDULE_UPDATE_STATUS_AGE" (ON_SCHEDULE)
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

<a id="user-content-wf-784" href="#wf-784"></a>
## WF 784 - "ON_CHANGE_STATUS_DATE" (ON_EVERY_SAVE)
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

<a id="user-content-wf-785" href="#wf-785"></a>
## WF 785 - "on change of Provider" (ON_EVERY_SAVE)
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

<a id="user-content-wf-786" href="#wf-786"></a>
## WF 786 - "Find County" (TRIGGER)
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

<a id="user-content-wf-787" href="#wf-787"></a>
## WF 787 - "Recalculate" (TRIGGER)
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

<a id="user-content-wf-788" href="#wf-788"></a>
## WF 788 - "Change of PFS CRN 57.105 Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-789" href="#wf-789"></a>
## WF 789 - "Assign to change" (ON_EVERY_SAVE)
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

<a id="user-content-wf-790" href="#wf-790"></a>
## WF 790 - "Add to Popup Message changed" (ON_EVERY_SAVE)
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

<a id="user-content-wf-791" href="#wf-791"></a>
## WF 791 - "Remove white chars on Policy Number and Claim Number" (ON_EVERY_SAVE)
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

<a id="user-content-wf-792" href="#wf-792"></a>
## WF 792 - "Assign a Case Manager to Shared with" (TRIGGER)
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

<a id="user-content-wf-793" href="#wf-793"></a>
## WF 793 - "ON_CHANGE Settl. Negot. Demand" (ON_EVERY_SAVE)
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
      "internal_temp_note": "'$(record : settl_negot_demand_last_date)$: $(record : settl_negot_demand)$ by $(record : settl_negot_demand_attorney)$' (expression)",
      "settl_negot_demand_notes": "concat( settl_negot_demand_notes, '\\n', internal_temp_note ) (expression)"
    }, 
    ``` 

<a id="user-content-wf-794" href="#wf-794"></a>
## WF 794 - "ON_CHANGE Settl. Negot. Offer" (ON_EVERY_SAVE)
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
      "settl_negot_offer_notes": "concat( settl_negot_offer_notes, '\\n', internal_temp_note ) (expression)"
    }, 
    ``` 

<a id="user-content-wf-795" href="#wf-795"></a>
## WF 795 - "On change of County set Court" (ON_EVERY_SAVE)
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

<a id="user-content-wf-796" href="#wf-796"></a>
## WF 796 - "Clear Court when Total balance or County empty" (ON_EVERY_SAVE)
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

<a id="user-content-wf-797" href="#wf-797"></a>
## WF 797 - "Find Similar Cases" (TRIGGER)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- CF findSimilarTexasCases
### Tasks with Details:
- CF findSimilarTexasCases
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: findSimilarTexasCases}, 
    ``` 

<a id="user-content-wf-798" href="#wf-798"></a>
## WF 798 - "On create - common tasks" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
### Tasks:
- CF findSimilarTexasCases
### Tasks with Details:
- CF findSimilarTexasCases
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: findSimilarTexasCases}, 
    ``` 

<a id="user-content-wf-799" href="#wf-799"></a>
## WF 799 - "ON_CHANGE of Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-800" href="#wf-800"></a>
## WF 800 - "Set Court " (TRIGGER)
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

<a id="user-content-wf-801" href="#wf-801"></a>
## WF 801 - "Copy AOB/DTP Attorney to Demand Attorney" (ONCE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
  - **stage** has changed to _Settlement_ 
- At least one:
### Tasks:
- Set AOB/DTP Attorney to Demand Attorney
### Tasks with Details:
- Set AOB/DTP Attorney to Demand Attorney
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "settl_negot_demand_attorney": "attorney (fieldname)"
    }, 
    ``` 

<a id="user-content-wf-802" href="#wf-802"></a>
## WF 802 - "ON_CHANGE Case financial parameters" (ON_EVERY_SAVE)
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

<a id="user-content-wf-803" href="#wf-803"></a>
## WF 803 - "Case Collections Summary data changed" (ON_EVERY_SAVE)
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

<a id="user-content-wf-804" href="#wf-804"></a>
## WF 804 - "Revert to Previous Status" (TRIGGER)
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

<a id="user-content-wf-805" href="#wf-805"></a>
## WF 805 - "RECALCULATE_FROM_OTHERS" (MANUAL)
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

<a id="user-content-wf-806" href="#wf-806"></a>
## WF 806 - "RECALCULATE_ALL" (MANUAL)
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

<a id="user-content-wf-807" href="#wf-807"></a>
## WF 807 - "Recalculate Demand" (TRIGGER)
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

<a id="user-content-wf-808" href="#wf-808"></a>
## WF 808 - "Change of Defendant MTD Status" (ON_EVERY_SAVE)
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

<a id="user-content-wf-855" href="#wf-855"></a>
## WF 855 - "Change of Appraisal Status" (ON_EVERY_SAVE)
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

