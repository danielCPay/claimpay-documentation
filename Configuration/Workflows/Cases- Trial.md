# Module: Cases, Section: Trial
- <a href="#wf-657"> "Add task 30 days before Date Exhibit List Deadline"</a>
- <a href="#wf-653"> "Add task 30 days before Date Fact Witness Deadline"</a>
- <a href="#wf-655"> "Add task 30 days before Expert Witness Deadline"</a>
- <a href="#wf-309"> "Add task 30 days before Motion Cut Off Date"</a>
- <a href="#wf-569"> "After Notice for Trial date Entered"</a>
- <a href="#wf-307"> "Calendar Call changed"</a>
- <a href="#wf-185"> "Change of Trial Status"</a>
- <a href="#wf-304"> "Daubert Deadline changed"</a>
- <a href="#wf-308"> "Discovery Cut Off Date changed"</a>
- <a href="#wf-658"> "Exhibit List Deadline changed"</a>
- <a href="#wf-656"> "Expert Witness Deadline changed"</a>
- <a href="#wf-654"> "Fact Witness Deadline changed"</a>
- <a href="#wf-453"> "Generate documents 45 days before Discovery Cut Off Date"</a>
- <a href="#wf-303"> "Joint Pre-Trial Statement Due changed"</a>
- <a href="#wf-305"> "Mediation Deadline changed"</a>
- <a href="#wf-302"> "Motion in Limine Deadline changed"</a>
- <a href="#wf-300"> "Pre-Trial Conference (Trial) changed"</a>
- <a href="#wf-301"> "Trial Date changed"</a>
- <a href="#wf-306"> "Trial Status change to Jury Instuctions/Verdict Form Filed"</a>
- <a href="#wf-299"> "Trial Status change to Motion to Notice of Trial"</a>
----------------------
<a id="wf-657" href="#wf-657"></a>
## "Add task 30 days before Date Exhibit List Deadline"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Exhibit List Deadline** is not empty 
  - **Exhibit List Deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Exhibit List Deadline
<a id="wf-653" href="#wf-653"></a>
## "Add task 30 days before Date Fact Witness Deadline"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Fact Witness Deadline** is not empty 
  - **Fact Witness Deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Fact Witness Deadline
<a id="wf-655" href="#wf-655"></a>
## "Add task 30 days before Expert Witness Deadline"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Expert Witness Deadline** is not empty 
  - **Expert Witness Deadline** days later _30_ 
- At least one:
### Tasks:
- add task for Attorney 30 days before date in field Expert Witness Deadline
<a id="wf-309" href="#wf-309"></a>
## "Add task 30 days before Motion Cut Off Date"
### Conditions:
- All:
  - **Motion Cut Off Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Motion Cut Off Date** days later _30_ 
- At least one:
### Tasks:
- add task &quot;Prepare all outstanding motions and set for hearing&quot; for Attorney 30 days before date in field Motion Cut Off Date
<a id="wf-569" href="#wf-569"></a>
## "After Notice for Trial date Entered"
### Conditions:
- All:
  - **Notice for Trial** has changed 
  - **Lock Automation** is _0_ 
  - **Notice for Trial** is not empty 
- At least one:
### Tasks:
- create document &quot;Pre-trial Catalog&quot;
- create task for Assigned Attorney to &quot;Review and Edit Pre-trial Catalog in; once complete send for filing unless Order specifically states not to file (ie Broward)&quot;
- set Trial Status to Trial Package
- Generate trial package
- Send trial package to Peru Queue
- Set Trial Status to Trial Package Prepared and Sent
<a id="wf-307" href="#wf-307"></a>
## "Calendar Call changed"
### Conditions:
- All:
  - **Calendar Call** has changed 
  - **Calendar Call** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event &quot;Prepare for Calendar Call&quot; for Assigned Attorney 3 days before date in field Calendar Call
- add calendar event for Assigned and Case Manager  &quot;Calendar Call&quot; for same date and time Calendar Call
<a id="wf-185" href="#wf-185"></a>
## "Change of Trial Status"
### Conditions:
- All:
  - **Trial Status** has changed 
  - **Trial Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-304" href="#wf-304"></a>
## "Daubert Deadline changed"
### Conditions:
- All:
  - **Daubert Deadline** has changed 
  - **Daubert Deadline** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- calendar event &quot;File Daubert Motion and Set for hearing&quot; for Assigned Attorney 30 days before date in field
