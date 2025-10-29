# Module: Cases, Section: Statuses
- <a href="#wf-107"> "On change of Stage"</a>
- <a href="#wf-648"> "ON_CHANGE of Status"</a>
- <a href="#wf-281"> "ON_CHANGE_STATUS_DATE"</a>
- <a href="#wf-742"> "Set Lock Automation = YES if Final Status changed to Buyback"</a>
- <a href="#wf-672"> "Set Lock Automation = Yes when Final status change Closed"</a>
----------------------
<a id="wf-107" href="#wf-107"></a>
## "On change of Stage"
### Conditions:
- All:
  - **Stage** has changed 
- At least one:
### Tasks:
- For each Claim: set Claim.Basic Litigation Status := Case.Stage
<a id="wf-648" href="#wf-648"></a>
## "ON_CHANGE of Status"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Status** has changed 
  - **Status** is not empty 
- At least one:
### Tasks:
- Set Status Date and Status Age
<a id="wf-281" href="#wf-281"></a>
## "ON_CHANGE_STATUS_DATE"
### Conditions:
- All:
  - **Status Date** has changed 
- At least one:
### Tasks:
- CF calculateStatusAge
<a id="wf-742" href="#wf-742"></a>
## "Set Lock Automation = YES if Final Status changed to Buyback"
### Conditions:
- All:
  - **Final Status** has changed to _Buyback_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
-  Set Lock Automation = YES
<a id="wf-672" href="#wf-672"></a>
## "Set Lock Automation = Yes when Final status change Closed"
### Conditions:
- All:
  - **Final Status** has changed to _CLOSED_ 
- At least one:
### Tasks:
- Set Lock Automation
