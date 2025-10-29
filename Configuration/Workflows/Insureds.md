# Module: Insureds
<a id="user-content-wf-387" href="#wf-387"></a>
## WF 387 - "Find County" (TRIGGER)
### Conditions:
- All:
- At least one:
### Tasks:
- CF findCounty
### Tasks with Details:
- CF findCounty
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: findCounty}, 
    ``` 

<a id="user-content-wf-662" href="#wf-662"></a>
## WF 662 - "On change Street, City, ZIP, State" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **zip** has changed 
  - **street** has changed 
  - **city** has changed 
  - **state** has changed 
### Tasks:
- set Address
### Tasks with Details:
- set Address
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "address": "concat( street, ', ',  city, ', ', substr(state, 0,2), ' ', zip)  (expression)"
    }, 
    ``` 

<a id="user-content-wf-663" href="#wf-663"></a>
## WF 663 - "Set Address" (TRIGGER)
### Conditions:
- All:
  - **street** is not empty 
  - **zip** is not empty 
  - **city** is not empty 
  - **state** is not empty 
  - **current-role** is _DOTS (H46)_ 
- At least one:
### Tasks:
- set Address
### Tasks with Details:
- set Address
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "address": "concat( street, ', ',  city, ', ', substr(state, 0,2), ' ', zip)  (expression)"
    }, 
    ``` 

