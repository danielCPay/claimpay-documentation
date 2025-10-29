# Module: Cases, Section: Complaint
- <a href="#wf-313"> "1 day after Ds Notice of Appearance Entered is set"</a>
- <a href="#wf-590"> "2 days after Complaint Status set to Filing Team"</a>
- <a href="#wf-314"> "3 day after Ds Notice of Appearance Entered is set"</a>
- <a href="#wf-567"> "90 days after Service of Process change (AOB)"</a>
- <a href="#wf-296"> "Answer changed"</a>
- <a href="#wf-565"> "Answer date (Complaint stage) changed (AOB or HO Cases)"</a>
- <a href="#wf-297"> "Answer Deadline changed"</a>
- <a href="#wf-298"> "Answer field empty 7 days after after Answer Deadline"</a>
- <a href="#wf-177"> "Change of Complaint Status"</a>
- <a href="#wf-717"> "Complaint Status change to Case Closed-Plaintiff to pay Fees/Costs"</a>
- <a href="#wf-283"> "Complaint Status change to Case Filed (Total Balance &gt;=15000)"</a>
- <a href="#wf-618"> "Complaint Status change to Case Filed (Total Balance&lt;15000)"</a>
- <a href="#wf-615"> "Complaint Status change to Complaint Printed"</a>
- <a href="#wf-286"> "Complaint Status change to Correction Queue - in Eportal"</a>
- <a href="#wf-293"> "Complaint Status change to Dismissed - Failure to Appear PTC"</a>
- <a href="#wf-294"> "Complaint Status change to Dismissed - Not Served"</a>
- <a href="#wf-295"> "Complaint Status change to FWOP - need to set aside"</a>
- <a href="#wf-285"> "Complaint Status change to LSOP Case - Pending Pmt"</a>
- <a href="#wf-616"> "Complaint Status change to LSOP Case - Service Pending"</a>
- <a href="#wf-594"> "Complaint Status change to LSOP Package Prepared"</a>
- <a href="#wf-288"> "Complaint Status change to Motion to Compel Answer"</a>
- <a href="#wf-290"> "Complaint Status change to Motion to Set Aside Dismissal - Filed"</a>
- <a href="#wf-291"> "Complaint Status change to Motion to Set Aside Dismissal- Prepared"</a>
- <a href="#wf-591"> "Complaint Status change to Need to Reissue or Pay for Summons"</a>
- <a href="#wf-595"> "Complaint Status change to Pending Filing"</a>
- <a href="#wf-596"> "Complaint Status change to Possible Paid Prior to Filing"</a>
- <a href="#wf-592"> "Complaint Status change to Summons - Reissued"</a>
- <a href="#wf-593"> "Complaint Status change to Summons - Reissued Miami Dade"</a>
- <a href="#wf-638"> "Complaint Status change to Voluntary Dismissal w/ Prejudice"</a>
- <a href="#wf-637"> "Complaint Status change to Voluntary Dismissal w/o Prejudice - No Fees"</a>
- <a href="#wf-636"> "Complaint Status change to Voluntary Dismissal w/o Prejudice - Re-file"</a>
- <a href="#wf-724"> "Complaint Status change to Withdrew as Counsel"</a>
- <a href="#wf-311"> "Ds MFET to File Answer changed"</a>
- <a href="#wf-310"> "Empty Answer date and and Ds MFET to File Answer = current day + 120"</a>
- <a href="#wf-289"> "Motion to Dismiss changed"</a>
- <a href="#wf-292"> "PTC (Small Claims) changed"</a>
- <a href="#wf-502"> "Service of Process date changed"</a>
- <a href="#wf-617"> "Service of Process has changed"</a>
- <a href="#wf-844"> "Set Final Status to CLOSED when Complaint Status changed to ..."</a>
- <a href="#wf-673"> "Set Lock Automation when Complaint status changed to FIGA - Litigation Stay"</a>
- <a href="#wf-287"> "Summons Issued changed"</a>
----------------------
<a id="wf-313" href="#wf-313"></a>
## "1 day after Ds Notice of Appearance Entered is set"
### Conditions:
- All:
  - **Ds Notice of Appearance Entered** is not empty 
  - **Ds Notice of Appearance Entered** days ago _1_ 
