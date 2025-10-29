# Module: Payments
<a id="user-content-wf-136" href="#wf-136"></a>
## WF 136 - "on change Buyback Value" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **buyback_value** has changed 
- At least one:
### Tasks:
- Call WF Provider.REFRESH_BUYBACK_WALLET_VALUE
### Tasks with Details:
- Call WF Provider.REFRESH_BUYBACK_WALLET_VALUE
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Providers",
      "otherWorkflowId": "REFRESH_BUYBACK_WALLET_VALUE",
      "otherWorkflowField": "provider",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

