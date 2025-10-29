# Module: Contacts
<a id="user-content-wf-53" href="#wf-53"></a>
## WF 53 - "Send Customer Login Details" (ON_MODIFY)
### Conditions:
- All:
  - **emailoptout** is _1_ 
  - **portal** has changed 
  - **portal** is _1_ 
- At least one:
### Tasks:
- ~Send Customer Login Details~
### Tasks with Details:
- ~~Send Customer Login Details~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N10, attachments: , email: $(record : email)$, copy_email: }, 
    ``` 

<a id="user-content-wf-55" href="#wf-55"></a>
## WF 55 - "Generate mail address book" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **current-role** is _Litigation Manager (H39)_ 
- At least one:
### Tasks:
- Generate mail address book
### Tasks with Details:
- Generate mail address book
    ``` 
    taskType: VTAddressBookTask, active: true 
    otherParameters: {executeImmediately: false, test: }, 
    ``` 

<a id="user-content-wf-156" href="#wf-156"></a>
## WF 156 - "qdqd" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
### Tasks with Details:
