# Module: Cases, Section: Plaintiff Discovery
- <a href="#wf-510"> " IF 7 days after Ps 3rd Disco Set - Agreed Due Date no date has been entered"</a>
- <a href="#wf-501"> "1 day before Ps 1st Disco Set - Ds MFET Hearing date create task  for Attorney to "</a>
- <a href="#wf-508"> "1 day before Ps 2nd Disco Set - Ds MFET Hearing date create task for Attorney"</a>
- <a href="#wf-512"> "1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Attorney"</a>
- <a href="#wf-516"> "1 day before Ps Expert Disco Set - Ds MFET Hearing date create task for Attorney"</a>
- <a href="#wf-415"> "2nd Disco Set - Response Received changed"</a>
- <a href="#wf-503"> "45 days after Ps 1st Disco Set - Served"</a>
- <a href="#wf-498"> "7 days after Ps 1st Disco Set - Agreed Due Date"</a>
- <a href="#wf-506"> "7 days after Ps 2nd Disco Set - Agreed Due Date no date has been entered"</a>
- <a href="#wf-514"> "7 days after Ps Expert Disco Set - Agreed Due Date no date has been entered"</a>
- <a href="#wf-178"> "Change of Plaintiff Discovery Status"</a>
- <a href="#wf-424"> "Expert Disco Set - Response Received changed"</a>
- <a href="#wf-517"> "No date in Request for Disco Update - Received within 30 days of Request for Disco Update - Served"</a>
- <a href="#wf-452"> "Plaintiff Discovery Status = 1st Disco Set - Served and no date has been entered within 60"</a>
- <a href="#wf-417"> "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 45"</a>
- <a href="#wf-446"> "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 60"</a>
- <a href="#wf-422"> "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 45"</a>
- <a href="#wf-447"> "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 60"</a>
- <a href="#wf-426"> "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 45"</a>
- <a href="#wf-448"> "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 60"</a>
- <a href="#wf-405"> "Plaintiff Discovery Status change to 1st Disco Set - MTC Better Responses"</a>
- <a href="#wf-406"> "Plaintiff Discovery Status change to 1st Disco Set - MTC Responses"</a>
- <a href="#wf-407"> "Plaintiff Discovery Status change to 2nd Disco Set - MTC Better Responses"</a>
- <a href="#wf-408"> "Plaintiff Discovery Status change to 2nd Disco Set - MTC Responses"</a>
- <a href="#wf-409"> "Plaintiff Discovery Status change to 3rd Disco Set - MTC Better Responses"</a>
- <a href="#wf-410"> "Plaintiff Discovery Status change to 3rd Disco Set - MTC Responses"</a>
- <a href="#wf-411"> "Plaintiff Discovery Status change to Expert Disco Set - MTC Better Responses"</a>
- <a href="#wf-412"> "Plaintiff Discovery Status change to Expert Disco Set - MTC Responses"</a>
- <a href="#wf-497"> "Ps 1st Disco Set - Agreed Due Date changed"</a>
- <a href="#wf-413"> "Ps 1st Disco Set - Ds MFET changed"</a>
- <a href="#wf-500"> "Ps 1st Disco Set - Ds MFET Hearing date changed"</a>
- <a href="#wf-414"> "Ps 1st Disco Set - Response Received changed"</a>
- <a href="#wf-505"> "Ps 2nd Disco Set - Agreed Due Date changed"</a>
- <a href="#wf-418"> "Ps 2nd Disco Set - Ds MFET date changed"</a>
- <a href="#wf-507"> "Ps 2nd Disco Set - Ds MFET Hearing date changed"</a>
- <a href="#wf-416"> "Ps 2nd Disco Set - Served changed"</a>
- <a href="#wf-509"> "Ps 3rd Disco Set - Agreed Due Date changed"</a>
- <a href="#wf-419"> "Ps 3rd Disco Set - Ds MFET date changed"</a>
- <a href="#wf-511"> "Ps 3rd Disco Set - Ds MFET Hearing date changed"</a>
- <a href="#wf-420"> "Ps 3rd Disco Set - Response Received changed"</a>
- <a href="#wf-421"> "Ps 3rd Disco Set - Served changed"</a>
- <a href="#wf-513"> "Ps Expert Disco Set - Agreed Due Date changed"</a>
- <a href="#wf-423"> "Ps Expert Disco Set - Ds MFET date change"</a>
- <a href="#wf-515"> "Ps Expert Disco Set - Ds MFET Hearing date changed"</a>
- <a href="#wf-425"> "Ps Expert Disco Set - Served changed"</a>
- <a href="#wf-564"> "Request for Disco Update - Received changed"</a>
----------------------
<a id="wf-510" href="#wf-510"></a>
## " IF 7 days after Ps 3rd Disco Set - Agreed Due Date no date has been entered"
### Conditions:
- All:
  - **Status** is _3rd Disco Set - Ds MFET Agreed Extension_ 
  - **Ps 3rd Disco Set - Response Received** is empty 
  - **Ps 3rd Disco Set - Agreed Due Date** days ago _7_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 3rd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
