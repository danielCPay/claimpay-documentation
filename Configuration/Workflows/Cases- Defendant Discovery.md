# Module: Cases, Section: Defendant Discovery
- <a href="#wf-180"> "Change of Defendant Discovery Status"</a>
- <a href="#wf-527"> "Defendnat Discovery change to 1st Disco Set - Ds MTC Better Responses"</a>
- <a href="#wf-528"> "Defendnat Discovery change to 1st Disco Set - Ds MTC Responses"</a>
- <a href="#wf-526"> "Defendnat Discovery change to 1st Disco Set - Response Pending Review"</a>
- <a href="#wf-529"> "Defendnat Discovery change to 1st Disco Set - Response Served"</a>
- <a href="#wf-533"> "Defendnat Discovery change to 2nd Disco Set - Ds MTC Better Responses"</a>
- <a href="#wf-534"> "Defendnat Discovery change to 2nd Disco Set - Ds MTC Responses"</a>
- <a href="#wf-532"> "Defendnat Discovery change to 2nd Disco Set - Response Pending Review"</a>
- <a href="#wf-535"> "Defendnat Discovery change to 2nd Disco Set - Response Served"</a>
- <a href="#wf-539"> "Defendnat Discovery change to Expert Disco Set - Ds MTC Better Responses"</a>
- <a href="#wf-540"> "Defendnat Discovery change to Expert Disco Set - Ds MTC Responses"</a>
- <a href="#wf-538"> "Defendnat Discovery change to Expert Disco Set - Response Pending Review"</a>
- <a href="#wf-541"> "Defendnat Discovery change to Expert Disco Set - Response Served"</a>
- <a href="#wf-524"> "Ds 1st Disco Set - Received Date changed"</a>
- <a href="#wf-530"> "Ds 2nd Disco Set - Received date changed"</a>
- <a href="#wf-536"> "Ds Expert Disco Set - Received date changed"</a>
- <a href="#wf-525"> "No date in Ds 1st Disco Set - Response Served within 25 days of Ds 1st Disco Set - Received"</a>
- <a href="#wf-531"> "No date in Ds 2nd Disco Set - Response Served within 25 days of Ds 2nd Disco Set - Received"</a>
- <a href="#wf-537"> "No date in Ds Expert Disco Set - Response Served within 25 days of Ds Expert Disco Set - Received"</a>
----------------------
<a id="wf-180" href="#wf-180"></a>
## "Change of Defendant Discovery Status"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is not empty 
- At least one:
### Tasks:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-527" href="#wf-527"></a>
## "Defendnat Discovery change to 1st Disco Set - Ds MTC Better Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _1st Disco Set - Ds MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
<a id="wf-528" href="#wf-528"></a>
## "Defendnat Discovery change to 1st Disco Set - Ds MTC Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _1st Disco Set - Ds MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
<a id="wf-526" href="#wf-526"></a>
## "Defendnat Discovery change to 1st Disco Set - Response Pending Review"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _1st Disco Set - Response Pending Review_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 1st Set in&quot;
<a id="wf-529" href="#wf-529"></a>
## "Defendnat Discovery change to 1st Disco Set - Response Served"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _1st Disco Set - Response Served_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add date to &quot;Ds 1st Disco Set - Response Served&quot; 
<a id="wf-533" href="#wf-533"></a>
## "Defendnat Discovery change to 2nd Disco Set - Ds MTC Better Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _2nd Disco Set - Ds MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
<a id="wf-534" href="#wf-534"></a>
## "Defendnat Discovery change to 2nd Disco Set - Ds MTC Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _2nd Disco Set - Ds MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
<a id="wf-532" href="#wf-532"></a>
## "Defendnat Discovery change to 2nd Disco Set - Response Pending Review"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _2nd Disco Set - Response Pending Review_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to 2nd Set in&quot;
<a id="wf-535" href="#wf-535"></a>
## "Defendnat Discovery change to 2nd Disco Set - Response Served"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _2nd Disco Set - Response Served_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Ds 2nd Disco Set - Response Served date
<a id="wf-539" href="#wf-539"></a>
## "Defendnat Discovery change to Expert Disco Set - Ds MTC Better Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _Expert Disco Set - Ds MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft Response to Ds MTC Better Responses in or provide better responses&quot;
<a id="wf-540" href="#wf-540"></a>
## "Defendnat Discovery change to Expert Disco Set - Ds MTC Responses"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _Expert Disco Set - Ds MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review and draft response to Ds MTC Responses in or provide discovery responses&quot;
<a id="wf-538" href="#wf-538"></a>
## "Defendnat Discovery change to Expert Disco Set - Response Pending Review"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _Expert Disco Set - Response Pending Review_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Discovery Responses Draft to Expert Set in&quot;
<a id="wf-541" href="#wf-541"></a>
## "Defendnat Discovery change to Expert Disco Set - Response Served"
### Conditions:
- All:
  - **Defendant Discovery Status** has changed 
  - **Defendant Discovery Status** is _Expert Disco Set - Response Served_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Ds Expert Disco Set - Response Served
