*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Settings - User Groups page.

*** Keywords ***

Click User Groups
    Click Element  ${settings_usergroups_menu}

Confirm User Groups Page Loaded
    Page Should Contain Element  ${usergroups_page_title}

Settings Select User Group
    [Arguments]  ${xmc}  ${group}
    Page Should Contain Element  xpath://div[text()='${xmc}']/../..//div[text()='${group}']
    Click Element  xpath://div[text()='${xmc}']/../..//div[text()='${group}']

Confirm Edit Button Present
    Page Should Contain Element  ${usergroups_edit_button}

Confirm Edit Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${usergroups_edit_button}
    Set Selenium Implicit Wait  ${orig_wait}
