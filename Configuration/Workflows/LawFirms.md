# Module: LawFirms
<a id="user-content-wf-759" href="#wf-759"></a>
## WF 759 - "Send Activation Link" (TRIGGER)
### Conditions:
- All:
  - **email** is not empty 
  - **portal_is_active** is _0_ 
- At least one:
### Tasks:
- Create Activation Link
- Send Portal Activation Link
### Tasks with Details:
- Create Activation Link
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createActivationLink}, 
    ``` 

- Send Portal Activation Link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N157, email: [], relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-761" href="#wf-761"></a>
## WF 761 - "Rest Password Trigger" (TRIGGER)
### Conditions:
- All:
  - **email** is not empty 
  - **portal_is_active** is _1_ 
- At least one:
### Tasks:
- Create Reset Password Link
### Tasks with Details:
- Create Reset Password Link
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createResetPasswordLink}, 
    ``` 

<a id="user-content-wf-762" href="#wf-762"></a>
## WF 762 - "Rest Password Send Email" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portal_reset_password_link** is not empty 
  - **portal_is_active** is _1_ 
- At least one:
### Tasks:
- Send reset password link
- Empty reset password link
### Tasks with Details:
- Send reset password link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N151, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- Empty reset password link
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portal_reset_password_link": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-823" href="#wf-823"></a>
## WF 823 - "Generate onetime password (Law Firm)" (TRIGGER)
### Conditions:
- All:
  - **portal_is_active** is _1_ 
- At least one:
### Tasks:
- Create one time password
### Tasks with Details:
- Create one time password
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createOnetimePassword}, 
    ``` 

<a id="user-content-wf-827" href="#wf-827"></a>
## WF 827 - "Send Portal login information email" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portal_is_active** has changed to _1_ 
- At least one:
### Tasks:
- Send Portal login information email
### Tasks with Details:
- Send Portal login information email
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N158, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-861" href="#wf-861"></a>
## WF 861 - "Deactivate Portal" (TRIGGER)
### Conditions:
- All:
  - **portal_is_active** is _1_ 
  - **portal_activation_link** is not empty 
- At least one:
### Tasks:
- Deactivate Portal is active
### Tasks with Details:
- Deactivate Portal is active
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portal_is_active": "false:boolean (rawtext)"
    }, 
    ``` 

