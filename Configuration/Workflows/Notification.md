# Module: Notification
<a id="user-content-wf-597" href="#wf-597"></a>
## WF 597 - "Mark as Read" (TRIGGER)
### Conditions:
- All:
  - **notification_status** is _PLL_UNREAD_ 
- At least one:
### Tasks:
- Set Status = Read
### Tasks with Details:
- Set Status = Read
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "notification_status": "PLL_READ (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-598" href="#wf-598"></a>
## WF 598 - "Mark as Unread" (TRIGGER)
### Conditions:
- All:
  - **notification_status** is _PLL_READ_ 
- At least one:
### Tasks:
- Set Status = Unread
### Tasks with Details:
- Set Status = Unread
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "notification_status": "PLL_UNREAD (rawtext)"
    }, 
    ``` 

