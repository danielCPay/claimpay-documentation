# Module: LitigationCosts
<a id="user-content-wf-646" href="#wf-646"></a>
## WF 646 - "Changed: Litigation Cost Amount or Case" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **case** has changed 
  - **litigation_cost_amount** has changed 
### Tasks:
- call WF Cases.RECALCULATE_FROM_OTHERS
### Tasks with Details:
- call WF Cases.RECALCULATE_FROM_OTHERS
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_OTHERS",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

