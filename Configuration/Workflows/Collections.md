# Module: Collections
<a id="user-content-wf-268" href="#wf-268"></a>
## WF 268 - "ON_CHANGE if Collection Type = Attorney Fees, set Value=0" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **collection_type** is _Attorney Fees_ 
  - **value** does not equal _0_ 
- At least one:
  - **collection_type** has changed 
  - **value** has changed 
### Tasks:
- Value must be 0 if Collection Type = Attorney Fees
- set Value=0
### Tasks with Details:
- Value must be 0 if Collection Type = Attorney Fees
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Collection: <a href="$(record : CrmDetailViewURL)$">$(record : collection_name)$</a>
    Value = $(record : value)$
    Value was reset to 0, recipients: owner, title: Value must be 0 if Collection Type = Attorney Fees, skipCurrentUser: }, 
    ``` 

- set Value=0
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "value": "0 (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-398" href="#wf-398"></a>
## WF 398 - "Re-apply Collection to Claims" (TRIGGER)
### Conditions:
- All:
  - **collection_type** is not _Attorney Fees_ 
- At least one:
  - **case** is not empty 
  - **outside_case** is not empty 
### Tasks:
- CF applyCollectionToClaims
### Tasks with Details:
- CF applyCollectionToClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: applyCollectionToClaims}, 
    ``` 

<a id="user-content-wf-399" href="#wf-399"></a>
## WF 399 - "dummy low workflow_id placeholder" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
### Tasks with Details:
<a id="user-content-wf-461" href="#wf-461"></a>
## WF 461 - "Calculate Value+Attorney Fees" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **value** has changed 
  - **attorney_fees** has changed 
### Tasks:
- calculate Value+Attorney Fees
### Tasks with Details:
- calculate Value+Attorney Fees
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "value_plus_attorney_fees": "value+ attorney_fees (expression)"
    }, 
    ``` 

<a id="user-content-wf-583" href="#wf-583"></a>
## WF 583 - "dummy low workflow_id placeholder" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
### Tasks with Details:
<a id="user-content-wf-584" href="#wf-584"></a>
## WF 584 - "ON_CHANGE Case: APPLY_COLLECTION_TO_CLAIMS" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **case** has changed 
  - **case** is not empty 
- At least one:
### Tasks:
- Clear Outside Case
- Call Case.RECALCULATE_FROM_COLLECTIONS (Both old and new)
- ~CF applyCollectionToClaims~
### Tasks with Details:
- Clear Outside Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case": " (rawtext)"
    }, 
    ``` 

- Call Case.RECALCULATE_FROM_COLLECTIONS (Both old and new)
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_COLLECTIONS",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

- ~~CF applyCollectionToClaims~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: applyCollectionToClaims}, 
    ``` 

<a id="user-content-wf-585" href="#wf-585"></a>
## WF 585 - "ON_CHANGE Outside Case: APPLY_COLLECTION_TO_CLAIMS" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **outside_case** has changed 
  - **outside_case** is not empty 
- At least one:
### Tasks:
- Clear Case
- ~call CF applyCollectionToClaims~
- Call Outcide Case.RECALCULATE_FROM_COLLECTIONS (Both old and new)
### Tasks with Details:
- Clear Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case": " (rawtext)"
    }, 
    ``` 

- ~~call CF applyCollectionToClaims~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: applyCollectionToClaims}, 
    ``` 

- Call Outcide Case.RECALCULATE_FROM_COLLECTIONS (Both old and new)
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||OutsideCases",
      "otherWorkflowId": "RECALCULATE_FROM_COLLECTIONS",
      "otherWorkflowField": "outside_case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

<a id="user-content-wf-586" href="#wf-586"></a>
## WF 586 - "DISBURSE_COLLECTION" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **disbursed_date** has changed 
  - **disbursed_date** is not empty 
  - **date_of_disbursal_calculation** is empty 
- At least one:
### Tasks:
- CF disburseCollection
- set Date of Disbursal Calculation = current time
### Tasks with Details:
- CF disburseCollection
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: disburseCollection}, 
    ``` 

- set Date of Disbursal Calculation = current time
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "date_of_disbursal_calculation": "get_datetime() (expression)"
    }, 
    ``` 

<a id="user-content-wf-688" href="#wf-688"></a>
## WF 688 - "ON_CHANGE Value, Attorney Fees: RECALCULATE_FROM_COLLECTIONS" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **value** has changed 
  - **attorney_fees** has changed 
### Tasks:
- Call Case.RECALCULATE_FROM_COLLECTIONS (New value)
### Tasks with Details:
- Call Case.RECALCULATE_FROM_COLLECTIONS (New value)
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_COLLECTIONS",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

<a id="user-content-wf-691" href="#wf-691"></a>
## WF 691 - "ON_CHANGE  Don’t apply to Claims" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **dont_apply_to_claims** has changed to _1_ 
- At least one:
### Tasks:
- set Provider = empty
### Tasks with Details:
- set Provider = empty
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-692" href="#wf-692"></a>
## WF 692 - "ON_CHANGE Value, Don’t apply to Claims, Provider, Case, Outside Case: APPLY_COLLECTION_TO_CLAIMS" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **value** has changed 
  - **dont_apply_to_claims** has changed 
  - **provider** has changed 
  - **case** has changed 
  - **outside_case** has changed 
### Tasks:
- CF applyCollectionToClaims
### Tasks with Details:
- CF applyCollectionToClaims
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: applyCollectionToClaims}, 
    ``` 

<a id="user-content-wf-704" href="#wf-704"></a>
## WF 704 - "Unsorted collections - do not apply to claims" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **sorting_status** is _Unsorted_ 
  - **dont_apply_to_claims** is _0_ 
- At least one:
### Tasks:
- Set &quot;Don't apply to claims&quot; = Yes
### Tasks with Details:
- Set &quot;Don't apply to claims&quot; = Yes
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "dont_apply_to_claims": "true:boolean (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-716" href="#wf-716"></a>
## WF 716 - "ON _CHANGE Case or Outside Case - keep data consistent" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **case** has changed 
  - **outside_case** has changed 
### Tasks:
- call WF Case.RECALCULATE_FROM_COLLECTIONS
- call WF Outside Case.Recalculate
### Tasks with Details:
- call WF Case.RECALCULATE_FROM_COLLECTIONS
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_COLLECTIONS",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

- call WF Outside Case.Recalculate
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||OutsideCases",
      "otherWorkflowId": "Recalculate",
      "otherWorkflowField": "outside_case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

<a id="user-content-wf-836" href="#wf-836"></a>
## WF 836 - "Export Collection to QuickBooks" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **status_col** has changed to _Released_ 
- At least one:
### Tasks:
- Export Collection to QuickBooks
### Tasks with Details:
- Export Collection to QuickBooks
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportCollectionToQuickBooks}, 
    ``` 

<a id="user-content-wf-837" href="#wf-837"></a>
## WF 837 - "Export Collection to QuickBooks" (TRIGGER)
### Conditions:
- All:
  - **status_col** is _Released_ 
- At least one:
### Tasks:
- Export Collection to QuickBooks
### Tasks with Details:
- Export Collection to QuickBooks
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: exportCollectionToQuickBooks}, 
    ``` 