<a id="wf-501" href="#wf-501"></a>
## "1 day before Ps 1st Disco Set - Ds MFET Hearing date create task  for Attorney to "
### Conditions:
- All:
  - **Ps 1st Disco Set - Ds MFET Hearing** is not empty 
  - **Ps 1st Disco Set - Ds MFET Hearing** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney 1 day before to &quot;Prepare for D's MFET - 1st Set in&quot;
<a id="wf-508" href="#wf-508"></a>
## "1 day before Ps 2nd Disco Set - Ds MFET Hearing date create task for Attorney"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Ds MFET Hearing** is not empty 
  - **Ps 2nd Disco Set - Ds MFET Hearing** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps 2nd Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - 2nd Set in&quot;
<a id="wf-512" href="#wf-512"></a>
## "1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Attorney"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Ds MFET Hearing** is not empty 
  - **Ps 3rd Disco Set - Ds MFET Hearing** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps 3rd Disco Set - Ds MFET Hearing create task for Assigned Attorney to  &quot;Prepare for D's MFET - 3rd Set in&quot;
<a id="wf-516" href="#wf-516"></a>
## "1 day before Ps Expert Disco Set - Ds MFET Hearing date create task for Attorney"
### Conditions:
- All:
  - **Ps Expert Disco Set - Ds MFET Hearing** is not empty 
  - **Ps Expert Disco Set - Ds MFET Hearing** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Expert Disco Set - Ds MFET Hearing create task for Assigned Attorney to &quot;Prepare for D's MFET - Expert Set in&quot;
<a id="wf-415" href="#wf-415"></a>
## "2nd Disco Set - Response Received changed"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Response Received** has changed 
  - **Ps 2nd Disco Set - Response Received** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;2nd Disco Set - Response Received&quot;
- create task for Assigned Attorney to &quot;Review Discovery Responses to 2nd Set of Discovery&quot;
<a id="wf-503" href="#wf-503"></a>
## "45 days after Ps 1st Disco Set - Served"
### Conditions:
- All:
  - **Status** is _1st Disco Set - Served_ 
  - **Lock Automation** is _0_ 
  - **Ps 1st Disco Set - Response Received** is empty 
  - **Ps 1st Disco Set - Agreed Due Date** is empty 
  - **Ps 1st Disco Set - Ds MFET** is empty 
  - **Status Age** equal to _45_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 1st Set&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-498" href="#wf-498"></a>
## "7 days after Ps 1st Disco Set - Agreed Due Date"
### Conditions:
- All:
  - **Status** is _1st Disco Set - Ds MFET Agreed Extension_ 
  - **Ps 1st Disco Set - Response Received** is empty 
  - **Ps 1st Disco Set - Agreed Due Date** days ago _7_ ()
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 1st Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
<a id="wf-506" href="#wf-506"></a>
## "7 days after Ps 2nd Disco Set - Agreed Due Date no date has been entered"
### Conditions:
- All:
  - **Status** is _2nd Disco Set - Ds MFET Agreed Extension_ 
  - **Ps 2nd Disco Set - Agreed Due Date** days ago _7_ 
  - **Ps 2nd Disco Set - Response Received** is empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to 2nd Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
<a id="wf-514" href="#wf-514"></a>
## "7 days after Ps Expert Disco Set - Agreed Due Date no date has been entered"
### Conditions:
- All:
  - **Status** is _Expert Disco Set - Ds MFET Agreed Extension_ 
  - **Ps Expert Disco Set - Response Received** is empty 
  - **Ps Expert Disco Set - Agreed Due Date** days ago _7_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review for overdue discovery responses to Expert Disco Set and draft Motion to Compel with Sanctions if Necessary&quot;
