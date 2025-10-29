# Module: OutsideCases
<a id="user-content-wf-576" href="#wf-576"></a>
## WF 576 - "On create - default Outside Case ID" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **outside_case_id** is empty 
  - **outside_case_id** is _(New)_ 
### Tasks:
- set default Outside Case ID
### Tasks with Details:
- set default Outside Case ID
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case_id": "number (fieldname)"
    }, 
    ``` 

<a id="user-content-wf-577" href="#wf-577"></a>
## WF 577 - "RECALCULATE_FROM_CLAIMS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Call RECALCULATE_FROM_CLAIMS
### Tasks with Details:
- Call RECALCULATE_FROM_CLAIMS
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFromClaims}, 
    ``` 

<a id="user-content-wf-578" href="#wf-578"></a>
## WF 578 - "ON_CHANGE_CALCULATE_TOTAL_BALANCE" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **lock_automation** is _0_ 
- At least one:
  - **total_bill_amount** has changed 
  - **total_collections** has changed 
### Tasks:
- Total balance = Total Bill Amount - Total Collections
### Tasks with Details:
- Total balance = Total Bill Amount - Total Collections
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "total_balance": "total_bill_amount- total_collections (expression)"
    }, 
    ``` 

<a id="user-content-wf-581" href="#wf-581"></a>
## WF 581 - "On change of Litigation Status" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **litigation_status** has changed 
  - **litigation_status_other** has changed 
### Tasks:
- For each Claim: set Claim.Basic Litigation Status := Outside Case.Litigation Status + Litigation Status (other)
### Tasks with Details:
- For each Claim: set Claim.Basic Litigation Status := Outside Case.Litigation Status + Litigation Status (other)
    ``` 
    taskType: VTUpdateRelatedFieldTask, active: true 
    taskTypeParameters: {
      "Claims::basic_litigation_status": "concat(litigation_status,' ',litigation_status_other) (expression)"
    }, 
    ``` 

<a id="user-content-wf-684" href="#wf-684"></a>
## WF 684 - "Recalculate" (TRIGGER)
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

<a id="user-content-wf-747" href="#wf-747"></a>
## WF 747 - "RECALCULATE_FROM_COLLECTIONS" (MANUAL)
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

<a id="user-content-wf-826" href="#wf-826"></a>
## WF 826 - "ON_SCHEDULE_UPDATE_AGE" (ON_SCHEDULE)
### Conditions:
- All:
- At least one:
### Tasks:
- Set Aga
### Tasks with Details:
- Set Aga
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateDateOfService}, 
    ``` 

<a id="user-content-wf-838" href="#wf-838"></a>
## WF 838 - "Set Date of service" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- set Date of service
### Tasks with Details:
- set Date of service
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: setDateOfService}, 
    ``` 

