# Module: ClaimedInvoices
<a id="user-content-wf-396" href="#wf-396"></a>
## WF 396 - "ON_CHANGE" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **invoice_value** has changed 
  - **prior_collections** has changed 
  - **overhead_and_profit** has changed 
  - **adjustment** has changed 
  - **claim** has changed 
  - **special_purchase_price** has changed 
  - **portfolio_purchase** has changed 
### Tasks:
- CF recalculateFinancialSummary
- Call WF Claims.Recalculate Financial Summary
- Call WF Claims.Verify ONB Data
### Tasks with Details:
- CF recalculateFinancialSummary
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFinancialSummary}, 
    ``` 

- Call WF Claims.Recalculate Financial Summary
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Claims",
      "otherWorkflowId": "Recalculate Financial Summary",
      "otherWorkflowField": "claim",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

- Call WF Claims.Verify ONB Data
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||Claims",
      "otherWorkflowId": "Verify ONB Data",
      "otherWorkflowField": "claim",
      "otherWorkflowFieldValueVersion": "Both"
    }, 
    ``` 

<a id="user-content-wf-443" href="#wf-443"></a>
## WF 443 - "SET_PORTFOLIO_PURCHASE_FROM_CLAIM" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Set portfolio_purchase = claim.portfolio_purchase
- CF recalculateFinancialSummary
### Tasks with Details:
- Set portfolio_purchase = claim.portfolio_purchase
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase": "get_id('PortfolioPurchases', 'portfolio_purchase_name', '$(relatedRecord : claim|portfolio_purchase|Claims)$') (expression)"
    }, 
    ``` 

- CF recalculateFinancialSummary
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFinancialSummary}, 
    ``` 

<a id="user-content-wf-444" href="#wf-444"></a>
## WF 444 - "Recalculate Financial Summary" (TRIGGER)
### Conditions:
- All:
  - **(claim : (Claims) lock_automation)** is _0_ 
- At least one:
### Tasks:
- CF recalculateFinancialSummary
### Tasks with Details:
- CF recalculateFinancialSummary
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: recalculateFinancialSummary}, 
    ``` 

