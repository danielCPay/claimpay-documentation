# Module: Cases, Section: Mediation Arbitration
- <a href="#wf-555"> "Arbitration - Deadline date  changed"</a>
- <a href="#wf-558"> "Arbitration Date changed (AOB)"</a>
- <a href="#wf-557"> "Arbitration Date changed (HO)"</a>
- <a href="#wf-182"> "Change of Mediation Arbitration Status"</a>
- <a href="#wf-559"> "Mediation - Deadline changed"</a>
- <a href="#wf-554"> "Mediation Arbitration change to Arbitration - Award Entered (ABO)"</a>
- <a href="#wf-553"> "Mediation Arbitration change to Arbitration - Award Entered (HO)"</a>
- <a href="#wf-556"> "Mediation Arbitration change to Arbitration - Mtn for Trial De Novo"</a>
- <a href="#wf-562"> "Mediation Arbitration change to Mediation - Settled"</a>
- <a href="#wf-561"> "Mediation Date changed (AOB)"</a>
- <a href="#wf-560"> "Mediation Date changed (HO)"</a>
----------------------
<a id="wf-555" href="#wf-555"></a>
## "Arbitration - Deadline date  changed"
### Conditions:
- All:
  - **Arbitration - Deadline** has changed 
  - **Arbitration - Deadline** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Letter to OC re Arbitration&quot; to OPPOSING_COUNSEL_EMAIL and 
- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Arbitration with OC's office in&quot;
<a id="wf-558" href="#wf-558"></a>
## "Arbitration Date changed (AOB)"
### Conditions:
- All:
  - **Arbitration Date** has changed 
  - **Arbitration Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Arbitration PROVIDER&quot; to PROVIDER_EMAIL
<a id="wf-557" href="#wf-557"></a>
## "Arbitration Date changed (HO)"
### Conditions:
- All:
  - **Arbitration Date** has changed 
  - **Arbitration Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Arbitration HO&quot; to CLIENT_EMAIL
<a id="wf-182" href="#wf-182"></a>
## "Change of Mediation Arbitration Status"
### Conditions:
- All:
  - **Mediation Arbitration Status** has changed 
  - **Mediation Arbitration Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-559" href="#wf-559"></a>
## "Mediation - Deadline changed"
### Conditions:
- All:
  - **Mediation - Deadline MA** has changed 
  - **Mediation - Deadline MA** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send email template &quot;Letter to OC re Mediation&quot; to OPPOSING_COUNSEL_EMAIL
- create task for Scheduling Team - Mediation Arbitration to &quot;Coordinate Mediation with OC's office in&quot;
<a id="wf-554" href="#wf-554"></a>
## "Mediation Arbitration change to Arbitration - Award Entered (ABO)"
### Conditions:
- All:
  - **Mediation Arbitration Status** has changed 
  - **Mediation Arbitration Status** is _Arbitration - Award Entered_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
- send email template &quot;Letter to Client - Arbitration Award PROVIDER&quot; to PROVIDER_EMAIL
- set Arbitration Award
<a id="wf-553" href="#wf-553"></a>
## "Mediation Arbitration change to Arbitration - Award Entered (HO)"
### Conditions:
- All:
  - **Mediation Arbitration Status** has changed 
  - **Mediation Arbitration Status** is _Arbitration - Award Entered_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Arbitartion Award to determine whether Mtn for Trial De Novo will be necessary in&quot;
- send email template &quot;Letter to Client - Arbitration Award HO&quot; to CLIENT_EMAIL
- set Arbitration Award
<a id="wf-556" href="#wf-556"></a>
## "Mediation Arbitration change to Arbitration - Mtn for Trial De Novo"
### Conditions:
- All:
  - **Mediation Arbitration Status** has changed 
  - **Mediation Arbitration Status** is _Arbitration - Mtn for Trial De Novo_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Mtn for Trial De Novo&quot;
<a id="wf-562" href="#wf-562"></a>
## "Mediation Arbitration change to Mediation - Settled"
### Conditions:
- All:
  - **Mediation Arbitration Status** has changed 
  - **Mediation Arbitration Status** is _Mediation - Settled_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Settlement Status to Settled - Awaiting Release
<a id="wf-561" href="#wf-561"></a>
## "Mediation Date changed (AOB)"
### Conditions:
- All:
  - **Mediation Date** has changed 
  - **Mediation Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Mediation PROVIDER&quot; to Provider_EMAIL
<a id="wf-560" href="#wf-560"></a>
## "Mediation Date changed (HO)"
### Conditions:
- All:
  - **Mediation Date** has changed 
  - **Mediation Date** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- send email template &quot;Letter to Client re Mediation HO&quot; to CLIENT_EMAIL
