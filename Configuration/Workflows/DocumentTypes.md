# Module: DocumentTypes
<a id="user-content-wf-103" href="#wf-103"></a>
## WF 103 - "Build Document Type Path" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **document_type** has changed 
  - **parent_document_type** has changed 
  - **document_area** has changed 
### Tasks:
- build this Document Type Path
### Tasks with Details:
- build this Document Type Path
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "document_type_path": "if parent_document_type &gt; 0 then concat('$(record : parent_document_type)$ / ', document_type) else document_type end (expression)"
    }, 
    ``` 

