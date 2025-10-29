# Module: HOClaimedInvoices
<a id="user-content-wf-635" href="#wf-635"></a>
## WF 635 - "ON_CHANGE invoice parameters" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **invoice_value** has changed 
  - **prior_collections** has changed 
  - **case** has changed 
### Tasks:
- call WF Case.RECALCULATE_FROM_CLAIMS
### Tasks with Details:
- call WF Case.RECALCULATE_FROM_CLAIMS
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_CLAIMS",
      "otherWorkflowField": "case",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