- At least one:
### Tasks:
- send email template &quot;Ps Depo Requests&quot; to OPPOSING_COUNSEL_EMAIL
<a id="wf-590" href="#wf-590"></a>
## "2 days after Complaint Status set to Filing Team"
### Conditions:
- All:
  - **Stage** is _Complaint_ 
  - **Status** is _Case Filed_ 
  - **Status Age** equal to _2_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager in 2 days to after Complayant status is set to Case Filed &quot;Check docket for executed summons for&quot;
<a id="wf-314" href="#wf-314"></a>
## "3 day after Ds Notice of Appearance Entered is set"
### Conditions:
- All:
  - **Ds Notice of Appearance Entered** is not empty 
  - **Ds Notice of Appearance Entered** days ago _3_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Depoitions to &quot;Coordinate Deposition of D's Corp Rep and Field Adjuster in&quot;
- create task for Case Manager to &quot;Add Opposing Counsel's info to file in&quot;
<a id="wf-567" href="#wf-567"></a>
## "90 days after Service of Process change (AOB)"
### Conditions:
- All:
  - **Type of Claim** is _AOB_ 
  - **Service of Process** is not empty 
  - **Service of Process** days ago _90_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create document template &quot;Ps PFS&quot;
- create task for Assigned Attorney to &quot;Review and Edit Ps PFS to send to Defendant in AOB case re:&quot;
<a id="wf-296" href="#wf-296"></a>
## "Answer changed"
### Conditions:
- All:
  - **Answer** has changed 
  - **Answer** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- ~create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@~
- ~draft package Reply~
- ~set Complaint status to Answer~
- Generate package Reply
- create task for Assigned Attorney to Review Answer and Affirmative Defenses for possible Motion to Strike in @@CASE ID@@ @@INJUREDPARTY_NAME@@
- set Complaint status to Answer
<a id="wf-565" href="#wf-565"></a>
## "Answer date (Complaint stage) changed (AOB or HO Cases)"
### Conditions:
- All:
  - **Answer** has changed 
  - **Answer** is not empty 
  - **Lock Automation** is _0_ 
  - **Insurance Company** does not contain _Citizens Property_ 
- At least one:
  - **Type of Claim** is _HO_ 
  - **Type of Claim** is _AOB_ 
### Tasks:
- generate package CRN
- create task for RPA Team to &quot;Send @@CASE_ID@@ Civil Remedy Notice CRN&quot;
<a id="wf-297" href="#wf-297"></a>
## "Answer Deadline changed"
### Conditions:
- All:
  - **Answer Deadline** has changed 
  - **Answer Deadline** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add event to Attorney  and Case Manager calendar &quot;Answer Due in&quot;
<a id="wf-298" href="#wf-298"></a>
## "Answer field empty 7 days after after Answer Deadline"
### Conditions:
- All:
  - **Answer** is empty 
  - **Answer Deadline** is not empty 
  - **Answer Deadline** days ago _7_ 
- At least one:
### Tasks:
- ~change Complaint status to Answer Overdue~
- ~draft package Motion for Default~
- ~create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;~
- Generate package Motion for Default
- create task for Scheduling Team - Hearings to &quot;Unilaterally set Ps Motion for Default for hearing in&quot;
- change Complaint status to Answer Overdue
<a id="wf-177" href="#wf-177"></a>
## "Change of Complaint Status"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is not empty 
- At least one:
### Tasks:
- Update Previous Stage, Previous Status, Status, Status Age, Status Date, Stage
<a id="wf-717" href="#wf-717"></a>
## "Complaint Status change to Case Closed-Plaintiff to pay Fees/Costs"
### Conditions:
- All:
  - **Complaint Status** has changed to _Case Closed-Plaintiff to pay Fees/Costs_ 
