# Module: ProviderReferences
<a id="user-content-wf-376" href="#wf-376"></a>
## WF 376 - "ON_CHANGE" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **provider_reference_name** has changed 
### Tasks:
- WF Provider.CHECK_ELIGIBILITY
### Tasks with Details:
- WF Provider.CHECK_ELIGIBILITY
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Providers",
      "otherWorkflowId": "CHECK_ELIGIBILITY",
      "otherWorkflowField": "provider"
    }, 
    ``` 

