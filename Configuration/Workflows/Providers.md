# Module: Providers
<a id="user-content-wf-82" href="#wf-82"></a>
## WF 82 - "On create" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- Add Eligibility Criterias
### Tasks with Details:
- Add Eligibility Criterias
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: resetProvidersEligibility}, 
    ``` 

<a id="user-content-wf-88" href="#wf-88"></a>
## WF 88 - "CHECK_ELIGIBILITY" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- CF calculateAllEligibilityCriteriaMet
### Tasks with Details:
- CF calculateAllEligibilityCriteriaMet
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateAllEligibilityCriteriaMet}, 
    ``` 

<a id="user-content-wf-112" href="#wf-112"></a>
## WF 112 - "CALCULATE_KPIS" (ON_SCHEDULE)
### Conditions:
- All:
- At least one:
### Tasks:
- CF calculateKPIS
### Tasks with Details:
- CF calculateKPIS
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateKPIS}, 
    ``` 

<a id="user-content-wf-122" href="#wf-122"></a>
## WF 122 - "REFRESH_BUYBACK_WALLET_VALUE" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- call refreshBuybackWalletValue
### Tasks with Details:
- call refreshBuybackWalletValue
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: refreshBuybackWalletValue}, 
    ``` 

<a id="user-content-wf-142" href="#wf-142"></a>
## WF 142 - "Underwrite" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _New_ 
  - **all_eligibility_criteria_met** is not _No_ 
- At least one:
### Tasks:
- Set Status := Underwriting-Completed
- Set Underwriter Name := current user
### Tasks with Details:
- Set Status := Underwriting-Completed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "Underwriting-Completed (rawtext)"
    }, 
    ``` 

- Set Underwriter Name := current user
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "underwriter": "fromUser-current (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-144" href="#wf-144"></a>
## WF 144 - "Approve" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Underwriting-Completed_ 
  - **master_purchase_agreement_date** is not empty 
- At least one:
### Tasks:
- Set Status := Approved-Not Yet Funded
- Set Approver Name := current user
### Tasks with Details:
- Set Status := Approved-Not Yet Funded
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "Approved-Not Yet Funded (rawtext)"
    }, 
    ``` 

- Set Approver Name := current user
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "approver": "fromUser-current (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-146" href="#wf-146"></a>
## WF 146 - "Close" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is not _Rejected_ 
- At least one:
### Tasks:
- Set Status := Rejected
### Tasks with Details:
- Set Status := Rejected
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "Rejected (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-149" href="#wf-149"></a>
## WF 149 - "Reopen" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Rejected_ 
- At least one:
### Tasks:
- Set Status := New
### Tasks with Details:
- Set Status := New
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "New (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-151" href="#wf-151"></a>
## WF 151 - "SET_PROVIDER_VALIDATION_DATE" (ON_MODIFY)
### Conditions:
- All:
  - **validated_by_provider_note** has changed 
  - **validated_by_provider_note** is not empty 
- At least one:
### Tasks:
- Set Validated by Provider Date := current date
### Tasks with Details:
- Set Validated by Provider Date := current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "validated_by_provider_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-152" href="#wf-152"></a>
## WF 152 - "RESET_PROVIDER_VALIDATION_DATE" (ON_MODIFY)
### Conditions:
- All:
  - **validated_by_provider_note** has changed 
  - **validated_by_provider_note** is empty 
- At least one:
### Tasks:
- Set Validated by Provider Date := empty
### Tasks with Details:
- Set Validated by Provider Date := empty
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "validated_by_provider_date": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-164" href="#wf-164"></a>
## WF 164 - "Bypass underwriting" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _New_ 
- At least one:
  - **all_eligibility_criteria_met** is not _Yes_ 
  - **all_eligibility_criteria_met** is not _Conditionally_ 
