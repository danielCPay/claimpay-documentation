# Module: Cases, Section: Appraisal
- <a href="#wf-494"> "Appraisal Status change to Appraisal - Demanded HOMEOWNER"</a>
- <a href="#wf-493"> "Appraisal Status change to Appraisal - Demanded PROVIDER"</a>
- <a href="#wf-269"> "Appraisal Status change to NOI - Appraisal Requested"</a>
- <a href="#wf-853"> "Change of Appraisal Status"</a>
----------------------
<a id="wf-494" href="#wf-494"></a>
## "Appraisal Status change to Appraisal - Demanded HOMEOWNER"
### Conditions:
- All:
  - **Appraisal Status** has changed to _Appraisal - Demanded HOMEOWNER_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to CLIENT_EMAIL
<a id="wf-493" href="#wf-493"></a>
## "Appraisal Status change to Appraisal - Demanded PROVIDER"
### Conditions:
- All:
  - **Appraisal Status** has changed to _Appraisal - Demanded PROVIDER_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Pre-litigation Appraisal Letter&quot; to PROVIDER_EMAIL
<a id="wf-269" href="#wf-269"></a>
## "Appraisal Status change to NOI - Appraisal Requested"
### Conditions:
- All:
  - **Appraisal Status** has changed to _NOI - Appraisal Requested_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send task to assigned assistant to &quot;Contact client&quot;
<a id="wf-853" href="#wf-853"></a>
## "Change of Appraisal Status"
### Conditions:
- All:
  - **Appraisal Status** has changed 
  - **Appraisal Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
