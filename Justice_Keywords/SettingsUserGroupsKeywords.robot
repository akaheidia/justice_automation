*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Settings - User Groups page.

*** Keywords ***

Click User Groups
    Click Element  ${settings_usergroups_menu}

Confirm User Groups Page Loaded
    Wait Until Element Is Visible  ${usergroups_page_title}

Confirm User Group Details Loaded
    Wait Until Element Is Visible  ${usergroups_details_server_label}

Settings Select User Group
    [Arguments]  ${xmc}  ${group}
    Page Should Contain Element  xpath://div[text()='${xmc}']/../..//div[text()='${group}']
    Click Element  xpath://div[text()='${xmc}']/../..//div[text()='${group}']
    Wait Until Element Is Visible  xpath://div[@class='user-group-server-info']//div[contains(text(),'${xmc}')]

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
    Wait Until Element Is Visible  ${usergroups_edit_button}

Confirm Settings User Group Edit Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${usergroups_edit_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Close Button Present
    Wait Until Element Is Visible  ${usergroups_close_button}

Confirm Settings User Group Close Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${usergroups_close_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Cancel Button Present
    Wait Until Element Is Visible  ${usergroups_cancel_button}

Confirm Settings User Group Cancel Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${usergroups_cancel_button}
    Set Selenium Implicit Wait  ${orig_wait}


Confirm Settings User Group Save Button Present
    Wait Until Element Is Visible  ${usergroups_save_button}

Confirm Settings User Group Save Button Not Present
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Wait Until Element Is Not Visible  ${usergroups_save_button}
    Set Selenium Implicit Wait  ${orig_wait}