### Tasks:
- Set Status := Underwriting-Completed
- Set Underwriter Name := current user
### Tasks with Details:
- Set Status := Underwriting-Completed
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "Underwriting-Completed (rawtext)"
    }, 
    ``` 

- Set Underwriter Name := current user
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "underwriter": "fromUser-current (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-167" href="#wf-167"></a>
## WF 167 - "RESET_BANK_INFO_APPROVAL" (ON_MODIFY)
### Conditions:
- All:
- At least one:
  - **bank** has changed 
  - **account_no** has changed 
  - **routing_no** has changed 
### Tasks:
- Clean all approval data
### Tasks with Details:
- Clean all approval data
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "verified_by_approver": "18 (rawtext)",
      "verified_by_approver_date": " (rawtext)",
      "validated_by_provider_note": " (rawtext)",
      "validated_by_provider_date": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-168" href="#wf-168"></a>
## WF 168 - "Approve Bank Info" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _Claim Acceptant (H10)_ 
  - **verified_by_approver** is _18_ 
- At least one:
### Tasks:
- Set Verified by Approver:= current user
- Set Verified by Approver Date := current date
### Tasks with Details:
- Set Verified by Approver:= current user
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "verified_by_approver": "fromUser-current (rawtext)"
    }, 
    ``` 

- Set Verified by Approver Date := current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "verified_by_approver_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-169" href="#wf-169"></a>
## WF 169 - "Generate a Master Agreement" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Underwriting-Completed_ 
  - **investor** is not empty 
- At least one:
### Tasks:
- Generate a document from docx template “ClaimPay Master Purchase Agreement”
- Set Master Purchase Agreement Date= current date
### Tasks with Details:
- Generate a document from docx template “ClaimPay Master Purchase Agreement”
    ``` 
    taskType: VTGenerateTemplate, active: true 
    otherParameters: {template: N189, conditionString: , stopOnError: on}, 
    ``` 

- Set Master Purchase Agreement Date= current date
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "master_purchase_agreement_date": "get_date('today') (expression)"
    }, 
    ``` 

<a id="user-content-wf-170" href="#wf-170"></a>
## WF 170 - "Send a Master Agreement" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Underwriting-Completed_ 
  - **master_purchase_agreement_date** is not empty 
- At least one:
### Tasks:
- Send all documents of “Master Purchase Agreement” type attached to the Provider’s Email
### Tasks with Details:
- Send all documents of “Master Purchase Agreement” type attached to the Provider’s Email
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N38, email: [$(record : email)$], relations_email: -, emailoptout: true, smtp: , copy_email: , address_emails: , attachments: Providers, filter: DOCTYPE_000056}, 
    ``` 

<a id="user-content-wf-277" href="#wf-277"></a>
## WF 277 - "CALCULATE_KPIS_FROM_PORTFOLIOS" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- CF calculateKPISFromPortfolios
### Tasks with Details:
- CF calculateKPISFromPortfolios
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateKPISFromPortfolios}, 
    ``` 

<a id="user-content-wf-377" href="#wf-377"></a>
## WF 377 - "ON_CHANGE License to do business" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **date_of_license_to_do_business** has changed 
- At least one:
### Tasks:
- CF calculateKPIS
### Tasks with Details:
- CF calculateKPIS
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: calculateKPIS}, 
    ``` 

<a id="user-content-wf-385" href="#wf-385"></a>
## WF 385 - "INFO: Choose Investor before generating Master Purchase Agreement" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Underwriting-Completed_ 
  - **investor** is empty 
- At least one:
### Tasks:
### Tasks with Details:
<a id="user-content-wf-403" href="#wf-403"></a>
## WF 403 - "DOTS: REFRESH_BUYBACK_WALLET_VALUE" (TRIGGER)
### Conditions:
- All:
  - **current-role** is _DOTS (H46)_ 
- At least one:
### Tasks:
- call CF REFRESH_BUYBACK_WALLET_VALUE
### Tasks with Details:
- call CF REFRESH_BUYBACK_WALLET_VALUE
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: refreshBuybackWalletValue}, 
    ``` 

<a id="user-content-wf-437" href="#wf-437"></a>
## WF 437 - "New e-mail received (Provider)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Send Notification to Assigned to: attaching an e-mail to the Provider
### Tasks with Details:
- Send Notification to Assigned to: attaching an e-mail to the Provider
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: The e-mail has been attached to the Provider: <a href="$(record : CrmDetailViewURL)$">$(record : provider_name)$</a>, recipients: fromField-assigned_user_id, title: New e-mail received, skipCurrentUser: }, 
    ``` 

