# Module: PartialSettlements
<a id="user-content-wf-683" href="#wf-683"></a>
## WF 683 - "ON_CHANGE: Calculate Total Settlement, recalculate Case" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **settlement_amount** has changed 
  - **attorneys_fees_and_costs** has changed 
  - **case** has changed 
### Tasks:
- Calculate Total Settlement
- call WF Cases.RECALCULATE_FROM_OTHERS
### Tasks with Details:
- Calculate Total Settlement
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "total_settlement": "settlement_amount +  attorneys_fees_and_costs (expression)"
    }, 
    ``` 

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

