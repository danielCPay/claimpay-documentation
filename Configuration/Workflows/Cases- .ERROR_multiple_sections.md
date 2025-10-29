# Module: Cases, Section: .ERROR_multiple_sections
- <a href="#wf-690"> "Generate Pre-Suit Demand Package"</a>
- <a href="#wf-659"> "ON_CHANGE Case financial parameters"</a>
- <a href="#wf-859"> "Recalculate Similar Cases"</a>
- <a href="#wf-620"> "Remove white chars on Policy Number and Claim Number"</a>
- <a href="#wf-851"> "Set Lock Automation = yes (Confession of Judgment Granted, Do not File-anti AOB clause)"</a>
- <a href="#wf-600"> "Testy generacji pakietu i wysyłki do dropbox"</a>
----------------------
<a id="wf-690" href="#wf-690"></a>
## "Generate Pre-Suit Demand Package"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Case ID** starts with _PDC_ 
  - **Pre-Litigation Status** is _Presuit - Demand Sent_ 
- At least one:
### Tasks:
- Create Package "Pre-Suit Demand"
- add task for PDC Pre-Suit to &quot;Follow up with Adjuster regarding Pre-Suit Demand&quot;
- Update Pre-Suit Demand Sent
<a id="wf-659" href="#wf-659"></a>
## "ON_CHANGE Case financial parameters"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Attorney Fees (Demand Letter)** has changed 
  - **Total Balance** has changed 
  - **Total Partial Settlements** has changed 
  - **Total Bill Amount** has changed 
### Tasks:
- call CF recalculateFromCase
<a id="wf-859" href="#wf-859"></a>
## "Recalculate Similar Cases"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Total Collections** has changed 
  - **Adjusted Face Value** has changed 
  - **Total Balance** has changed 
  - **Claim Number** has changed 
  - **Hurdle** has changed 
### Tasks:
- Call recalculateOthers
<a id="wf-620" href="#wf-620"></a>
## "Remove white chars on Policy Number and Claim Number"
### Conditions:
- All:
- At least one:
  - **Policy Number** has changed 
  - **Claim Number** has changed 
### Tasks:
- Remove white chars on Policy Number and all non-alphanumeric from Claim Number
<a id="wf-851" href="#wf-851"></a>
## "Set Lock Automation = yes (Confession of Judgment Granted, Do not File-anti AOB clause)"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Pre-Litigation Status** has changed to _Do not File-anti AOB clause_ 
  - **Complaint Status** has changed to _Confession of Judgment Granted_ 
### Tasks:
- Set Lock Automation = YES
<a id="wf-600" href="#wf-600"></a>
## "Testy generacji pakietu i wysyłki do dropbox"
### Conditions:
- All:
  - **current-role** is _DOTS (H46)_ 
  - **Total Balance** has changed 
- At least one:
### Tasks:
- ~generuj dokument z pakietu~