<a id="user-content-wf-455" href="#wf-455"></a>
## WF 455 - "Confirm Provider Email" (TRIGGER)
### Conditions:
- All:
  - **email_to_be_confirmed** is not empty 
- At least one:
### Tasks:
- Request Email Confirmation
### Tasks with Details:
- Request Email Confirmation
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: requestEmailConfirmation}, 
    ``` 

<a id="user-content-wf-468" href="#wf-468"></a>
## WF 468 - "Notification and an automated email: a new Provider is created" (ON_FIRST_SAVE)
### Conditions:
- All:
- At least one:
### Tasks:
- Notification: a new Provider is created
- ~Email: new Provider is created~
- New Provider created
### Tasks with Details:
- Notification: a new Provider is created
    ``` 
    taskType: VTWatchdog, active: true 
    otherParameters: {srcWatchdogModule: Notification, type: PLL_USERS, message: A new Provider is created: <a href="$(record : CrmDetailViewURL)$">$(record : provider_name)$</a>, recipients: Groups:47, title: New Provider is created, skipCurrentUser: }, 
    ``` 

- ~~Email: new Provider is created~~
    ``` 
    taskType: VTEmailTask, active: false 
    otherParameters: {active: false, subject:  A new Provider is created, content: Hello,<br />
    &nbsp; &nbsp; &nbsp; &nbsp; A new Provider is created: <a href="$(record : CrmDetailViewURL)$">$(record : provider_name)$</a>.<br />
    <br />
    Thank you<br />
    <img alt="" border="0" height="30" hspace="0" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMoAAAAoCAIAAAAwi/J2AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAABRjSURBVHhe7VwHVFRH215bLIh0sGCLFdEoKgiixh5r7Ar2bixYsBtj7D1WLGDvPcaO2GMhiCJFQVgWWKoUld7V/7k7wzDcXVZQOL+fh+e8h3O578zcKc+8Ze4FyacSlKDYQOkVFpf878tI94AYz+A4z6Cil+eBsQmpGeRZn0V6esab6Niw8KjomLeZmVn0bv549y7++YtXnt6vieBaHhpJdUWBlJS0F15+ue17vgoKDqO64kRaegZ7qCrxC5AGJyWn0NLfJCi9bvqGjt1z13jC8dL9nCoPPagz/LCO7aGiEm3bQxpDDpjOOCuNTCCPUwnwyWHvicEjZplZDazbpGvNhp1+NO3Wuv2QkRMWHDt5KSEhiZZTwqmzV0tVbqJX05JIKQ2TqbNWUF1R4JnHSw3Dljo12pD2y2iaDhttT3XFidf+Qbo12mhXs2BDyxVjS11jS6M67Uxb9Rn/25JHT57TOt8YKL2eyKNcpPIzHtIJjvdrTjj+w4B92raHDUYeKTo5Kum9x+mmL3mcCImJyUuWbzVu0LFslaYV9VtoV7fQq2WlX6utXk0rreoWFXSbl9NqatKyt9OBM7RCXpw+d72cdjPDOtZEUHi6/SqqKwrAHGpVN0d/SPvldX4aPm4e1RUn/AOCDWtbYxLY0ERiUNsapP9Bu5mGgZn9ovVZ2dm05jcDSq9HwZEXvAKv+4XcDw4//Txg3J57IFmFQfv1hh82Gn3UaNRRw68TtFC2v9O+m37kcTxg5Fu2HVRaMD9WVX9sn5+AZ6U1TW3HzE1KSqY1c3Dm/PXyus1ZSSz/jLmrqa4o4ObuLdFoXFarGVqGSErV6Td0OtUVJ0CvqnXbgUNsaPmJQR1rSaXGoyct/PjxI638bSAPvS6/DILceC2Q7KR7wCiHu9XHHRNINuLI15MM9NrvIqaX+3Of6vU7wGJVq9dBNGUqpbRmkx79JqWkptH6ChQ3vULkEdPmrLSbu2bW/LWQSdP/cDxwmuqKEwWnFxEwbOvOw7TytwEV9CLirCDZMTd/2+23q445WnHQAX0FyUSkKbgo0ysyKqbBTz00DFoqcwueCLGFfu22ovsoiTBrit2ftAkFipte/19QSS8hVNBuBsEwYe/5qdMxtqzZqDOyIlr/G0C+9CLi7C+Q7LCr35AtLqAIIxksWWFFmV6jJixAsMVPEK6rVG1dUa9FrUadG5v1RjQG3iAU48sY1W2Hyb3mfJ+2Ukh6eXj6OjiemL1g3cRpf8AU7dl/GhE0Ub2PT8SKBgaFSmXyYHn4hw8fyP20tHSkisEh4URkQWFRb3KXEDkHtLBw+IlUl9799Omxq8eaTY7TZq+ct2Tj8dOX4+MTqUKBgMCQXU4n0QG7uau3Ohzx9QukCg4iehnWaYd5WLZqx7ZdR7c5HJm/ZGOdJl35yan2Y/syVUydDpyl9fPiidsL2Da7easnTv8DgdqBIxcwFqKKjX3nL1UMPFAeGhaFO6mpaYEyORJwjIsIRpeZmUnK88C4ZIrhE0GbfNr+GXoRuekvvxcUduCR74CNN/VHHqkEko0sNMlE9Hr4+BloBK6QqRFmp14HbE2rTjanzl4LDYtEvzGkfYfOmbbuW0nfjGcYDN7Pv4zOzqbLX0B6PfnvRe+BU7AeZbWa/oAoSrc5fuJav5bV5BnLMDU2Y+w1jVrhQTCczSz6JSXRnP/xfx461S2q1+tQo/7PkCpGrQePmE1UwG6nUxgIdgJibROzXhkZmVFRMQNt7dBJbB48ApsBF41a9Lp09Q7Kp6dnzP99k0GttmUUWgg4gQzx9+XbRJGTiF4GtduiD+/e52bfL7z8jBt2hKVnY8cEjpm8iKpzcMPl3449RmNouQPXFgYOOi5cuhkJe+eeYwlNtaqZoySq4CnIpfBojIsIlgC0Jg3yGGBjh1q0WMOOlfTMZs1fQ3UFpBeRmwECyZz+fdV3/Q3dEYcrDT6AlFDEITUiotfoiQsxVDYvhFuDhs9MTk6lJXKA1bLubMv7UJASowVBSYGC0AskwPziEbABrCQRLBuqwE1j8bBU+BUW1KRlH0avh0+eVzIwAwuhEgrrNu83bAZRATv3nIC/hh+HCsXsF22w7jIcfOJ3DkTTqDWaRZI7csICBEk8JyD4VVKhEWwqbVQBlfTClqNqBabPWcWPHWPs0nsc1SmwYu0uFEDHRP2BYERQNWrREyoyNGSg7bqNIBUXLdtSSsMENzE0SEV9M4yLWXQCWDjk+DrGbUgZOGssk7vHS6ouFL2IuATI7waF7b73suea6zq2hzUEkgns4cMslcLTKzbuXd0mXflUEbunqXnfRKWskADDgG3A3CEPF8S4jaRCQzgdov0svQ4fu1hG01QUqYhEt6YlHkGu8Yim5r8yej1y9QAz2PJgBgfaziQqYJfjSdgnokL7lY1aaddoo/wg3MFSYaMjBRapiID3sCjOtx7SdgtGr9Ub9qIWawT9bN9tJNV9+rR+sxOojIqsgLII52c5Q0P1n38ZReoGykLxaFYXZTA0VzdPoiXYvuso/3SQuM+g36hOgULTi4iLVH5HFrbzjk+3lVe1bIRTU8PPkYyn1627T2B+WLcgWKG9+9WlY4g5jBt2wqoTQdhhO3YuUamnV4A0GJ4IYS8rAMFkgQSYTb2aee4T+WJ6ESFMgseEgLI81Ugj+Klh2BJ9xtLy2gp6sIu5Rx4q6RWSEzARDB4+q5JBS9YCmu01YApRIfjDJMOoMC1EGHh1iypVzWF1+PtEeHoB8DD8xGKYsM1Up0C3PuMrG7ZiBeBzz1+8SXUKfCG9rrwMuugtu+EfcjswdKuLV6c/r1QZdhDGTE1qydNLtCSYOAwboSXR5ofExOSk5JRcyVl+9fRCXCXEGTmriAuwp7JhyxaWA9p3HwmfCI9pIJCAVod8Db3QDiiLsGbMpEUIg1CL8YMI7mhVs+g3dDryXxOz3ngWezS8FXIalvqppFdY+BuizcjIcNh7QquqOesYBD2ZPX8tKdB38FQMjTWOgVeB7axm3qrdYFg47E9o+boQEb0ePHQHQVkZdLVJqz6YeaJFOqJnnGvywdrmlv2RBhEtwZfQ6x8f2W3/0MiElIdBkRe8A5Fd3gkMW3Pled3JJ4VjWKWoiwhPLwQE/JKg3+hZalqe06yCQw293kTHYcHYTsVcwzfVb/bLxUu3klOEIC86Jg4eBJPOk+Br6IXpBr1c7jwiWoe9x2HDmBaCX1et3020Pq8ChICPc0CwK8wBiehFOtC519heA6f0GjDZosNQWA62ukQQzl5zfoC6r3ylGAXTglsILcysBsBvILdAgdDwKMT1GAvPMBG9kGrgcbx9wtxevHKbaDf8tY/3jAg31212IiqGL6EX7JaLP7U0INk9afglH5lrRNTw7XeQVIpYxYSn19IV2/klAfHNOwzNyvr822uVUEOvy9fu8iosFSIwN3dvomXYuHU/X+xr6IX4Y/CIWVSHvORNDFIqFsjj6fWaduffn/YZ/Bs8GtHiEWj81p3HRCWiFxHNqq2x3hDsEyPuPgiERyPvRuqKunv3n+HXHs/FNhPFbcCcBev4gYvoBRw9eYlvB+6bvBAD8zp0H4V8hdzHDkEHkO+TWgxfSK9bOfQCohJTznsFIt4fsaOg9Fq3yYlfEoQgyNvj854MFRxq6LVx6wF+dmA54LOIikdqalqTlr3RDVLsa+iFa2weqlNk+EjNWMvK6zd83PyK+tS8EXq5qKWXSoFVxiPQzr1/3UhdJKF8Yo7rxcu2EBWP8IioGvV/ZuZTuXtwhXCImBBSAPsE5eMTEl8HBGlXszDMmRPM+YSpv9M6HL7QOd7wk6dn0Reo4fHJhF7EeolCLiY8vbAnfuCWBNOKgbm5exGtSoBD8Ag2Y+yJDLCxmzl3DcmT1dBr4R9/Id5kqnJaTXfuOU5UIgy0tcPuJ8W+kl4r11HfB7x9F8/TC9tddHBgO3aeiF7qrZdKgf3Dzjl45AKpCCDsq8A55fI6zc//kyfoZmjXdQRiMlJMmV4AhqM4/aZNYbueuXDDwfEE27ek2yq/2vjC0B4Mc34t9495n/3hY3RSamHp5eHpC4fIFgwCTsycl3scpwzLjjaSio0QaRKRlKvHcmA19Fq0bEteejXbsfsYUYkwwGZGUdELkSXVqaIXohmqU6Cw9IJPRGcQokEqG7WCWcITEa3fvEWjPYIxkxfz9EKxc387U11eWHf5DL3koRFQMQuHDnTsMdq6y3Bm0uCpMSiVb9Mpve7Lws97SkUcUi9wkec8pXcCwtzk0WBboeiF+KCV9SAE1KR/EAShIByz7SLscjxRXjeXJZAyVZru3neKaNXQa/P2g3mco36LkRMWEBWPlJTUxma9iso5Fiu92nQchryvXbcRkO6/Tpw6azl4Q6J1HvaL1vP7CvRasHQz1XGQh0UiZmKHWyrpBUyYupS5WpTHcPhDRMzwoWN/06J5Qen16s3biz4CXUAUEY3UC0j2t7dg9hi9RCEXE55eALKnMpqmrIu4AL0QBbPEhGHPvlMgIn9+gwgA5cnbMUANva4530f6zVQgsa5xm8euHkTLsHajI9/Ct0kvcjChHJ6rxL5D5xAJkIoQ/VpWmFt/aTBV58DOfjU/8Pzo5er2AiaKzQAvOjUQN/fM72NPSi8gMT3TKzLumm/IOc9AkIbnUEGksPSKjIqp2bATM7AQMAa/YhjwegjJEUms2eiIxYCRJ3xixcpUMbXLIRCghl4xse/qmHTRzTk7RQABEtc16Xr6/HXMCEK3iMhoxBaYVj7D/5bpJZdHEK16vPYP0uPeQ2DSkHJiUNecH8BUZ2d/AE3nLFyPeIAnTX70AmAp0TdWkglM15LlW2khJeTSiyAtK/t19Pubr+UgGTFLBZTC0gvYu/90qcpN+OwaIkyxYUsE/rDGMO9YD15LDq5qNuoUHkFPFwE19AKmzV4JT8qzU8e4jYaBWVPzvladbOuadlO8iCyyY9VvxHoByH4wLfzAtapZaBq1am7Z37KTDebws8eqPLAh+WESMRAO+az8A+gnJ8oQ04sg68OH4LcJd6XhiNkLGPIXKvZiGP/b7xINE1Gn8xMwAIMB7S5evkXrK6CeXrLgMEwibyYhRnXbg2TwuWiQv0/k+6DX02fe2KjsyI0IHqFdQxi46D4RNfRKTU37qU0/2H6+PBzLsNFzaAlVEOiFiD/obcK71DzH+QQRCckPgyL/9paBZ5d8xJTi5cvohRh/5Pj5pTRMEBywfaZSoEWuhA3nqPTFvXp6ASdOX0FqDRep5hF6tawYgb4PegF/bT+E3cuHrcqCmWfXaugFbNp2kAX4RLAc/Dt4ZVDrdS9QyBzd5G9ik1W8mcFNqP7xCYLHzC/2/4xzHH20VD/HPTde0RbzYs3GvViAclrNVNoSCNa7tKZp/Wa/kE+mRPgsvYB9h85i7lCMj7GIYNlwv06TrtVy7nwtvdZ9K/QC1m5yBAn4V4dMQKyKei0Qm7KBq6eXLCjUsLY1HCIrbNnRJivn+FMlKL0eBEWAXjBRMFQwVzBayocY8WkZLyJir74KRoKJNFNEr3vB4f023pR021W2/z5lAbckv+695Znv1Hi/9J88YxmGirkAz0ARXGCv4Lqivlljs15LV2zjvwXlcezkJUmpOihPRCKpPV7VCbKbu1efwVNh3hGNomXSPqwaZnnKzOUBgSEduo+UlG8gtKBhgtAkMZF+HXT/obukQkPSJUFbtl73vhOJCvhrx2GJpBZRCVpJrcV/5oa6cW/fgyIIMam2fEPz9kOoToG+Q6ZJytQlWjwCjV9XvDQEfP1kFYQPHpsRLbpdSa9FoExOtAWHy53HnXuORdSVO3DF54SgCGbV08tPz9gS4SnuY5hmbQfSakrA3uZpihbyO6NmoPR6ER4Ly6TwgDIEW8IxqTQMHhNBGCnAkJqZ5fvmnbMfYn8pH/tffx2yw9ln7gHXJceeiuXo0/mHXC88yTcAZHgTHYsxwJjNsF81cfofM+etQQrpcvuxmj9yBB67etiOnYvyRHC9/8h5qlPCC09fh73kY+ilwsfQ+06xj6Gv3rhvM8YeLYyZvNh+0Xr28t/PP2jUxIUTpi0l7Y8YvwBugqgAeIdhilpEcH2O+yglKTkFoxg7ZQnRop3lax2oToFtDkeHj5tHtHgEGvfyeU1UkZEx6CS2CtHiYtKMZdHRcURbWLi6eW7decRu3ho8xX7RBv5j6KUrt4+atJB0b9nqHeSmMtAB5iXgZ2o17vzZzuSG9vCAT0OjL72EBxROv0AdEA4pJBLJtEyxAczM/iCLi78dEKYweALJznpKo3K8SQm+P7x/n1CvaXcWvSAGgAmguvyRSy+CxPRM78i468Lpl/Sit4wczV/zDfGKjIOKFsrBx48fw94nIcEEHc95Bcri1P0Rdgn+p4GMCoEK4Rb8o2bV1s+e5370nB/E9CJIz8qWxlLjBF8psMdTCsPmHhr9NkUc+5MvJkro9R1DHhqBvIod7iAC6z0wz0fP+UE1vQhgnMLjcw8mQDKFK5Q9Do4CpWihnC8mSuj1/cHT22+308nN2w62sOyPzIAd6yA/QJxKC6mFOnoxxCWnwW4hwCIeE/YMci8wPORd4sePn8gXEyX0+v6wYu0uicQYYRb/xymVDMw69xr7oWD/baBA9CJISs98GfX2hpAzCuE8BKy6Jw0nX0yU0Ov7A9J2/kgPYljHuoJu83sPVH/YooxC0IsgI/tDYFzCnZywTMEz4QyshF7fH5TpJdEwmbs4zx8LqUeh6UUAyxgRn/woKAq+8ryX9JKP7KynFNkAVZfgu8CGLfvLagl/DwxBXC+p1HjoqDkq/xVAfvhCejG8TUl/FhZz+WUwbBiCMHq3BN8F1m5ylJRvoFXNXLu6RYOfeqxavye7kP9C7GvpRZCckZmYVtD/bVmC/xWER7x57Orx31PP5y9exat9cZIfioZeJSiBSpTQqwTFiBJ6laDY8OnT/wF1YP1VipGBzgAAAABJRU5ErkJggg==" style="width:150px;height:30px;margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0px;border:0px solid black;" vspace="0" width="150" /><br />
    &nbsp;, recepient: akutowska@dotsystems.pl; ian.molina@claimpal.net; Paul@claimpay.net; jesse@claimpay.net, emailcc: , emailbcc: , fromEmail: , smtp: 3, emailoptout: }, 
    ``` 

- New Provider created
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N106, email: [], relations_email: -, emailoptout: , smtp: 3, copy_email: , address_emails: , attachments: , filter: All, groups_email: 47, conditionString: }, 
    ``` 

