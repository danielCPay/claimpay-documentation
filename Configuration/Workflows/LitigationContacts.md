# Module: LitigationContacts
<a id="user-content-wf-668" href="#wf-668"></a>
## WF 668 - "Create address book" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **email** has changed 
- At least one:
### Tasks:
- Create address book
### Tasks with Details:
- Create address book
    ``` 
    taskType: VTAddressBookTask, active: true 
    otherParameters: {executeImmediately: false, test: }, 
    ``` 

