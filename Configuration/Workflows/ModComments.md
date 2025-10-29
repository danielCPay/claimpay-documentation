# Module: ModComments
<a id="user-content-wf-57" href="#wf-57"></a>
## WF 57 - "New comment added to ticket - Owner" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **customer** is not empty 
- At least one:
### Tasks:
- ~Notify Owner On new comment added to ticket from portal~
### Tasks with Details:
- ~~Notify Owner On new comment added to ticket from portal~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: helpDeskNewCommentOwner}, 
    ``` 

<a id="user-content-wf-58" href="#wf-58"></a>
## WF 58 - "New comment added to ticket - account" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **customer** is empty 
- At least one:
### Tasks:
- ~Notify Account On New comment added to ticket~
### Tasks with Details:
- ~~Notify Account On New comment added to ticket~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: helpDeskNewCommentAccount}, 
    ``` 

<a id="user-content-wf-59" href="#wf-59"></a>
## WF 59 - "New comment added to ticket - contact" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **customer** is empty 
- At least one:
### Tasks:
- ~Notify Contact On New comment added to ticket~
### Tasks with Details:
- ~~Notify Contact On New comment added to ticket~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: helpDeskNewCommentContacts}, 
    ``` 