<a id="user-content-wf-601" href="#wf-601"></a>
## WF 601 - "An automated email when Provider status goes to Approved-Not Yet Funded" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **provider_status** has changed 
  - **provider_status** is _Approved-Not Yet Funded_ 
- At least one:
### Tasks:
- Provider approved
### Tasks with Details:
- Provider approved
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N111, email: [], relations_email: -, emailoptout: , smtp: 3, copy_email: , address_emails: , attachments: , filter: All, groups_email: 47, conditionString: }, 
    ``` 

<a id="user-content-wf-753" href="#wf-753"></a>
## WF 753 - "Reset Password Trigger" (TRIGGER)
### Conditions:
- All:
  - **email** is not empty 
  - **portal_is_active** is _1_ 
- At least one:
### Tasks:
- Call createResetPasswordLink
- ~Send email with reset password link~
### Tasks with Details:
- Call createResetPasswordLink
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createResetPasswordLink}, 
    ``` 

- ~~Send email with reset password link~~
    ``` 
    taskType: VTEmailTemplateTask, active: false 
    otherParameters: {active: false, template: N148, email: [], relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-755" href="#wf-755"></a>
## WF 755 - "Send Activation Link" (TRIGGER)
### Conditions:
- All:
  - **email** is not empty 
  - **portal_is_active** is _0_ 
- At least one:
### Tasks:
- call createActivationLink
- Send Portal Activation Link
### Tasks with Details:
- call createActivationLink
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createActivationLink}, 
    ``` 

