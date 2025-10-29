# Module: SSingleOrders
<a id="user-content-wf-67" href="#wf-67"></a>
## WF 67 - "Block edition" (BLOCK_EDIT)
### Conditions:
- All:
- At least one:
  - **ssingleorders_status** is _PLL_CLOSED_ 
  - **ssingleorders_status** is _PLL_CANCELLED_ 
### Tasks:
### Tasks with Details:
<a id="user-content-wf-71" href="#wf-71"></a>
## WF 71 - "It sums up all open sales orders" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- It sums up all open sales orders
### Tasks with Details:
- It sums up all open sales orders
    ``` 
    taskType: SumFieldFromDependent, active: true 
    otherParameters: {targetField: accountid::Accounts::sum_open_orders, sourceField: sum_gross, conditions: {condition: OR, rules: [{fieldname: ssingleorders_status:SSingleOrders, operator: e, value: PLL_NEW##PLL_PAYMENT_REVIEW##PLL_PROCESSING}, {fieldname: ssingleorders_status:SSingleOrders, operator: y, value: }]}}, 
    ``` 

<a id="user-content-wf-72" href="#wf-72"></a>
## WF 72 - "It sums up all open sales orders" (ON_DELETE)
### Conditions:
- All:
- At least one:
### Tasks:
- It sums up all open sales orders
### Tasks with Details:
- It sums up all open sales orders
    ``` 
    taskType: SumFieldFromDependent, active: true 
    otherParameters: {targetField: accountid::Accounts::sum_open_orders, sourceField: sum_gross, conditions: {condition: OR, rules: [{fieldname: ssingleorders_status:SSingleOrders, operator: e, value: PLL_NEW##PLL_PAYMENT_REVIEW##PLL_PROCESSING}, {fieldname: ssingleorders_status:SSingleOrders, operator: y, value: }]}}, 
    ``` 

<a id="user-content-wf-73" href="#wf-73"></a>
## WF 73 - "Create IGDN" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **ssingleorders_status** is _PLL_COMPLETE_ 
### Tasks:
- ~Create IGDN~
### Tasks with Details:
- ~~Create IGDN~~
    ``` 
    taskType: VTCreateEntityTask, active: false 
    taskTypeParameters: {
      "active": false,
      "entity_type": "IGDN",
      "reference_field": "ssingleordersid",
      "mappingPanel": "1",
      "set_fields_in_new_entity": {
        "igdn_status": "PLL_ACCEPTED (rawtext)"
      }
    }, 
    ``` 

<a id="user-content-wf-77" href="#wf-77"></a>
## WF 77 - "Cancel IGDN" (ON_MODIFY)
### Conditions:
- All:
- At least one:
  - **ssingleorders_status** has changed to _PLL_NEW_ 
  - **ssingleorders_status** has changed to _PLL_PAYMENT_REVIEW_ 
  - **ssingleorders_status** has changed to _PLL_ON_HOLD_ 
  - **ssingleorders_status** has changed to _PLL_PROCESSING_ 
  - **ssingleorders_status** has changed to _PLL_CLOSED_ 
  - **ssingleorders_status** has changed to _PLL_CANCELLED_ 
### Tasks:
- ~Cancel IGDN~
### Tasks with Details:
- ~~Cancel IGDN~~
    ``` 
    taskType: VTUpdateRelatedFieldTask, active: false 
    taskTypeParameters: {
      "IGDN::igdn_status": "PLL_CANCELLED (rawtext)"
    }, 
    otherParameters: {executeImmediately: false, active: false}, 
    ``` 

