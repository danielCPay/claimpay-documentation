# Module: BatchErrors
<a id="user-content-wf-459" href="#wf-459"></a>
## WF 459 - "Send a Notification after Batch Error is created" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- Send a Notification after Batch Error is created for Batch Error.Assigned to
### Tasks with Details:
- Send a Notification after Batch Error is created for Batch Error.Assigned to
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Error Messsage: <a href="$(record : CrmDetailViewURL)$">$(record : error_message)$</a><br>
    Date:  $(record : createdtime)$<br>
    Task Type = $(record : task_type)$<br>
    Module = $(record : mod_name)$<br>
    Item = $(record : item)$<br>
    Descrioption = $(record : error_description)$, recipients: fromField-assigned_user_id, title: Some error occured, skipCurrentUser: }, 
    ``` 