- Send Portal Activation Link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N149, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-757" href="#wf-757"></a>
## WF 757 - "Generate signed agreement" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Generate and send Signed ClaimPay NDA
### Tasks with Details:
- Generate and send Signed ClaimPay NDA
    ``` 
    taskType: VTGeneratePackage, active: true 
    otherParameters: {package: Signed ClaimPay NDA, conditionString: , shouldSend: , shouldDropbox: , stopOnError: }, 
    ``` 

<a id="user-content-wf-760" href="#wf-760"></a>
## WF 760 - "Reset Password Send Email" (ON_EVERY_SAVE)
### Conditions:
- All:
  - **portal_reset_password_link** is not empty 
- At least one:
### Tasks:
- Send email with reset password link
- Empty reset password link
### Tasks with Details:
- Send email with reset password link
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N148, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

- Empty reset password link
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "portal_reset_password_link": " (rawtext)"
    }, 
    ``` 

<a id="user-content-wf-765" href="#wf-765"></a>
## WF 765 - "No portfolio (email to ClaimPay)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- send email to ClaimPay
### Tasks with Details:
- send email to ClaimPay
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N153, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-821" href="#wf-821"></a>
## WF 821 - "Create new Portfolio (Provider Portal)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Create portfolio
### Tasks with Details:
- Create portfolio
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createPortfolio}, 
    ``` 