- At least one:
### Tasks:
- Set Lock automation
<a id="wf-283" href="#wf-283"></a>
## "Complaint Status change to Case Filed (Total Balance &gt;=15000)"
### Conditions:
- All:
  - **Complaint Status** is _Case Filed_ 
  - **Complaint Status** has changed 
  - **Lock Automation** is _0_ 
  - **Total Balance** greater than or equal to _15000_ 
- At least one:
### Tasks:
- ~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~
- Set Case Filed date
- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $424.35&quot;
<a id="wf-618" href="#wf-618"></a>
## "Complaint Status change to Case Filed (Total Balance&lt;15000)"
### Conditions:
- All:
  - **Complaint Status** is _Case Filed_ 
  - **Complaint Status** has changed 
  - **Lock Automation** is _0_ 
  - **Total Balance** less than _15000_ 
- At least one:
### Tasks:
- ~add task for Case Manager in 2 days to &quot;Check docket for executed summons for&quot;~
- Set Case Filed date
- add entry to Costs Tab/Module for &quot;Fililing Fee in the amount of $320.85&quot;
<a id="wf-615" href="#wf-615"></a>
## "Complaint Status change to Complaint Printed"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Complaint Printed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- ~create package &quot;Complaint Package&quot;~
- ~create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;~
- ~set Complaint Package Prepared~
- Generate package &quot;Complaint Package&quot;
- create task for Case Manager to &quot;Go to Dropbox and File Complaint Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@; once filed change status to Case Filed.&quot;
- set Complaint Package Prepared
<a id="wf-286" href="#wf-286"></a>
## "Complaint Status change to Correction Queue - in Eportal"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Correction Queue - in Eportal_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case mamager to &quot;Review Correction Queue for&quot;
<a id="wf-293" href="#wf-293"></a>
## "Complaint Status change to Dismissed - Failure to Appear PTC"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Dismissed - Failure to Appear PTC_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
<a id="wf-294" href="#wf-294"></a>
## "Complaint Status change to Dismissed - Not Served"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Dismissed - Not Served_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Assigned Attorney to &quot;Draft Motion to Set Asside Dismissal for&quot;
<a id="wf-295" href="#wf-295"></a>
## "Complaint Status change to FWOP - need to set aside"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _FWOP - need to set aside_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Assigned Attorney to &quot;Draft Motion to Set Aside FWOP for&quot;
<a id="wf-285" href="#wf-285"></a>
## "Complaint Status change to LSOP Case - Pending Pmt"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _LSOP Case - Pending Pmt_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for SUPERVISOR to &quot;Pay LSOP for&quot;
- add entry to Costs Tab/Module for &quot;Service Fee in the amount of $15.55&quot;
- set Complaint Status to LSOP Case - Service Pending
<a id="wf-616" href="#wf-616"></a>
## "Complaint Status change to LSOP Case - Service Pending"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _LSOP Case - Service Pending_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager &quot;Check for and add Notice of Service of Process to @@CASE ID@@ @@INJUREDPARTY_NAME@@; once added change status to LSOP Case - Served.&quot;
<a id="wf-594" href="#wf-594"></a>
## "Complaint Status change to LSOP Package Prepared"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _LSOP Package Prepared_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve LSOP PACKAGE through LSOP website
<a id="wf-288" href="#wf-288"></a>
## "Complaint Status change to Motion to Compel Answer"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Motion to Compel Answer_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearing to &quot;Coordinate hearing on Motion to Compel Answer&quot;
<a id="wf-290" href="#wf-290"></a>
## "Complaint Status change to Motion to Set Aside Dismissal - Filed"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Motion to Set Aside Dismissal - Filed_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Scheduling Team - Hearings to &quot;Coordinate hearing on Motion to Set Aside Dismissal in&quot;
<a id="wf-291" href="#wf-291"></a>
## "Complaint Status change to Motion to Set Aside Dismissal- Prepared"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Motion to Set Aside Dismissal- Prepared_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- create task for Case Manager to &quot;File Motion to Set Aside Dismissal in&quot;
<a id="wf-591" href="#wf-591"></a>
## "Complaint Status change to Need to Reissue or Pay for Summons"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Need to Reissue or Pay for Summons_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Reissue or Pay for Summons for Case Manager
<a id="wf-595" href="#wf-595"></a>
## "Complaint Status change to Pending Filing"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Pending Filing_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;E-file initial package in Florida E-file Portal
<a id="wf-596" href="#wf-596"></a>
## "Complaint Status change to Possible Paid Prior to Filing"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Possible Paid Prior to Filing_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for SUPERVISOR &quot;Check with Claimpay and/or client for possible payment prior to filing&quot;
<a id="wf-592" href="#wf-592"></a>
## "Complaint Status change to Summons - Reissued"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Summons - Reissued_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve Summons on Defendant via LSOP
<a id="wf-593" href="#wf-593"></a>
## "Complaint Status change to Summons - Reissued Miami Dade"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Summons - Reissued Miami Dade_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- add task for Case Manager &quot;Serve Summons on Defendant
<a id="wf-638" href="#wf-638"></a>
## "Complaint Status change to Voluntary Dismissal w/ Prejudice"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Voluntary Dismissal w/ Prejudice_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared, Final Status
- send e-mail template Closing Email - Voluntary Dismissal w Prejudice
<a id="wf-637" href="#wf-637"></a>
## "Complaint Status change to Voluntary Dismissal w/o Prejudice - No Fees"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Voluntary Dismissal w/o Prejudice - No Fees_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared, Final Status
- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice No Fees
<a id="wf-636" href="#wf-636"></a>
## "Complaint Status change to Voluntary Dismissal w/o Prejudice - Re-file"
### Conditions:
- All:
  - **Complaint Status** has changed 
  - **Complaint Status** is _Voluntary Dismissal w/o Prejudice - Re-file_ 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Package Prepared
