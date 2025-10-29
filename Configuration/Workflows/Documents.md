# Module: Documents
<a id="user-content-wf-155" href="#wf-155"></a>
## WF 155 - "Import Claims Onboarding Spreadsheet" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **document_type** is _Claims Management / Claims Onboarding Spreadsheet_ 
  - **source** is not _Customer Portal_ 
- At least one:
### Tasks:
- import_claims_from_excel
### Tasks with Details:
- import_claims_from_excel
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: import_claims_from_excel}, 
    ``` 

<a id="user-content-wf-378" href="#wf-378"></a>
## WF 378 - "Set Portfolio if Portfolio Purchase has changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio_purchase** is not empty 
  - **portfolio_purchase** has changed 
- At least one:
### Tasks:
- Set Portfolio = Portfolio Purchase.Portfolio
### Tasks with Details:
- Set Portfolio = Portfolio Purchase.Portfolio
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portfolio": "get_id('Portfolios', 'portfolio_id', '$(relatedRecord : portfolio_purchase|portfolio|PortfolioPurchases)$') (expression)"
    }, 
    ``` 

<a id="user-content-wf-380" href="#wf-380"></a>
## WF 380 - "Set Provider if Portfolio has changed" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portfolio** is not empty 
  - **portfolio** has changed 
- At least one:
### Tasks:
- Set Provider if Portfolio is not empty
### Tasks with Details:
- Set Provider if Portfolio is not empty
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider": "get_id('Providers', 'provider_name', '$(relatedRecord : portfolio|provider|Portfolios)$') (expression)"
    }, 
    ``` 

<a id="user-content-wf-435" href="#wf-435"></a>
## WF 435 - "OCR and assign Case to Collection (automatic)" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **document_type** is _Litigation / Settlement Checks_ 
  - **last_date_of_parsing** not has changed 
  - **collection** is not empty 
- At least one:
### Tasks:
- Assign Case to Collection
### Tasks with Details:
- Assign Case to Collection
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: assignCaseToCollection}, 
    ``` 

<a id="user-content-wf-436" href="#wf-436"></a>
## WF 436 - "OCR and assign Case to Collection" (TRIGGER)
### Conditions:
- All:
  - **document_type** is _Litigation / Settlement Checks_ 
  - **collection** is not empty 
- At least one:
### Tasks:
- Assign Case to Collection
### Tasks with Details:
- Assign Case to Collection
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: assignCaseToCollection}, 
    ``` 

<a id="user-content-wf-458" href="#wf-458"></a>
## WF 458 - "assignCaseToCollection" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **document_type** is _Litigation / Settlement Checks_ 
- At least one:
### Tasks:
- assignCaseToCollection
### Tasks with Details:
- assignCaseToCollection
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: assignCaseToCollection}, 
    ``` 

<a id="user-content-wf-462" href="#wf-462"></a>
## WF 462 - "A package of documents “Exhibit B and Exhibit C” is created" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **document_type** is _Claims Management / Portfolio Purchase Documents_ 
  - **(portfolio_purchase : (PortfolioPurchases) addendum_date)** is not empty 
  - **(portfolio_purchase : (PortfolioPurchases) portfolio_purchase_status)** is _Sent to Seller to be signed_ 
  - **filename** does not contain _Signed_ 
- At least one:
### Tasks:
-  Send the document to the DocuSign system
- Set Sent to Seller to be signed date
### Tasks with Details:
-  Send the document to the DocuSign system
    ``` 
    taskType: VTEntityWorkflow, active: true 
    taskTypeParameters: {
      "workflowModule": "PARENT||PortfolioPurchases",
      "otherWorkflowId": " Send the document to the DocuSign system",
      "otherWorkflowField": "portfolio_purchase"
    }, 
    ``` 

- Set Sent to Seller to be signed date
    ``` 
    taskType: VTUpdateRelatedFieldTask, active: true 
    taskTypeParameters: {
      "portfolio_purchase::PortfolioPurchases::sent_be_signed_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-602" href="#wf-602"></a>
## WF 602 - "set Document.Case from Document.Claim.Case" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **claim** is not empty 
  - **claim** has changed 
  - **(claim : (Claims) case)** is not empty 
- At least one:
### Tasks:
- set Document.Case from Document.Claim.Case
### Tasks with Details:
- set Document.Case from Document.Claim.Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case": "$(relatedRecordId : claim|case|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-623" href="#wf-623"></a>
## WF 623 - "On change of Case in Claim Set Document.Case from Document.Claim.Case" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- set Document.Case from Document.Claim.Case
### Tasks with Details:
- set Document.Case from Document.Claim.Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "case": "$(relatedRecordId : claim|case|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-634" href="#wf-634"></a>
## WF 634 - "Import HO Cases only" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **document_type** is _Litigation / HOS / HO Onboarding Spreadsheet_ 
- At least one:
### Tasks:
- import HO cases
### Tasks with Details:
- import HO cases
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: import_cases_from_excel}, 
    ``` 

