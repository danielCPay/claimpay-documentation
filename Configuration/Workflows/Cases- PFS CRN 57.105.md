# Module: Cases, Section: PFS CRN 57.105
- <a href="#wf-543"> "Change of PFS CRN 57.105 Status"</a>
- <a href="#wf-545"> "PFS CRN 57.105 change to CRN Filed"</a>
- <a href="#wf-546"> "PFS CRN 57.105 change to CRN Ready"</a>
- <a href="#wf-549"> "PFS CRN 57.105 change to PROVIDER PFS Ready"</a>
- <a href="#wf-550"> "PFS CRN 57.105 change to PROVIDER PFS Served"</a>
- <a href="#wf-548"> "PFS Received date changed (AOB)"</a>
- <a href="#wf-547"> "PFS Received date changed (HO)"</a>
- <a href="#wf-544"> "Safe Harbor Letter Received date changed (AOB)"</a>
- <a href="#wf-542"> "Safe Harbor Letter Received date changed (HO)"</a>
----------------------
<a id="wf-543" href="#wf-543"></a>
## "Change of PFS CRN 57.105 Status"
### Conditions:
- All:
  - **PFS CRN 57.105 Status** has changed 
  - **PFS CRN 57.105 Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-545" href="#wf-545"></a>
## "PFS CRN 57.105 change to CRN Filed"
### Conditions:
- All:
  - **PFS CRN 57.105 Status** has changed 
  - **PFS CRN 57.105 Status** is _CRN Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set CRN Filed
<a id="wf-546" href="#wf-546"></a>
## "PFS CRN 57.105 change to CRN Ready"
### Conditions:
- All:
  - **PFS CRN 57.105 Status** has changed 
  - **PFS CRN 57.105 Status** is _CRN Ready_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;Upload completed CRN on CFO Website in&quot;
<a id="wf-549" href="#wf-549"></a>
## "PFS CRN 57.105 change to PROVIDER PFS Ready"
### Conditions:
- All:
  - **PFS CRN 57.105 Status** has changed 
  - **PFS CRN 57.105 Status** is _PROVIDER PFS Ready_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;File Notice of PFS and E-Mail PFS Package to OC in&quot;
<a id="wf-550" href="#wf-550"></a>
## "PFS CRN 57.105 change to PROVIDER PFS Served"
### Conditions:
- All:
  - **PFS CRN 57.105 Status** has changed 
  - **PFS CRN 57.105 Status** is _PROVIDER PFS Served_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set PFS Served
<a id="wf-548" href="#wf-548"></a>
## "PFS Received date changed (AOB)"
### Conditions:
- All:
  - **PFS Received** has changed 
  - **PFS Received** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
- send email teplate &quot;PFS Letter PROVIDER&quot; to PROVIDER_EMAIL
- send email template &quot;Request for Explanation PFS PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
- Set PFS CRN 57.105 Status to PFS Received
<a id="wf-547" href="#wf-547"></a>
## "PFS Received date changed (HO)"
### Conditions:
- All:
  - **PFS Received** has changed 
  - **PFS Received** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review PFS received in&quot;
- send email teplate &quot;PFS Letter HO&quot; to CLIENT_EMAIL
- send email template &quot;Request for Explanation PFS HO&quot; to OPPOSING_COUNSEL_EMAIL AND 
- 25 days after date in &quot;PFS Received&quot; create calendar event  for Assigned and Case Manager: &quot;Deadline to respond to PFS in&quot;
- Set PFS CRN 57.105 Status to PFS Received
<a id="wf-544" href="#wf-544"></a>
## "Safe Harbor Letter Received date changed (AOB)"
### Conditions:
- All:
  - **Safe Harbor Letter Received** has changed 
  - **Safe Harbor Letter Received** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
- send email teplate &quot;Safe Harbor Letter PROVIDER&quot; to PROVIDER_EMAIL
- send email template &quot;Request for Explanation 57.105 PROVIDER&quot; to OPPOSING_COUNSEL_EMAIL
- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager: &quot;Safe Harbor Deadline in&quot;
- Set PFS CRN 57.105 Status to 57.105 Received
<a id="wf-542" href="#wf-542"></a>
## "Safe Harbor Letter Received date changed (HO)"
### Conditions:
- All:
  - **Safe Harbor Letter Received** has changed 
  - **Safe Harbor Letter Received** is not empty 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Review Safe Haror Letter received in&quot;
- send email teplate &quot;Safe Harbor Letter HO&quot; to CLIENT_EMAIL
- send email template &quot;Request for Explanation 57.105 HO&quot; to OPPOSING_COUNSEL_EMAIL
- 19 days after date in &quot;Safe Harbor Letter Received&quot; create calendar event for Assigned and Case Manager &quot;Safe Harbor Deadline in&quot;
- Set PFS CRN 57.105 Status to 57.105 Received