- send e-mail template Closing Email - Voluntary Dismissal wo Prejudice Re-File
- create task for Case Manager to &quot;Review case for deficiencies to cure before re-filing&quot;. 
<a id="wf-724" href="#wf-724"></a>
## "Complaint Status change to Withdrew as Counsel"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Complaint Status** has changed to _Withdrew as Counsel_ 
- At least one:
### Tasks:
- Set Final Status CLOSED and set Locked Automation 
<a id="wf-311" href="#wf-311"></a>
## "Ds MFET to File Answer changed"
### Conditions:
- All:
  - **Ds MFET to File Answer** has changed 
  - **Ds MFET to File Answer** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Complaint Status to Ds MFET (Answer) 
- create task for Scheduling Team - Hearings to &quot;Negotiate agreed order (no more than 30 days extension) with OC or Schedule Motion for Extension of Time for Hearing ASAP for&quot;
<a id="wf-310" href="#wf-310"></a>
## "Empty Answer date and and Ds MFET to File Answer = current day + 120"
### Conditions:
- All:
  - **Answer** is empty 
  - **Ds MFET to File Answer** is not empty 
  - **Ds MFET to File Answer** days ago _120_ 
- At least one:
### Tasks:
- create task for Assigned Attorney &quot;Review for re: MFET&quot;
<a id="wf-289" href="#wf-289"></a>
## "Motion to Dismiss changed"
### Conditions:
- All:
  - **Motion to Dismiss** has changed 
  - **Motion to Dismiss** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- set Complaint status to Motion to Dismiss
- Create task for Scheduling Team - Hearings to &quot;Confirm with @@ATTORNEY_NAME@@ that MTD in @@CASE ID@@ @@INJUREDPARTY_NAME@@ can be set for hearing; if so, reach out to OC to set hearing 
<a id="wf-292" href="#wf-292"></a>
## "PTC (Small Claims) changed"
### Conditions:
- All:
  - **PTC (Small Claims)** has changed 
  - **PTC (Small Claims)** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- ~create &quot;Ps Motion to Invoke Rules and Waive Appearance&quot; document~
