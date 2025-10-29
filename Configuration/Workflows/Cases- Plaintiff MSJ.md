# Module: Cases, Section: Plaintiff MSJ
- <a href="#wf-183"> "Change of Plaintiff MSJ Status"</a>
- <a href="#wf-227"> "Plaintiff MSJ Status change to Ds Response to MSJ Received"</a>
- <a href="#wf-229"> "Plaintiff MSJ Status change to Ps MSJ Denied"</a>
- <a href="#wf-224"> "Plaintiff MSJ Status change to Ps MSJ Drafted"</a>
- <a href="#wf-225"> "Plaintiff MSJ Status change to Ps MSJ Filed"</a>
- <a href="#wf-228"> "Plaintiff MSJ Status change to Ps MSJ Granted"</a>
- <a href="#wf-226"> "Ps MSJ Hearing Date changed"</a>
----------------------
<a id="wf-183" href="#wf-183"></a>
## "Change of Plaintiff MSJ Status"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is not empty 
- At least one:
### Tasks:
- Update  Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-227" href="#wf-227"></a>
## "Plaintiff MSJ Status change to Ds Response to MSJ Received"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is _Ds Response to MSJ Received_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Ds Response to MSJ Received
- create task for Assigned Attorney to &quot;Review Ds Response to Ps MSJ in&quot;
<a id="wf-229" href="#wf-229"></a>
## "Plaintiff MSJ Status change to Ps MSJ Denied"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is _Ps MSJ Denied_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ps MSJ
- create task for ASSIGNED ATTORNEY to &quot;Review Order Denying Ps MSJ in&quot;
<a id="wf-224" href="#wf-224"></a>
## "Plaintiff MSJ Status change to Ps MSJ Drafted"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is _Ps MSJ Drafted_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Ps MSJ Drafted
<a id="wf-225" href="#wf-225"></a>
## "Plaintiff MSJ Status change to Ps MSJ Filed"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is _Ps MSJ Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Ps MSJ Filed
- create task for Scheduling Team - Hearings to &quot;Coordinate Special Set Hearing on Ps MSJ within the next 45-60 days in&quot;
<a id="wf-228" href="#wf-228"></a>
## "Plaintiff MSJ Status change to Ps MSJ Granted"
### Conditions:
- All:
  - **Plaintiff MSJ Status** has changed 
  - **Plaintiff MSJ Status** is _Ps MSJ Granted_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Order on Ps MSJ
- create task for ASSIGNED ATTORNEY to &quot;Draft Motion for Entitlement to Attorney's Fees and Costs in&quot;
<a id="wf-226" href="#wf-226"></a>
## "Ps MSJ Hearing Date changed"
### Conditions:
- All:
  - **Ps MSJ Hearing Date** has changed 
  - **Ps MSJ Hearing Date** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Plaintiff MSJ Status to Ps MSJ Set for Hearing, Ds Response to MSJ Due to  20 days before date in Ps MSJ Hearing Date