<a id="wf-178" href="#wf-178"></a>
## "Change of Plaintiff Discovery Status"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-424" href="#wf-424"></a>
## "Expert Disco Set - Response Received changed"
### Conditions:
- All:
  - **Ps Expert Disco Set - Response Received** has changed 
  - **Ps Expert Disco Set - Response Received** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Expert Disco Set - Response Received
- create task for Assigned Attorney to &quot;Review Discovery Responses to Expert Set of Discovery&quot;
<a id="wf-517" href="#wf-517"></a>
## "No date in Request for Disco Update - Received within 30 days of Request for Disco Update - Served"
### Conditions:
- All:
  - **Status** is _Request for Disco Update - Served_ 
  - **Request for Disco Update - Received** is empty 
  - **Request for Disco Update - Served** days ago _30_ ()
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - Update&quot; to OPPOSING_COUNSEL_EMAIL
- create &quot;Ps Motion to Compel Update&quot;
- deposit Ps Motion to Compel Update to Peru Queue
<a id="wf-452" href="#wf-452"></a>
## "Plaintiff Discovery Status = 1st Disco Set - Served and no date has been entered within 60"
### Conditions:
- All:
  - **Status** is _1st Disco Set - Served_ 
  - **Status Age** equal to _60_ 
  - **Ps 1st Disco Set - Response Received** is empty 
  - **Ps 1st Disco Set - Agreed Due Date** is empty 
  - **Ps 1st Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
-  generate Ps Motion to Compel Response to 1st Set of Discovery
-  deposit Ps Motion to Compel Response to 1st Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 1st Set in  @@CASE ID@@ @@INJUREDPARTY_NAME@@&quot;
<a id="wf-417" href="#wf-417"></a>
## "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 45"
### Conditions:
- All:
  - **Status** is _2nd Disco Set - Served_ 
  - **Status Age** equal to _45_ 
  - **Ps 2nd Disco Set - Response Received** is empty 
  - **Ps 2nd Disco Set - Agreed Due Date** is empty 
  - **Ps 2nd Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 2nd Set&quot; to OPPOSING_COUNSEL_EMAIL;  
<a id="wf-446" href="#wf-446"></a>
## "Plaintiff Discovery Status = 2nd Disco Set - Served and no date has been entered within 60"
### Conditions:
- All:
  - **Status** is _2nd Disco Set - Served_ 
  - **Status Age** equal to _60_ 
  - **Ps 2nd Disco Set - Response Received** is empty 
  - **Ps 2nd Disco Set - Agreed Due Date** is empty 
  - **Ps 2nd Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- create Ps Motion to Compel Response to 2nd Set of Discovery
- deposit Ps Motion to Compel Response to 2nd Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 2nd Set in&quot;
<a id="wf-422" href="#wf-422"></a>
## "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 45"
### Conditions:
- All:
  - **Status** is _3rd Disco Set - Served_ 
  - **Status Age** equal to _45_ 
  - **Ps 3rd Disco Set - Response Received** is empty 
  - **Ps 3rd Disco Set - Agreed Due Date** is empty 
  - **Ps 3rd Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - 3rd Set&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-447" href="#wf-447"></a>
## "Plaintiff Discovery Status = 3rd Disco Set - Served and no date has been entered within 60"
### Conditions:
- All:
  - **Status** is _3rd Disco Set - Served_ 
  - **Status Age** equal to _60_ 
  - **Ps 3rd Disco Set - Response Received** is empty 
  - **Ps 3rd Disco Set - Agreed Due Date** is empty 
  - **Ps 3rd Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- create Ps Motion to Compel Response to 3rd Set of Discovery
- deposit Ps Motion to Compel Response to 3rd Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - 3rd Set in&quot;
<a id="wf-426" href="#wf-426"></a>
## "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 45"
### Conditions:
- All:
  - **Status** is _Expert Disco Set - Served_ 
  - **Status Age** equal to _45_ 
  - **Ps Expert Disco Set - Response Received** is empty 
  - **Ps Expert Disco Set - Agreed Due Date** is empty 
  - **Ps Expert Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- send email template &quot;Overdue Discovery Responses - Expert&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-448" href="#wf-448"></a>
