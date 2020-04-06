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

Settings User Group Click Edit
    Confirm Settings User Group Edit Button Present
    Click Element  ${usergroups_edit_button}

Settings User Group Click Close
    Confirm Settings User Group Close Button Present
    Click Element  ${usergroups_close_button}

Settings User Group Click Cancel
    Confirm Settings User Group Cancel Button Present
    Click Element  ${usergroups_cancel_button}

Settings User Group Click Save
    Confirm Settings User Group Save Button Present
    Click Element  ${usergroups_save_button}


Confirm Settings User Group Edit Button Present
    Page Should Contain Element  ${usergroups_edit_button}

Confirm Settings User Group Edit Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${usergroups_edit_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Close Button Present
    Page Should Contain Element  ${usergroups_close_button}

Confirm Settings User Group Close Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${usergroups_close_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Cancel Button Present
    Page Should Contain Element  ${usergroups_cancel_button}

Confirm Settings User Group Cancel Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${usergroups_cancel_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Save Button Present
    Page Should Contain Element  ${usergroups_save_button}

Confirm Settings User Group Save Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Page Should Not Contain Element  ${usergroups_save_button}
    Set Selenium Implicit Wait  ${orig_wait}
