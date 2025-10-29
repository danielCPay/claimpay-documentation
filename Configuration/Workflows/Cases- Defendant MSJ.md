# Module: Cases, Section: Defendant MSJ
- <a href="#wf-184"> "Change of Defendant MSJ Status"</a>
- <a href="#wf-235"> "Defendant MSJ Status change to Ds MSJ Denied"</a>
- <a href="#wf-230"> "Defendant MSJ Status change to Ds MSJ Received"</a>
- <a href="#wf-232"> "Defendant MSJ Status change to Ps Response to MSJ Drafted"</a>
- <a href="#wf-233"> "Defendant MSJ Status change to Ps Response to MSJ Filed"</a>
- <a href="#wf-234"> "Defendant MSJ Status change toDs MSJ Granted"</a>
- <a href="#wf-231"> "Ds MSJ Hearing Date changed"</a>
----------------------
<a id="wf-184" href="#wf-184"></a>
## "Change of Defendant MSJ Status"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-235" href="#wf-235"></a>
## "Defendant MSJ Status change to Ds MSJ Denied"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is _Ds MSJ Denied_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ds MSJ
<a id="wf-230" href="#wf-230"></a>
## "Defendant MSJ Status change to Ds MSJ Received"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is _Ds MSJ Received_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Ds MSJ Received
- create task for ASSIGNED ATTORNEY to &quot;Review Ds MSJ and Draft Response in&quot;
<a id="wf-232" href="#wf-232"></a>
## "Defendant MSJ Status change to Ps Response to MSJ Drafted"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is _Ps Response to MSJ Drafted_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for LEGAL ASSISTANT to &quot;File Ps Response to Ds MSJ in&quot;
<a id="wf-233" href="#wf-233"></a>
## "Defendant MSJ Status change to Ps Response to MSJ Filed"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is _Ps Response to MSJ Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Ps Response to MSJ Filed
<a id="wf-234" href="#wf-234"></a>
## "Defendant MSJ Status change toDs MSJ Granted"
### Conditions:
- All:
  - **Defendant MSJ Status** has changed 
  - **Defendant MSJ Status** is _Ds MSJ Granted_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ds MSJ
- create task for ASSIGNED ATTORNEY to &quot;Review Order Granting Ds MSJ and determine whether there are grounds for appeal in&quot;
<a id="wf-231" href="#wf-231"></a>
## "Ds MSJ Hearing Date changed"
### Conditions:
- All:
  - **Ds MSJ Hearing Date** has changed 
  - **Ds MSJ Hearing Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set  Defendant MSJ Status to Ds MSJ Set for Hearing, set Ps Response to MSJ Due to  21 days before date in Ds MSJ Hearing Date