<a id="wf-308" href="#wf-308"></a>
## "Discovery Cut Off Date changed"
### Conditions:
- All:
  - **Discovery Cut Off Date** has changed 
  - **Discovery Cut Off Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event &quot;Draft Final Discovery&quot; for Attorney 45 days before date in field Discovery Cut Off Date
- create task &quot;Draft Final Discovery @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
- create Expert discovery package and forward to DropBox
<a id="wf-658" href="#wf-658"></a>
## "Exhibit List Deadline changed"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Exhibit List Deadline** is not empty 
  - **Exhibit List Deadline** has changed 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline 
<a id="wf-656" href="#wf-656"></a>
## "Expert Witness Deadline changed"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Expert Witness Deadline** has changed 
  - **Expert Witness Deadline** is not empty 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline
<a id="wf-654" href="#wf-654"></a>
## "Fact Witness Deadline changed"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Fact Witness Deadline** is not empty 
  - **Fact Witness Deadline** has changed 
- At least one:
### Tasks:
- create calendar event for Attorney 10-days before deadline 
<a id="wf-453" href="#wf-453"></a>
## "Generate documents 45 days before Discovery Cut Off Date"
### Conditions:
- All:
  - **Discovery Cut Off Date** is not empty 
  - **Discovery Cut Off Date** days later _45_ 
  - **Lock Automation** is _0_ 
  - **Request for Disco Update - Served** is empty 
- At least one:
### Tasks:
- create &quot;Notice of Request for Updated Discovery Reponses&quot;
- Deposit Notice of Request for Updated Discovery Reponses in Peru Queue for filing
- Set Request for Disco Update - Served
<a id="wf-303" href="#wf-303"></a>
## "Joint Pre-Trial Statement Due changed"
### Conditions:
- All:
  - **Joint Pre-Trial Statement Due** has changed 
  - **Joint Pre-Trial Statement Due** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create calendar event &quot;Draft Pre-Trial Statement&quot; for Assigned Attorney 10 days before date in field
- add calendar event to Assigned and Case Manager &quot;Joint Pre-Trial Statement Due&quot; for same date and time Joint Pre-Trial Statement Due
- Create task &quot;Draft Pre-Trial Statement @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot; for Assigned Attorney
<a id="wf-305" href="#wf-305"></a>
## "Mediation Deadline changed"
### Conditions:
- All:
  - **Mediation Deadline** has changed 
  - **Mediation Deadline** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Arbitration - Deadline&quot; in Mediation Arbitration Statge
<a id="wf-302" href="#wf-302"></a>
## "Motion in Limine Deadline changed"
### Conditions:
- All:
  - **Motion in Limine Deadline** has changed 
  - **Motion in Limine Deadline** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create Ps Motion in Limine
- Send Ps Motion in Limine to Peru Team
<a id="wf-300" href="#wf-300"></a>
## "Pre-Trial Conference (Trial) changed"
### Conditions:
- All:
  - **Pre-Trial Conference (Trial)** has changed 
  - **Pre-Trial Conference (Trial)** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
-  add calendar event &quot;Prepare for Pre-Trial Conference&quot; for Assigned Attorney 21 days before date in field
- add calendar event Assigned and Case Manager &quot;Pre-Trial Conference (Trial)&quot; for same date and time &quot;Pre-Trial Conference (Trial)&quot;
<a id="wf-301" href="#wf-301"></a>
## "Trial Date changed"
### Conditions:
- All:
  - **Trial Date** has changed 
  - **Trial Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- ~create task for Scheduling Team - Mediation/Arbitraion to &quot;Immediately add all deadline dates in&quot;~
- calendar event  for Assigned and Case Manager &quot;Trial&quot; for same date and time Trial Date
-  Set Trial Status to Trial Order Received
<a id="wf-306" href="#wf-306"></a>
## "Trial Status change to Jury Instuctions/Verdict Form Filed"
### Conditions:
- All:
  - **Trial Status** has changed 
  - **Trial Status** is _Jury Instuctions/Verdict Form Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set date Jury Instructions/Verdict Form
<a id="wf-299" href="#wf-299"></a>
## "Trial Status change to Motion to Notice of Trial"
### Conditions:
- All:
  - **Trial Status** has changed 
  - **Trial Status** is _Notice of Trial_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set date Notice for Trial
