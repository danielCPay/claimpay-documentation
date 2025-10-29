# Module: HelpDesk
<a id="user-content-wf-26" href="#wf-26"></a>
## WF 26 - "Ticket change: Send Email to Record Contact" (ON_MODIFY)
### Conditions:
- All:
  - **ticketstatus** has changed 
  - **ticketstatus** is not _Closed_ 
- At least one:
### Tasks:
- ~Notify Contact On Ticket Change~
### Tasks with Details:
- ~~Notify Contact On Ticket Change~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: helpDeskChangeNotifyContacts}, 
    ``` 

<a id="user-content-wf-29" href="#wf-29"></a>
## WF 29 - "Ticket Closed: Send Email to Record Contact" (ON_MODIFY)
### Conditions:
- All:
- At least one:
### Tasks:
- ~Notify contacts about closing of ticket.~
### Tasks with Details:
- ~~Notify contacts about closing of ticket.~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: helpDeskClosedNotifyContacts}, 
    ``` 

<a id="user-content-wf-31" href="#wf-31"></a>
## WF 31 - "Ticket Creation: Send Email to Record Owner" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- ~Notify Owner On Ticket Create~
### Tasks with Details:
- ~~Notify Owner On Ticket Create~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N9, attachments: , email: $(relatedRecord : assigned_user_id|email1|Users)$, copy_email: }, 
    ``` 