<a id="user-content-wf-822" href="#wf-822"></a>
## WF 822 - "Generate onetime password (Provider)" (TRIGGER)
### Conditions:
- All:
  - **portal_is_active** is _1_ 
- At least one:
### Tasks:
- ~Tymczasowo - tworzone hasło~
- Create one time password
### Tasks with Details:
- ~~Tymczasowo - tworzone hasło~~
    ``` 
    taskType: VTUpdateFieldsTask, active: false 
    taskTypeParameters: {
      "onetime_password": "PMC2023!! (rawtext)"
    }, 
    otherParameters: {active: false}, 
    ``` 

- Create one time password
    ``` 
    taskType: VTEntityMethodTask, active: true 
    otherParameters: {methodName: createOnetimePassword}, 
    ``` 

<a id="user-content-wf-828" href="#wf-828"></a>
## WF 828 - "Claims imported (email to Provider)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Email to Provider: Claims imported
### Tasks with Details:
- Email to Provider: Claims imported
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N152, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-829" href="#wf-829"></a>
## WF 829 - "Claims imported with error (email to Provider)" (MANUAL)
### Conditions:
- All:
- At least one:
### Tasks:
- Email to Provider: Claims imported with error
### Tasks with Details:
- Email to Provider: Claims imported with error
    ``` 
    taskType: VTEmailTemplateTask, active: true 
    otherParameters: {template: N156, email: , relations_email: -, emailoptout: , copy_email: , address_emails: , attachments: , filter: All, groups_email: -, conditionString: }, 
    ``` 

