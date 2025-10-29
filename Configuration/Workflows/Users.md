# Module: Users
<a id="user-content-wf-70" href="#wf-70"></a>
## WF 70 - "LBL_NEW_USER_CREATED" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- ~New user created~
### Tasks with Details:
- ~~New user created~~
    ``` 
    taskType: VTEntityMethodTask, active: false 
    otherParameters: {active: false, methodName: newUser}, 
    ``` 

