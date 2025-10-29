# Module: Cases, Section: Appeal
- <a href="#wf-236"> "Appeal Status change to Notice of Appeal Filed"</a>
- <a href="#wf-187"> "Change of Appeal Status"</a>
----------------------
<a id="wf-236" href="#wf-236"></a>
## "Appeal Status change to Notice of Appeal Filed"
### Conditions:
- All:
  - **Appeal Status** has changed 
  - **Appeal Status** is _Notice of Appeal Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set date Notice of Appeal
<a id="wf-187" href="#wf-187"></a>
## "Change of Appeal Status"
### Conditions:
- All:
  - **Appeal Status** has changed 
  - **Appeal Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