- ~draft package Ps Motion to Invoke Rules and Waive Appearance~
- ~add event to calendar &quot;Pre-Trial Conference&quot; for Assign To and Case Manager~
- ~change status to &quot;Pretrial Conference &quot;~
- Create package Ps Motion to Invoke Rules and Waive Appearance
- add event to calendar &quot;Pre-Trial Conference&quot; for Assign To, Case Manager and AOB/DTP attorney
- change Complaint status to &quot;Pretrial Conference &quot;
<a id="wf-502" href="#wf-502"></a>
## "Service of Process date changed"
### Conditions:
- All:
  - **Service of Process** has changed 
  - **Service of Process** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- Set Plaintiff Discovery Status to 1st Disco Set - Served, 1st Disco Set - Served
<a id="wf-617" href="#wf-617"></a>
## "Service of Process has changed"
### Conditions:
- All:
  - **Service of Process** has changed 
  - **Service of Process** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- change Complaint Status to LSOP Case Served
- add calendar event 23 days after Service of Process for Assign To and Case Manager
<a id="wf-844" href="#wf-844"></a>
## "Set Final Status to CLOSED when Complaint Status changed to ..."
### Conditions:
- All:
  - **Lock Automation** is _0_ 
- At least one:
  - **Complaint Status** has changed to _Voluntary Dismissal w/o Prejudice-Recover in HOS_ 
  - **Complaint Status** has changed to _Defendant's Motion for Judgment on the Pleadings Granted with Prejudice_ 
  - **Complaint Status** has changed to _Defendant's Motion for Summary Judgment Granted_ 
  - **Complaint Status** has changed to _Plaintiff's Motion for Summary Judgment Granted_ 
  - **Complaint Status** has changed to _Defendant's Motion for Fees/Costs Filed_ 
  - **Complaint Status** has changed to _Plaintiff's Motion for Fees/Costs Filed_ 
  - **Complaint Status** has changed to _Appeal Filed_ 
  - **Complaint Status** has changed to _Appeal Lost_ 
  - **Complaint Status** has changed to _No Longer Attorney-Attorney Lien Filed_ 
  - **Complaint Status** has changed to _Defendant's Motion to Dismiss Granted Without Prejudice-No Leave to Amend_ 
  - **Complaint Status** has changed to _Plaintiff's Motion for New Trial_ 
  - **Complaint Status** has changed to _Trial Lost at Directed Verdict_ 
  - **Complaint Status** has changed to _Trial Lost by Jury Verdict_ 
  - **Complaint Status** has changed to _Trial won_ 
  - **Complaint Status** has changed to _Dismissed at FWOP Hearing_ 
### Tasks:
- Set Final Status to CLOSED
<a id="wf-673" href="#wf-673"></a>
## "Set Lock Automation when Complaint status changed to FIGA - Litigation Stay"
### Conditions:
- All:
  - **Lock Automation** is _0_ 
  - **Complaint Status** has changed to _FIGA - Litigation Stay_ 
- At least one:
### Tasks:
- Set Lock Automation = Yes
<a id="wf-287" href="#wf-287"></a>
## "Summons Issued changed"
### Conditions:
- All:
  - **Summons Issued** has changed 
  - **Summons Issued** is not empty 
  - **Lock Automation** is _0_ 
- At least one:
### Tasks:
- ~change Complaint status to &quot;Summons - Executed&quot;~
- ~draft package LSOP Package~
- ~task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;~
- Generate package LSOP Package
- task for Case Manager to &quot;Go to Dropbox and Upload LSOP Package for @@CASE ID@@ @@INJUREDPARTY_NAME@@ to LSOP Website; once filed change status to Case in LSOP Case - Pending Pmt.&quot;
- change Complaint status to &quot;Summons - Executed&quot;
