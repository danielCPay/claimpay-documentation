# Module: Cases, Section: Defendant Deposition
- <a href="#wf-570"> "1 day before Depo of Plaintiff Date create task for Attorney (User)"</a>
- <a href="#wf-574"> "1 day before Insured Depo Date create task for Attorney (User)"</a>
- <a href="#wf-572"> "1 day before Ps Engineer Depo Date create task for Attorney (User)"</a>
- <a href="#wf-573"> "1 day before Ps Insurance Expert Depo Date create task for Attorney (User)"</a>
- <a href="#wf-575"> "1 day before Ps Pricing Expert Depo Date create task for Attorney (User)"</a>
- <a href="#wf-181"> "Change of Defendant Deposition Status"</a>
- <a href="#wf-317"> "Defendant Deposition change to Plaintiff Depo - Requested (AOB)"</a>
- <a href="#wf-322"> "Defendant Deposition change to Plaintiff Depo - Requested (HO)"</a>
- <a href="#wf-321"> "Defendant Deposition Status change to Engineer Expert Depo - Requested"</a>
- <a href="#wf-326"> "Defendant Deposition Status change to Ins Expert Depo - Requested"</a>
- <a href="#wf-330"> "Defendant Deposition Status change to Insured Depo - Requested"</a>
- <a href="#wf-334"> "Defendant Deposition Status change to Pricing Expert Depo - Requested"</a>
- <a href="#wf-571"> "Depo of Plaintiff Date changed (AOB)"</a>
- <a href="#wf-318"> "Depo of Plaintiff Date changed (HO)"</a>
- <a href="#wf-331"> "Insured Depo Date changed"</a>
- <a href="#wf-323"> "Ps Engineer Depo Date changed"</a>
- <a href="#wf-327"> "Ps Insurance Expert Depo Date changed"</a>
- <a href="#wf-319"> "Ps MPO (Engineer) changed"</a>
- <a href="#wf-324"> "Ps MPO (Ins Expert) changed"</a>
- <a href="#wf-328"> "Ps MPO (Insured) changed"</a>
- <a href="#wf-315"> "Ps MPO (Plaintiff) changed"</a>
- <a href="#wf-332"> "Ps MPO (Pricing Expert) changed"</a>
- <a href="#wf-335"> "Ps Pricing Expert Depo Date changed"</a>
----------------------
<a id="wf-570" href="#wf-570"></a>
## "1 day before Depo of Plaintiff Date create task for Attorney (User)"
### Conditions:
- All:
  - **Depo of Plaintiff Date** is not empty 
  - **Depo of Plaintiff Date** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Depo of Plaintiff Date create task for Assigned Attorney &quot;Prepare for Deposition of Plaintiff&quot;
<a id="wf-574" href="#wf-574"></a>
## "1 day before Insured Depo Date create task for Attorney (User)"
### Conditions:
- All:
  - **Insured Depo Date** is not empty 
  - **Insured Depo Date** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Insured Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of Insured in&quot;
<a id="wf-572" href="#wf-572"></a>
## "1 day before Ps Engineer Depo Date create task for Attorney (User)"
### Conditions:
- All:
  - **Ps Engineer Depo Date** is not empty 
  - **Ps Engineer Depo Date** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Engineer Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Engineer in&quot;
<a id="wf-573" href="#wf-573"></a>
## "1 day before Ps Insurance Expert Depo Date create task for Attorney (User)"
### Conditions:
- All:
  - **Ps Insurance Expert Depo Date** is not empty 
  - **Ps Insurance Expert Depo Date** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Insurance Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Ins Expert in&quot;
<a id="wf-575" href="#wf-575"></a>
## "1 day before Ps Pricing Expert Depo Date create task for Attorney (User)"
### Conditions:
- All:
  - **Ps Pricing Expert Depo Date** is not empty 
  - **Ps Pricing Expert Depo Date** days later _1_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- 1 day before Ps Pricing Expert Depo Date create task for Assigned Attorney &quot;Prepare for Deposition of P's Pricing Expert in&quot;
<a id="wf-181" href="#wf-181"></a>
## "Change of Defendant Deposition Status"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-317" href="#wf-317"></a>
## "Defendant Deposition change to Plaintiff Depo - Requested (AOB)"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Plaintiff Depo - Requested_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) PROVIDER&quot; to PROVIDER_EMAIL
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
<a id="wf-322" href="#wf-322"></a>
## "Defendant Deposition change to Plaintiff Depo - Requested (HO)"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Plaintiff Depo - Requested_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- send E-Mail Email Template &quot;Request for Dates of Availability (Plaintiff) HO&quot; to CLIENT_EMAIL
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Plaintiff in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition Plaintiff for Possible MPO in&quot;
<a id="wf-321" href="#wf-321"></a>
## "Defendant Deposition Status change to Engineer Expert Depo - Requested"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Engineer Expert Depo - Requested_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Engineer in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Engineer) for Possible MPO in&quot;
<a id="wf-326" href="#wf-326"></a>
## "Defendant Deposition Status change to Ins Expert Depo - Requested"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Ins Expert Depo - Requested_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Ins Expert in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Ins Expert) for Possible MPO in&quot;
<a id="wf-330" href="#wf-330"></a>
## "Defendant Deposition Status change to Insured Depo - Requested"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Insured Depo - Requested_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of Insured in&quot;
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Insured) for Possible MPO in&quot;
<a id="wf-334" href="#wf-334"></a>
## "Defendant Deposition Status change to Pricing Expert Depo - Requested"
### Conditions:
- All:
  - **Defendant Deposition Status** has changed 
  - **Defendant Deposition Status** is _Pricing Expert Depo - Requested_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depositions to &quot;Coordinate Depo of P's Pricing Expert in&quot; 