<a id="user-content-wf-848" href="#wf-848"></a>
## WF 848 - "Calculate Other Owner and Total allocation" (ON_EVERY_SAVE)
### Conditions:
- All:
- At least one:
  - **owner_alloc_1** has changed 
  - **owner_alloc_2** has changed 
  - **owner_alloc_3** has changed 
  - **owner_alloc_4** has changed 
  - **owner_alloc_5** has changed 
### Tasks:
- calculate Other Owner, Total allocation
### Tasks with Details:
- calculate Other Owner, Total allocation
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "other_owner": "owner_alloc_3+ owner_alloc_4+ owner_alloc_5 (expression)",
      "total_alloc": "owner_alloc_1+ owner_alloc_2+ owner_alloc_3+  owner_alloc_4+ owner_alloc_5 (expression)"
    }, 
    ``` 

<a id="user-content-wf-865" href="#wf-865"></a>
## WF 865 - "Approved - Funded" (TRIGGER)
### Conditions:
- All:
  - **provider_status** is _Approved-Not Yet Funded_ 
- At least one:
### Tasks:
- Set Status := Approved-Funded
### Tasks with Details:
- Set Status := Approved-Funded
    ``` 
    taskType: VTUpdateFieldsTask, active: true 
    taskTypeParameters: {
      "provider_status": "Approved-Funded (rawtext)"
    }, 
    ``` 