<a id="wf-524" href="#wf-524"></a>
## "Ds 1st Disco Set - Received Date changed"
### Conditions:
- All:
  - **Ds 1st Disco Set - Received** is not empty 
  - **Ds 1st Disco Set - Received** has changed 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds 1st Disco Set - Received date: &quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds 1st Disco Set in&quot;
- Set Defendant Discovery Status to 1st Disco Set - Received
<a id="wf-530" href="#wf-530"></a>
## "Ds 2nd Disco Set - Received date changed"
### Conditions:
- All:
  - **Ds 2nd Disco Set - Received** is not empty 
  - **Ds 2nd Disco Set - Received** has changed 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds 2nd Disco Set - Received: &quot;&quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds 2nd Disco Set in&quot; 
- Set Defendant Discovery Status to 2nd Disco Set - Received
<a id="wf-536" href="#wf-536"></a>
## "Ds Expert Disco Set - Received date changed"
### Conditions:
- All:
  - **Ds Expert Disco Set - Received** is not empty 
  - **Ds Expert Disco Set - Received** has changed 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Attoreny (User) 29 after Ds Expert Disco Set - Received date: &quot;Responses due in&quot;
- create task for Case Manager to &quot;Draft Responses to Ds Expert Disco Set in&quot;
- Set Defendant Discovery Status to Expert Disco Set - Received
<a id="wf-525" href="#wf-525"></a>
## "No date in Ds 1st Disco Set - Response Served within 25 days of Ds 1st Disco Set - Received"
### Conditions:
- All:
  - **Status** is _1st Disco Set - Received_ 
  - **Ds 1st Disco Set - Response Served** is empty 
  - **Ds 1st Disco Set - Received** days ago _25_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to 1st Disco Set - Ps MFET Filed,  set Ps Motion For Extension Of Time
<a id="wf-531" href="#wf-531"></a>
## "No date in Ds 2nd Disco Set - Response Served within 25 days of Ds 2nd Disco Set - Received"
### Conditions:
- All:
  - **Status** is _2nd Disco Set - Received_ 
  - **Ds 2nd Disco Set - Response Served** is empty 
  - **Ds 2nd Disco Set - Received** days ago _25_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to 2nd Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
<a id="wf-537" href="#wf-537"></a>
## "No date in Ds Expert Disco Set - Response Served within 25 days of Ds Expert Disco Set - Received"
### Conditions:
- All:
  - **Status** is _Expert Disco Set - Received_ 
  - **Ds Expert Disco Set - Response Served** is empty 
  - **Ds Expert Disco Set - Received** days ago _25_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create &quot;Ps Motion for Extension of Time - Discovery&quot;
- deposit Ps Motion for Extension of Time - Discovery to Peru Queue for filing
- change Defendnat Discovery Status to Expert Disco Set - Ps MFET Filed, set Ps Motion For Extension Of Time
