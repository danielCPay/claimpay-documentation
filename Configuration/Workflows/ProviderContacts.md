# Module: ProviderContacts
<a id="user-content-wf-375" href="#wf-375"></a>
## WF 375 - "ON_CHANGE" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **provider_contact_type** has changed 
  - **dob** has changed 
  - **social_security_number** has changed 
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

