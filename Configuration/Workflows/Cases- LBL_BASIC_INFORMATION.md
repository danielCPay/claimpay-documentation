# Module: Cases, Section: LBL_BASIC_INFORMATION
- <a href="#wf-858"> "Fill Cases-Same Claim Number if Simmilar Case changed"</a>
- <a href="#wf-626"> "On change of County set Court"</a>
- <a href="#wf-354"> "on change of Provider"</a>
- <a href="#wf-754"> "ON_CHANGE Type of Claim to FIGA - lock automation"</a>
----------------------
<a id="wf-858" href="#wf-858"></a>
## "Fill Cases-Same Claim Number if Simmilar Case changed"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Similar Cases** has changed 
- At least one:
### Tasks:
- Recalculate All
<a id="wf-626" href="#wf-626"></a>
## "On change of County set Court"
### Conditions:
- All:
  - **Total Balance** greater than _0_ 
  - **County** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
  - **County** has changed 
### Tasks:
- Set Court 
<a id="wf-354" href="#wf-354"></a>
## "on change of Provider"
### Conditions:
- All:
  - **Provider** has changed 
- At least one:
### Tasks:
- set Corporate Representative, Engineer, Insurance Expert, Pricing Expert, Public Adjuster, Indoor Environmental Professional, Inspector
<a id="wf-754" href="#wf-754"></a>
## "ON_CHANGE Type of Claim to FIGA - lock automation"
### Conditions:
- All:
  - **Type of Claim** has changed to _FIGA_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Lock Automation = Yes