- create task for Assigned Attorney &quot;Review Notice of Taking Deposition (Pricing Expert) for Possible MPO in&quot;
<a id="wf-571" href="#wf-571"></a>
## "Depo of Plaintiff Date changed (AOB)"
### Conditions:
- All:
  - **Depo of Plaintiff Date** has changed 
  - **Depo of Plaintiff Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
- send email template &quot;Plaintiff Depo Set PROVIDER&quot; to PROVIDER_EMAIL
- Set Defendant Deposition Status to Plaintiff Depo - Set
<a id="wf-318" href="#wf-318"></a>
## "Depo of Plaintiff Date changed (HO)"
### Conditions:
- All:
  - **Depo of Plaintiff Date** has changed 
  - **Depo of Plaintiff Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- add calendar event Assigned and Case Manager &quot;Deposition of Plaintiff in&quot;
- send email template &quot;Plaintiff Depo Set HO&quot; to CLIENT_EMAIL
- Set Defendant Deposition Status to Plaintiff Depo - Set
<a id="wf-331" href="#wf-331"></a>
## "Insured Depo Date changed"
### Conditions:
- All:
  - **Insured Depo Date** has changed 
  - **Insured Depo Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of Insured in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to Insured in&quot;
- Set Defendant Deposition Status to  Insured Depo - Set
<a id="wf-323" href="#wf-323"></a>
## "Ps Engineer Depo Date changed"
### Conditions:
- All:
  - **Ps Engineer Depo Date** has changed 
  - **Ps Engineer Depo Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Engineer in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Engineer in&quot;
- Set Defendant Deposition Status to Engineer Expert Depo - Set
<a id="wf-327" href="#wf-327"></a>
## "Ps Insurance Expert Depo Date changed"
### Conditions:
- All:
  - **Ps Insurance Expert Depo Date** has changed 
  - **Ps Insurance Expert Depo Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Ins Expert in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Ins Expert in&quot;
- Set Defendant Deposition Status to Ins Expert Depo - Set
<a id="wf-319" href="#wf-319"></a>
## "Ps MPO (Engineer) changed"
### Conditions:
- All:
  - **Ps MPO (Engineer)** has changed 
  - **Ps MPO (Engineer)** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Engineer) in&quot; 
- change  Defendant Deposition status to &quot;Engineer Depo - MPO Filed&quot;
<a id="wf-324" href="#wf-324"></a>
## "Ps MPO (Ins Expert) changed"
### Conditions:
- All:
  - **Ps MPO (Ins Expert)** is not empty 
  - **Ps MPO (Ins Expert)** has changed 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (P Ins Expert) in&quot;
- set Defendant Deposition Status to Ins Expert Depo - MPO Filed
<a id="wf-328" href="#wf-328"></a>
## "Ps MPO (Insured) changed"
### Conditions:
- All:
  - **Ps MPO (Insured)** has changed 
  - **Ps MPO (Insured)** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Insured) in&quot; 
- Set Defendant Deposition Status to Insured Depo - MPO Filed 
<a id="wf-315" href="#wf-315"></a>
## "Ps MPO (Plaintiff) changed"
### Conditions:
- All:
  - **Ps MPO (Plaintiff)** has changed 
  - **Ps MPO (Plaintiff)** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Plaintiff) in&quot;
- Set Defendant Deposition Status to Plaintiff Depo - MPO Filed
<a id="wf-332" href="#wf-332"></a>
## "Ps MPO (Pricing Expert) changed"
### Conditions:
- All:
  - **Ps MPO (Pricing Expert)** is not empty 
  - **Ps MPO (Pricing Expert)** has changed 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create a task for Scheduling Team - Hearings to &quot;Coordinate hearing on Ps Motion for Protective Order (Ps Pricing Expert) in&quot; 
- change Defendant Deposition Satatus to &quot;Pricing Expert Depo - MPO Filed&quot;
<a id="wf-335" href="#wf-335"></a>
## "Ps Pricing Expert Depo Date changed"
### Conditions:
- All:
  - **Ps Pricing Expert Depo Date** has changed 
  - **Ps Pricing Expert Depo Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add calendar event to Assigned and Case Manager &quot;Deposition of P's Pricing Expert in&quot;
- create task for Scheduling Team - Depositions to &quot;Send calendar invite and confirmation email to P's Pricing Expert in&quot;
- Set  Defendant Deposition Status to Pricing Expert Depo - Set
