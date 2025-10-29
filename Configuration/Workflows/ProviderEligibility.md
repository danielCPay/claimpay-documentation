# Module: ProviderEligibility
<a id="user-content-wf-89" href="#wf-89"></a>
## WF 89 - "ON_CHANGE" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **is_criteria_met** has changed 
  - **comments** has changed 
### Tasks:
- WF Providers.CHECK_ELIGIBILITY
### Tasks with Details:
- WF Providers.CHECK_ELIGIBILITY
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Providers",
      "otherWorkflowId": "CHECK_ELIGIBILITY",
      "otherWorkflowField": "provider"
    }, 
    ``` 

