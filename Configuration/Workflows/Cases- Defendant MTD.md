# Module: Cases, Section: Defendant MTD
- <a href="#wf-721"> "Change of Defendant MTD Status"</a>
- <a href="#wf-722"> "Order on Ds MTD changed to an option that closes the case"</a>
----------------------
<a id="wf-721" href="#wf-721"></a>
## "Change of Defendant MTD Status"
### Conditions:
- All:
  - **Defendant MTD Status** has changed 
  - **Defendant MTD Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-722" href="#wf-722"></a>
## "Order on Ds MTD changed to an option that closes the case"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Order on Ds MTD** has changed 
- At least one:
  - **Order on Ds MTD** has changed to _MTD Granted With Prejudice_ 
  - **Order on Ds MTD** has changed to _MTD Granted Without Prejudice-No Leave to Amend_ 
### Tasks:
- Close the case, lock automation