## "Plaintiff Discovery Status = Expert Disco Set - Served and no date has been entered within 60"
### Conditions:
- All:
  - **Status** is _Expert Disco Set - Served_ 
  - **Status Age** equal to _60_ 
  - **Ps Expert Disco Set - Response Received** is empty 
  - **Ps Expert Disco Set - Agreed Due Date** is empty 
  - **Ps Expert Disco Set - Ds MFET** is empty 
  - **Lock Automation** is _0_ 
  - **Stage** is _Plaintiff Discovery_ 
- At least one:
### Tasks:
- generate Ps Motion to Compel Response to Expert Set of Discovery
- deposit  Ps Motion to Compel Response to Expert Set of Discovery to Peru Queue
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Ps MTC - Expert Set in&quot;
<a id="wf-405" href="#wf-405"></a>
## "Plaintiff Discovery Status change to 1st Disco Set - MTC Better Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _1st Disco Set - MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on 's Motion to Compel Better Responses to s 1st Disco Set in&quot;
<a id="wf-406" href="#wf-406"></a>
## "Plaintiff Discovery Status change to 1st Disco Set - MTC Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _1st Disco Set - MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 1st Disco Set in&quot;
<a id="wf-407" href="#wf-407"></a>
## "Plaintiff Discovery Status change to 2nd Disco Set - MTC Better Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _2nd Disco Set - MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 2nd Disco Set in&quot;
<a id="wf-408" href="#wf-408"></a>
## "Plaintiff Discovery Status change to 2nd Disco Set - MTC Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _2nd Disco Set - MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 2nd Disco Set in&quot;
<a id="wf-409" href="#wf-409"></a>
## "Plaintiff Discovery Status change to 3rd Disco Set - MTC Better Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _3rd Disco Set - MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps 3rd Disco Set in&quot;
<a id="wf-410" href="#wf-410"></a>
## "Plaintiff Discovery Status change to 3rd Disco Set - MTC Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _3rd Disco Set - MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's 3rd Disco Set in&quot;
<a id="wf-411" href="#wf-411"></a>
## "Plaintiff Discovery Status change to Expert Disco Set - MTC Better Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _Expert Disco Set - MTC Better Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to  &quot;Coordinate hearing on 's Motion to Compel Better Responses to Ps Expert Disco Set in&quot;
<a id="wf-412" href="#wf-412"></a>
## "Plaintiff Discovery Status change to Expert Disco Set - MTC Responses"
### Conditions:
- All:
  - **Plaintiff Discovery Status** has changed 
  - **Plaintiff Discovery Status** is _Expert Disco Set - MTC Responses_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings &quot;Coordinate hearing on Plaintiff's Motion to Compel Responses to Plaintiff's Expert Disco Set in&quot;
<a id="wf-497" href="#wf-497"></a>
## "Ps 1st Disco Set - Agreed Due Date changed"
### Conditions:
- All:
  - **Ps 1st Disco Set - Agreed Due Date** has changed 
  - **Ps 1st Disco Set - Agreed Due Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Plaintiff Discovery Status to to 1st Disco Set - Ds MFET Agreed Extenstion
<a id="wf-413" href="#wf-413"></a>
## "Ps 1st Disco Set - Ds MFET changed"
### Conditions:
- All:
  - **Ps 1st Disco Set - Ds MFET** has changed 
  - **Ps 1st Disco Set - Ds MFET** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 1st Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
- Set Plaintiff Discovery Status to 1st Disco Set - Ds MFET
<a id="wf-500" href="#wf-500"></a>
## "Ps 1st Disco Set - Ds MFET Hearing date changed"
### Conditions:
- All:
  - **Ps 1st Disco Set - Ds MFET Hearing** has changed 
  - **Ps 1st Disco Set - Ds MFET Hearing** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 1st Disco Set - Ds MFET Hearing Set
- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 1st Disco Set in&quot; 
<a id="wf-414" href="#wf-414"></a>
## "Ps 1st Disco Set - Response Received changed"
### Conditions:
- All:
  - **Ps 1st Disco Set - Response Received** has changed 
  - **Ps 1st Disco Set - Response Received** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 1st Disco Set - Response Received
- create task for Attorney(User) to &quot;Review Discovery Responses to 1st Set of Discovery&quot;
<a id="wf-505" href="#wf-505"></a>
## "Ps 2nd Disco Set - Agreed Due Date changed"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Agreed Due Date** has changed 
  - **Ps 2nd Disco Set - Agreed Due Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to to 2nd Disco Set - Ds MFET Agreed Extenstion
