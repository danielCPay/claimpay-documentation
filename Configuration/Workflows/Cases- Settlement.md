# Module: Cases, Section: Settlement
- <a href="#wf-186"> "Change of Settlement Status"</a>
- <a href="#wf-652"> "Copy AOB/DTP Attorney to Demand Sender"</a>
- <a href="#wf-665"> "Set Fees and Costs"</a>
- <a href="#wf-262"> "Settlement Status change to Motion to Compel Settlement"</a>
- <a href="#wf-260"> "Settlement Status change to SETTLED &amp; PAID"</a>
- <a href="#wf-252"> "Settlement Status change to SETTLED &amp; PAID - Benefits Only - Pending Fees"</a>
- <a href="#wf-253"> "Settlement Status change to SETTLED &amp; PAID - Fees Only - Pending Benefits"</a>
- <a href="#wf-568"> "Settlement Status change to SETTLED &amp; PAID - Global"</a>
- <a href="#wf-261"> "Settlement Status change to SETTLED &amp; PAID - Presuit w Fees"</a>
- <a href="#wf-275"> "Settlement Status change to SETTLED - Awaiting Release (AOB)"</a>
- <a href="#wf-239"> "Settlement Status change to SETTLED - Awaiting Release (HO)"</a>
- <a href="#wf-249"> "Settlement Status change to SETTLED - Executed Release Sent"</a>
- <a href="#wf-243"> "Settlement Status change to SETTLED - Global Awaiting Release"</a>
- <a href="#wf-251"> "Settlement Status change to SETTLED - Global Executed Release Sent"</a>
- <a href="#wf-246"> "Settlement Status change to SETTLED - Global Release Sent to Client"</a>
- <a href="#wf-244"> "Settlement Status change to SETTLED - Proposed Release Rcvd"</a>
- <a href="#wf-247"> "Settlement Status change to SETTLED - Release Sent to Client"</a>
- <a href="#wf-732"> "Settlement Status change to Settlement Negotiation - Offer Received"</a>
- <a href="#wf-255"> "Settlement Status change to Settlement Payment Reminder Letter"</a>
- <a href="#wf-256"> "Settlement Status change to Settlement Payment Reminder Letter - 2"</a>
- <a href="#wf-258"> "Settlement Status change to Settlement Payment Reminder Letter - Final"</a>
- <a href="#wf-250"> "Status SETTLED - Executed Release Sent  does not change within 45 days"</a>
- <a href="#wf-248"> "Status SETTLED - Release Sent to Client  does not change within 15 days"</a>
- <a href="#wf-254"> "Status Settlement Payment Reminder Letter  does not change within 14 days"</a>
- <a href="#wf-257"> "Status Settlement Payment Reminder Letter - 2  does not change within 14 days"</a>
- <a href="#wf-259"> "Status Settlement Payment Reminder Letter - Final  does not change within 14 days"</a>
- <a href="#wf-641"> "Update Total Settlement"</a>
----------------------
<a id="wf-186" href="#wf-186"></a>
## "Change of Settlement Status"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-652" href="#wf-652"></a>
## "Copy AOB/DTP Attorney to Demand Sender"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Stage** has changed to _Settlement_ 
- At least one:
### Tasks:
- Set AOB/DTP Attorney to Demand Sender
<a id="wf-665" href="#wf-665"></a>
## "Set Fees and Costs"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Attorney Fee** has changed 
  - **Settlement Costs** has changed 
### Tasks:
- Set Fees and Costs = Attorney Fee + Settlement Cost
<a id="wf-262" href="#wf-262"></a>
## "Settlement Status change to Motion to Compel Settlement"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _Motion to Compel Settlement_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Create &quot;Motion to Compel Settlement&quot;
- send &quot;Motion to Compel Settlement&quot; to Peru Queue for filing
- Create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Plaintiff's Motion to Compel Settlement in&quot;
- set Motion to Compel Settlement
<a id="wf-260" href="#wf-260"></a>
## "Settlement Status change to SETTLED &amp; PAID"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED &amp; PAID_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Settlement Payment Received
- Create &quot;Voluntary Dismissal with Prejudice&quot;
- create Task for Peru Team to &quot;Voluntary Dismissal with Prejudice - send filing&quot; 
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
<a id="wf-252" href="#wf-252"></a>
## "Settlement Status change to SETTLED &amp; PAID - Benefits Only - Pending Fees"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED &amp; PAID - Benefits Only - Pending Fees_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;F/U with OC regarding Fees Check&quot;
<a id="wf-253" href="#wf-253"></a>
## "Settlement Status change to SETTLED &amp; PAID - Fees Only - Pending Benefits"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED &amp; PAID - Fees Only - Pending Benefits_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;F/U with OC regarding Benefits Check&quot;
<a id="wf-568" href="#wf-568"></a>
## "Settlement Status change to SETTLED &amp; PAID - Global"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED &amp; PAID - Global_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
<a id="wf-261" href="#wf-261"></a>
## "Settlement Status change to SETTLED &amp; PAID - Presuit w Fees"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED &amp; PAID - Presuit w Fees_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Supervisor to &quot;Review file to determine if file can be Closed in&quot;
<a id="wf-275" href="#wf-275"></a>
## "Settlement Status change to SETTLED - Awaiting Release (AOB)"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Awaiting Release_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _AOB_ 
- At least one:
### Tasks:
- Create &quot;Notice of Settlement PROVIDER&quot;
- send documents to Peru Queue for filing
- ~Send e-mail template  &quot;Settlement Email - OC&quot; to OPPOSING_COUNSEL_EMAIL~
- ~Send e-mail template &quot;Settlement Email - PROVIDER&quot; to PROVIDER_EMAIL~
- set Settlement Date
<a id="wf-239" href="#wf-239"></a>
## "Settlement Status change to SETTLED - Awaiting Release (HO)"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Awaiting Release_ 
  - **Lock Automation** is _0_ 
  - **Type of Claim** is _HO_ 
