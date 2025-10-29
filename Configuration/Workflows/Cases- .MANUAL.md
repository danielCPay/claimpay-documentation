# Module: Cases, Section: .Manual
- <a href="#wf-622"> "Assign a Case Manager to Shared with"</a>
- <a href="#wf-666"> "DOTS: Copy PDC Case ID to Case ID"</a>
- <a href="#wf-833"> "EXTREME CAUTION! Copy PMC Case ID to Case ID"</a>
- <a href="#wf-388"> "Find County"</a>
- <a href="#wf-631"> "Find Similar Cases"</a>
- <a href="#wf-723"> "Generate again Notice of Settlement HO document"</a>
- <a href="#wf-467"> "Recalculate"</a>
- <a href="#wf-707"> "Recalculate Demand"</a>
- <a href="#wf-701"> "Revert to Previous Status"</a>
- <a href="#wf-715"> "Send again 10-day Demand Letter Package"</a>
- <a href="#wf-651"> "Set Court "</a>
----------------------
<a id="wf-622" href="#wf-622"></a>
## "Assign a Case Manager to Shared with"
### Conditions:
- All:
- At least one:
### Tasks:
- Copy &quot;Case Manager&quot; to &quot;Share with users&quot;
<a id="wf-666" href="#wf-666"></a>
## "DOTS: Copy PDC Case ID to Case ID"
### Conditions:
- All:
  - **PDC Case ID** is not empty 
- At least one:
  - **current-role** is _DOTS (H46)_ 
  - **current-role** is _Board of Management (H2)_ 
### Tasks:
- copy PDC Case ID to Case ID
<a id="wf-833" href="#wf-833"></a>
## "EXTREME CAUTION! Copy PMC Case ID to Case ID"
### Conditions:
- All:
  - **PMC Case ID** is not empty 
  - **Lock Automation** is not _1_ 
- At least one:
### Tasks:
- update Case ID from PMC Case ID
<a id="wf-388" href="#wf-388"></a>
## "Find County"
### Conditions:
- All:
- At least one:
### Tasks:
- WF Insured.findCounty
<a id="wf-631" href="#wf-631"></a>
## "Find Similar Cases"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- CF findSimilarCases
<a id="wf-723" href="#wf-723"></a>
## "Generate again Notice of Settlement HO document"
### Conditions:
- All:
- At least one:
### Tasks:
- Create &quot;Notice of Settlement HO&quot;
- send documents to Peru Queue for filing
- set Settlement Date
<a id="wf-467" href="#wf-467"></a>
## "Recalculate"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- call CF recalculateAll
<a id="wf-707" href="#wf-707"></a>
## "Recalculate Demand"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Demand % ** is not empty 
  - **Demand based off** is not empty 
- At least one:
### Tasks:
- call recalculateAll
- call recalculateSettlementNegotiations
<a id="wf-701" href="#wf-701"></a>
## "Revert to Previous Status"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- call revertToPreviousStatus
<a id="wf-715" href="#wf-715"></a>
## "Send again 10-day Demand Letter Package"
### Conditions:
- All:
- At least one:
### Tasks:
- Generate package &quot;10-day Demand Letter Package&quot;
- set 10-Day Demand Sent
-  create tasks when a 10-day demand package for &quot;Universal Property &amp;amp; Casualty Insurance Company&quot; is created
<a id="wf-651" href="#wf-651"></a>
## "Set Court "
### Conditions:
- All:
  - **Total Balance** greater than _0_ 
  - **Lock Automation** is _0_ 
  - **County** is not empty 
- At least one:
### Tasks:
- Set Court 
