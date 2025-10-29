# Module: Calendar
<a id="user-content-wf-14" href="#wf-14"></a>
## WF 14 - "Workflow for Calendar Todos when Send Notification is True" (ON_MODIFY)
### Conditions:
- All:
  - **sendnotification** is _1_ 
- At least one:
### Tasks:
- ~Notification Email to Record Owner~
### Tasks with Details:
- ~~Notification Email to Record Owner~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N12, attachments: , email: $(relatedRecord : assigned_user_id|email1|Users)$, copy_email: }, 
    ``` 

