# Module: LeadsDOT
<a id="user-content-wf-752" href="#wf-752"></a>
## WF 752 - "Send Wizard navigation link" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **wizard_navigation_link** has changed 
  - **wizard_navigation_link** is not empty 
  - **email** is not empty 
- At least one:
### Tasks:
- Send Wizard navigation link
### Tasks with Details:
- Send Wizard navigation link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N147, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-756" href="#wf-756"></a>
## WF 756 - "Generate agreement" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Generate Portal Agreement
### Tasks with Details:
- Generate Portal Agreement
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N234, conditionString: , stopOnError: }, 
    ``` 

<a id="user-content-wf-825" href="#wf-825"></a>
## WF 825 - "Send Wizard navigation link" (TRIGGER)
### Conditions:
- All:
  - **email** is not empty 
  - **leads_status** is _New_ 
  - **wizard_navigation_link** is not empty 
- At least one:
### Tasks:
- Send Wizard navigation link
### Tasks with Details:
- Send Wizard navigation link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N147, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-849" href="#wf-849"></a>
## WF 849 - "Calculate Other Owner and Total allocation" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **owner_alloc_1** has changed 
  - **owner_alloc_2** has changed 
  - **owner_alloc_3** has changed 
  - **owner_alloc_4** has changed 
  - **owner_alloc_5** has changed 
### Tasks:
- calculate Other Owner, Total allocation
### Tasks with Details:
- calculate Other Owner, Total allocation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "other_owner": "owner_alloc_3+ owner_alloc_4+ owner_alloc_5 (expression)",
      "total_alloc": "owner_alloc_1+ owner_alloc_2+ owner_alloc_3+  owner_alloc_4+ owner_alloc_5 (expression)"
    }, 
    ``` 

