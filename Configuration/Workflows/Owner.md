# Module: Owner
<a id="user-content-wf-846" href="#wf-846"></a>
## WF 846 - "Set Owner Name" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **owner_name** is _(New)_ 
- At least one:
### Tasks:
- Set Owner Name = PMC Owner Name
### Tasks with Details:
- Set Owner Name = PMC Owner Name
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "owner_name": "concat('$(relatedRecord : pmc_owner_name|first_name|Users)$ ','$(relatedRecord : pmc_owner_name|last_name|Users)$') (expression)"
    }, 
    ``` 

<a id="user-content-wf-847" href="#wf-847"></a>
## WF 847 - "On change PMC Owner Name Set Owner Name" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **pmc_owner_name** has changed 
  - **owner_name** does not contain _(New)_ 
- At least one:
### Tasks:
- Set Owner Name = PMC Owner Name
### Tasks with Details:
- Set Owner Name = PMC Owner Name
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "owner_name": "concat('$(relatedRecord : pmc_owner_name|first_name|Users)$ ','$(relatedRecord : pmc_owner_name|last_name|Users)$') (expression)"
    }, 
    ``` 

