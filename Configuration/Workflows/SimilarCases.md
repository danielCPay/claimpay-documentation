# Module: SimilarCases
<a id="user-content-wf-860" href="#wf-860"></a>
## WF 860 - "Call recalculateOthers in all similar cases" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Call recalculateOthers in child Cases
### Tasks with Details:
- Call recalculateOthers in child Cases
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "CHILD||Cases",
      "otherWorkflowId": "RECALCULATE_FROM_OTHERS",
      "otherWorkflowField": "similar_cases",
      "otherWorkflowFieldValueVersion": "New"
    }, 
    ``` 

