# Module: Cases, Section: .ERROR_no_section
- <a href="#wf-628"> "Clear Court when Total balance or County empty"</a>
- <a href="#wf-280"> "ON_SCHEDULE_UPDATE_STATUS_AGE"</a>
----------------------
<a id="wf-628" href="#wf-628"></a>
## "Clear Court when Total balance or County empty"
### Conditions:
- All:
  - **Court** is not empty 
- At least one:
  - **Total Balance** equal to _0_ 
  - **County** is empty 
### Tasks:
- Crear Court 
<a id="wf-280" href="#wf-280"></a>
## "ON_SCHEDULE_UPDATE_STATUS_AGE"
### Conditions:
- All:
  - **Status** is not empty 
- At least one:
### Tasks:
- CF calculateStatusAge
