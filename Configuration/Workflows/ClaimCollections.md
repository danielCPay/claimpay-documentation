# Module: ClaimCollections
<a id="user-content-wf-162" href="#wf-162"></a>
## WF 162 - "ON_CHANGE" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **assigned_value** has changed 
  - **assigned_below_hurdle** has changed 
  - **assigned_refundable_reserve** has changed 
  - **assigned_limit_reserve** has changed 
  - **claim** has changed 
### Tasks:
- WF RECALCULATE_FROM_CLAIM_COLLECTIONS
### Tasks with Details:
- WF RECALCULATE_FROM_CLAIM_COLLECTIONS
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Claims",
      "otherWorkflowId": "RECALCULATE_FROM_CLAIM_COLLECTIONS",
      "otherWorkflowField": "claim",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

<a id="user-content-wf-694" href="#wf-694"></a>
## WF 694 - "ON_CHANGE Claim" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **claim** has changed 
- At least one:
### Tasks:
- Set Portfolio Purchase
### Tasks with Details:
- Set Portfolio Purchase
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase": "$(relatedRecordId : claim|portfolio_purchase|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-744" href="#wf-744"></a>
## WF 744 - "On delete Collection from Claim Collection" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **collection** has changed 
- At least one:
### Tasks:
- call recalculateFromClaimsCollections
### Tasks with Details:
- call recalculateFromClaimsCollections
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Claims",
      "otherWorkflowId": "RECALCULATE_FROM_CLAIM_COLLECTIONS",
      "otherWorkflowField": "claim",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