<a id="user-content-wf-718" href="#wf-718"></a>
## WF 718 - "On change of Outside Case in Claim Set Document.Outside Case from Document.Claim.Outside Case" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- set Document.Outside Case from Document.Claim.Outside Case
### Tasks with Details:
- set Document.Outside Case from Document.Claim.Outside Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case": "$(relatedRecordId : claim|outside_case|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-720" href="#wf-720"></a>
## WF 720 - "set Document.Outside Case from Document.Claim.Outside Case" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **claim** has changed 
  - **claim** is not empty 
  - **(claim : (Claims) outside_case)** is not empty 
- At least one:
### Tasks:
- set Document.Outside Case from Document.Outside Claim.Case
### Tasks with Details:
- set Document.Outside Case from Document.Outside Claim.Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case": "$(relatedRecordId : claim|outside_case|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-726" href="#wf-726"></a>
## WF 726 - "Create tasks for Universal Property &amp; Casualty Insurance Company" (MANUAL)
### Conditions:
- All:
  - **document_type** is _Litigation / Pre-Litigation Stage / 10-days Demand Letter Package_ 
  - **createdtime** less than hours before _1_ 
  - **(insurance_company : (InsuranceCompanies) portal_for_official_documents)** is not empty 
- At least one:
### Tasks:
-  create tasks when a 10-day demand package for Insurance Company with official portal is created
### Tasks with Details:
-  create tasks when a 10-day demand package for Insurance Company with official portal is created
    ``` 
    taskType: VTCreateEntityTask, active: true 
    taskTypeParameters: {
      "entity_type": "Tasks",
      "reference_field": "",
      "mappingPanel": "0",
      "verifyIfExists": "0",
      "addMostRecentDocumentFromParent": "1",
      "set_fields_in_new_entity": {
        "task_name": "'Send @@CASE_ID@@ 10-day demand letter to @@INSURANCE_COMPANY@@' (expression)",
        "priority": "Normal (rawtext)",
        "assigned_user_id": "RPA Team (rawtext)",
        "case": "case (fieldname)",
        "note": "'Case: &lt;a href=&quot;$(record : CrmDetailViewURL)$&quot;&gt;$(record : case)$&lt;/a&gt;&lt;/br&gt; Document: &lt;a href=&quot;$(record : CrmDetailViewURL)$&quot;&gt;$(record : filename)$&lt;/a&gt; Portal: $(relatedRecord : insurance_company|portal_for_official_documents|InsuranceCompanies)$&lt;/br&gt;' (expression)",
        "insured": "$(relatedRecordId : case|insured|Cases)$ (expression)"
      }
    }, 
    ``` 

<a id="user-content-wf-727" href="#wf-727"></a>
## WF 727 - "Set Insurance Company for document type Litigation / Pre-Litigation Stage / 10-days Demand Letter Package" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **document_type** is _Litigation / Pre-Litigation Stage / 10-days Demand Letter Package_ 
  - **source** is not _Customer Portal_ 
- At least one:
### Tasks:
- Set Insurance Company
### Tasks with Details:
- Set Insurance Company
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "insurance_company": "​​​​​​​$(relatedRecordId : case|insurance_company|Cases)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-841" href="#wf-841"></a>
## WF 841 - "Set Access Through Provider Portal" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
  - **document_type** is _Provider Documents / Application_ 
  - **document_type** is _Provider Documents / MPA_ 
  - **document_type** is _Claims Management / Portfolio Purchase Documents_ 
### Tasks:
- Set Access Through Provider Portal =View only
### Tasks with Details:
- Set Access Through Provider Portal =View only
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "access_through_provider_portal": "View only (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-863" href="#wf-863"></a>
## WF 863 - "On Create, fill Outside Case" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **claim** is not empty 
  - **(claim : (Claims) outside_case)** is not empty 
  - **outside_case** is empty 
- At least one:
### Tasks:
- set Document.Outside Case from Document.Claim.Outside Case
### Tasks with Details:
- set Document.Outside Case from Document.Claim.Outside Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case": "$(relatedRecordId : claim|outside_case|Claims)$ (expression)"
    }, 
    ``` 

<a id="user-content-wf-864" href="#wf-864"></a>
## WF 864 - "On Create, fill Case" (ON_FIRST_SAVE)
### Conditions:
- All:
  - **claim** is not empty 
  - **(claim : (Claims) case)** is not empty 
  - **case** is empty 
- At least one:
### Tasks:
- set Document.Case from Document.Claim.Case
### Tasks with Details:
- set Document.Case from Document.Claim.Case
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "outside_case": "$(relatedRecordId : claim|case|Claims)$ (expression)"
    }, 
    ``` 

