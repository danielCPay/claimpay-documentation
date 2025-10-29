# Module: Tasks
<a id="user-content-wf-245" href="#wf-245"></a>
## WF 245 - "Send notfication when task is created (Cases in Trial Stage)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **case** is not empty 
  - **assigned_user_id** has changed 
  - **(case : (Cases) stage)** is _Trial_ 
- At least one:
### Tasks:
- New task for user
### Tasks with Details:
- New task for user
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: New task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> for <a href="$(relatedRecord : case|CrmDetailViewURL)$">$(record : case)$</a> was assigned to you, recipients: fromField-assigned_user_id, title: New task was assigned to you, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-263" href="#wf-263"></a>
## WF 263 - "Send notfication when task is created (not Cases)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **case** is empty 
  - **assigned_user_id** has changed 
- At least one:
### Tasks:
- New task for user
### Tasks with Details:
- New task for user
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: New task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> was assigned to you, recipients: fromField-assigned_user_id, title: New task was assigned to you, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-264" href="#wf-264"></a>
## WF 264 - "For Casese (Trial Stage) Reminder (2 days before Due Date) to Assigned to" (ON_SCHEDULE)
### Conditions:
- All:
  - **tasks_status** is not _Completed_ 
  - **(case : (Cases) stage)** is _Trial_ 
  - **case** is not empty 
- At least one:
### Tasks:
- Send notification to  Task.Assigned to: 'Your task &quot;Task name with link to the task&quot; should be completed till Task.Due Date'
### Tasks with Details:
- Send notification to  Task.Assigned to: 'Your task &quot;Task name with link to the task&quot; should be completed till Task.Due Date'
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Your task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> should be completed till $(record : due_date)$, recipients: fromField-assigned_user_id, title: Complete your task, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-265" href="#wf-265"></a>
## WF 265 - "For Cases (Trial Stage) Reminder (on Due Date) to Created by" (ONCE)
### Conditions:
- All:
  - **tasks_status** is not _Completed_ 
  - **due_date** is today 
  - **(case : (Cases) stage)** is _Trial_ 
  - **case** is not empty 
- At least one:
### Tasks:
- Send notification to Task.Created by: 'A task you created due date for Task,Assigned to is today
### Tasks with Details:
- Send notification to Task.Created by: 'A task you created due date for Task,Assigned to is today
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: A task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> you created due date $(record : due_date)$ for $(record : assigned_user_id)$ is still not completed, recipients: owner, title: Task not completed, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-266" href="#wf-266"></a>
## WF 266 - "Info on task completion to Created by " (ON_MODIFY)
### Conditions:
- All:
  - **tasks_status** is _Completed_ 
  - **tasks_status** has changed 
- At least one:
### Tasks:
- send a notification to Task.Created by: 'A task you created was completed by Task,Assigned to: &quot;Task name with link to the task&quot;'
### Tasks with Details:
- send a notification to Task.Created by: 'A task you created was completed by Task,Assigned to: &quot;Task name with link to the task&quot;'
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: A task you created <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> was completed by $(record : assigned_user_id)$, recipients: owner, title: Task completed, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-695" href="#wf-695"></a>
## WF 695 - "Not for Cases: Reminder (2 days before Due Date) to Assigned to" (ON_SCHEDULE)
### Conditions:
- All:
  - **tasks_status** is not _Completed_ 
  - **case** is empty 
- At least one:
### Tasks:
- Send notification to  Task.Assigned to: 'Your task "Task name with link to the task" should be completed till Task.Due Date'
### Tasks with Details:
- Send notification to  Task.Assigned to: 'Your task "Task name with link to the task" should be completed till Task.Due Date'
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: Your task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> should be completed till $(record : due_date)$, recipients: fromField-assigned_user_id, title: Complete your task, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-696" href="#wf-696"></a>
## WF 696 - "Not for Cases:  Reminder (on Due Date) to Created by" (ONCE)
### Conditions:
- All:
  - **tasks_status** is not _Completed_ 
  - **due_date** is today 
  - **case** is empty 
- At least one:
### Tasks:
- Send notification to Task.Created by: 'A task you created due date for Task,Assigned to is today
### Tasks with Details:
- Send notification to Task.Created by: 'A task you created due date for Task,Assigned to is today
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: A task <a href="$(record : CrmDetailViewURL)$">$(record : task_name)$</a> you created due date $(record : due_date)$ for $(record : assigned_user_id)$ is still not completed, recipients: owner, title: Task not completed, skipCurrentUser: }, 
    ``` 