- At least one:
### Tasks:
- set Settlement Date
- Create &quot;Notice of Settlement HO&quot;
- send documents to Peru Queue for filing
<a id="wf-249" href="#wf-249"></a>
## "Settlement Status change to SETTLED - Executed Release Sent"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Executed Release Sent_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Executed Release Sent to OC
<a id="wf-243" href="#wf-243"></a>
## "Settlement Status change to SETTLED - Global Awaiting Release"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Global Awaiting Release_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Settlement Date
<a id="wf-251" href="#wf-251"></a>
## "Settlement Status change to SETTLED - Global Executed Release Sent"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Global Executed Release Sent_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Executed Release Sent to OC
<a id="wf-246" href="#wf-246"></a>
## "Settlement Status change to SETTLED - Global Release Sent to Client"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Global Release Sent to Client_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Release Sent to Client
<a id="wf-244" href="#wf-244"></a>
## "Settlement Status change to SETTLED - Proposed Release Rcvd"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Proposed Release Rcvd_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Create task for Assigned Attorney to &quot;Review Proposed Release and send to Client in&quot;
<a id="wf-247" href="#wf-247"></a>
## "Settlement Status change to SETTLED - Release Sent to Client"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _SETTLED - Release Sent to Client_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Release Sent to Client
<a id="wf-732" href="#wf-732"></a>
## "Settlement Status change to Settlement Negotiation - Offer Received"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Settlement Status** has changed to _Settlement Negotiation - Offer Received_ 
- At least one:
### Tasks:
- create Task for Assigned Attorney to &quot;Send counter-offer to client and respond to OC in&quot; 
<a id="wf-255" href="#wf-255"></a>
## "Settlement Status change to Settlement Payment Reminder Letter"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _Settlement Payment Reminder Letter_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Settlement Payment Reminder&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-256" href="#wf-256"></a>
## "Settlement Status change to Settlement Payment Reminder Letter - 2"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _Settlement Payment Reminder Letter - 2_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
-  e-mail template &quot;Settlement Payment Reminder Letter - 2&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-258" href="#wf-258"></a>
## "Settlement Status change to Settlement Payment Reminder Letter - Final"
### Conditions:
- All:
  - **Settlement Status** has changed 
  - **Settlement Status** is _Settlement Payment Reminder Letter - Final_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- send e-mail template &quot;Settlement Payment Reminder - FINAL&quot; to OPPOSING_COUNSEL_EMAI
<a id="wf-250" href="#wf-250"></a>
## "Status SETTLED - Executed Release Sent  does not change within 45 days"
### Conditions:
- All:
  - **Status** is _SETTLED - Executed Release Sent_ 
  - **Status Age** equal to _45_ 
  - **Lock Automation** is _0_ 
  - **Stage** is _Settlement_ 
- At least one:
### Tasks:
- change status to &quot;Settlement Payment Reminder Letter&quot;
<a id="wf-248" href="#wf-248"></a>
## "Status SETTLED - Release Sent to Client  does not change within 15 days"
### Conditions:
- All:
  - **Status** is _SETTLED - Release Sent to Client_ 
  - **Status Age** equal to _15_ 
  - **Lock Automation** is _0_ 
  - **Stage** is _Settlement_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Follow up with client regarding Release&quot;
<a id="wf-254" href="#wf-254"></a>
## "Status Settlement Payment Reminder Letter  does not change within 14 days"
### Conditions:
- All:
  - **Status** is _Settlement Payment Reminder Letter_ 
  - **Status Age** equal to _14_ 
  - **Lock Automation** is _0_ 
  - **Stage** is _Settlement_ 
- At least one:
### Tasks:
- change Settlement Status to &quot;Settlement Payment Reminder Letter - 2&quot;
<a id="wf-257" href="#wf-257"></a>
## "Status Settlement Payment Reminder Letter - 2  does not change within 14 days"
### Conditions:
- All:
  - **Status** is _Settlement Payment Reminder Letter - 2_ 
  - **Status Age** equal to _14_ 
  - **Lock Automation** is _0_ 
  - **Stage** is _Settlement_ 
- At least one:
### Tasks:
- change status to &quot;Settlement Payment Reminder Letter - Final&quot;
<a id="wf-259" href="#wf-259"></a>
## "Status Settlement Payment Reminder Letter - Final  does not change within 14 days"
### Conditions:
- All:
  - **Status** is _Settlement Payment Reminder Letter - Final_ 
  - **Status Age** equal to _14_ 
  - **Lock Automation** is _0_ 
  - **Stage** is _Settlement_ 
- At least one:
### Tasks:
- change Settlement Status to &quot;Motion to Compel Settlement&quot;
<a id="wf-641" href="#wf-641"></a>
## "Update Total Settlement"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Attorney Fee** has changed 
  - **Settlement Amount** has changed 
  - **Settlement Costs** has changed 
### Tasks:
- set Total Settlement=Settlement Amount + Attorney Fee + Settlement Costs
