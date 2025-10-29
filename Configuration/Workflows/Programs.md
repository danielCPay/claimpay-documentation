# Module: Programs
<a id="user-content-wf-702" href="#wf-702"></a>
## WF 702 - "Verify Algorithm Parameters" (TRIGGER)
### Conditions:
- All:
  - **program_algorithm** is not empty 
- At least one:
### Tasks:
- call CF verifyAlgorithmParameters
### Tasks with Details:
- call CF verifyAlgorithmParameters
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: verifyAlgorithmParameters}, 
    ``` 

<a id="user-content-wf-703" href="#wf-703"></a>
## WF 703 - "ON_CHANGE - verify algorithm parameters" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **program_algorithm** has changed 
  - **algorithm_parameters** has changed 
  - **factor_fee_perc** has changed 
### Tasks:
- call CF verifyAlgorithmParameters
### Tasks with Details:
- call CF verifyAlgorithmParameters
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: verifyAlgorithmParameters}, 
    ``` 

<a id="user-content-wf-713" href="#wf-713"></a>
## WF 713 - "DEBUG: process Temporal Data" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _DOTS (H46)_ 
- At least one:
### Tasks:
- Call cron
### Tasks with Details:
- Call cron
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: debugTemporalDataCron}, 
    ``` 