<a id="wf-418" href="#wf-418"></a>
## "Ps 2nd Disco Set - Ds MFET date changed"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Ds MFET** has changed 
  - **Ps 2nd Disco Set - Ds MFET** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 2nd Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
<a id="wf-507" href="#wf-507"></a>
## "Ps 2nd Disco Set - Ds MFET Hearing date changed"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Ds MFET Hearing** has changed 
  - **Ps 2nd Disco Set - Ds MFET Hearing** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 2nd Disco Set - Ds MFET Hearing Set
- create calendar event to Assigned and Case Manager &quot;Ds MFET Hearing re: 2nd Disco Set in&quot;
<a id="wf-416" href="#wf-416"></a>
## "Ps 2nd Disco Set - Served changed"
### Conditions:
- All:
  - **Ps 2nd Disco Set - Served** has changed 
  - **Ps 2nd Disco Set - Served** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 2nd Disco Set - Response Received
<a id="wf-509" href="#wf-509"></a>
## "Ps 3rd Disco Set - Agreed Due Date changed"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Agreed Due Date** has changed 
  - **Ps 3rd Disco Set - Agreed Due Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Agreed Extenstion
<a id="wf-419" href="#wf-419"></a>
## "Ps 3rd Disco Set - Ds MFET date changed"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Ds MFET** has changed 
  - **Ps 3rd Disco Set - Ds MFET** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - 3rd Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
<a id="wf-511" href="#wf-511"></a>
## "Ps 3rd Disco Set - Ds MFET Hearing date changed"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Ds MFET Hearing** has changed 
  - **Ps 3rd Disco Set - Ds MFET Hearing** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to 3rd Disco Set - Ds MFET Hearing Set
- create calendar event for Assigned and Case Manager &quot;Ds MFET Hearing re: 3rd Disco Set in&quot; 
<a id="wf-420" href="#wf-420"></a>
## "Ps 3rd Disco Set - Response Received changed"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Response Received** has changed 
  - **Ps 3rd Disco Set - Response Received** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 3rd Disco Set - Response Received
- create task for Assigned Attorney to &quot;Review Discovery Responses to 3rd Set of Discovery&quot;
<a id="wf-421" href="#wf-421"></a>
## "Ps 3rd Disco Set - Served changed"
### Conditions:
- All:
  - **Ps 3rd Disco Set - Served** has changed 
  - **Ps 3rd Disco Set - Served** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;3rd Disco Set - Served&quot;
<a id="wf-513" href="#wf-513"></a>
## "Ps Expert Disco Set - Agreed Due Date changed"
### Conditions:
- All:
  - **Ps Expert Disco Set - Agreed Due Date** has changed 
  - **Ps Expert Disco Set - Agreed Due Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Agreed Extenstion
<a id="wf-423" href="#wf-423"></a>
## "Ps Expert Disco Set - Ds MFET date change"
### Conditions:
- All:
  - **Ps Expert Disco Set - Ds MFET** has changed 
  - **Ps Expert Disco Set - Ds MFET** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template  &quot;Response to MFET Disco - Expert Set&quot;  to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Hearings to &quot;Reach out to OC in for Agreed Order (no more than 30 days); if not sent for hearing ASAP&quot;
<a id="wf-515" href="#wf-515"></a>
## "Ps Expert Disco Set - Ds MFET Hearing date changed"
### Conditions:
- All:
  - **Ps Expert Disco Set - Ds MFET Hearing** has changed 
  - **Ps Expert Disco Set - Ds MFET Hearing** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to Expert Disco Set - Ds MFET Hearing Set
- create calendar event &quot;Ds MFET Hearing re: Expert Disco Set in&quot;
<a id="wf-425" href="#wf-425"></a>
## "Ps Expert Disco Set - Served changed"
### Conditions:
- All:
  - **Ps Expert Disco Set - Served** has changed 
  - **Ps Expert Disco Set - Served** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff Discovery Status to &quot;Expert Disco Set - Served&quot;
<a id="wf-564" href="#wf-564"></a>
## "Request for Disco Update - Received changed"
### Conditions:
- All:
  - **Request for Disco Update - Received** has changed 
  - **Request for Disco Update - Received** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to Request for Disco Update - Received
