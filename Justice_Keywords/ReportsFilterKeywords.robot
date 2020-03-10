*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Filter Panel of the Reports page.

*** Keywords ***

Click Filter Button
    Select Frame  xpath://iframe
    Click Element  ${reports_filter_icon}
    Unselect Frame

Show Reports Filter Panel
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Select Frame  xpath://iframe
    ${need_to_show}=  Run Keyword And Return Status  Element Should Not Be Visible  ${reports_filter_panel_shown}
    Run Keyword If  ${need_to_show}  Click Element  ${reports_filter_icon}
    ...    ELSE  Log  Filter Panel Already Shown
    Unselect Frame
    Set Selenium Implicit Wait  ${orig_wait}

Hide Reports Filter Panel
    Select Frame  xpath://iframe
    ${need_to_hide}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_shown}
    Run Keyword If  ${need_to_hide}  Click Element  ${reports_filter_icon}
    ...    ELSE  Log  Filter Panel Already Hidden
    Unselect Frame

Confirm Reports Filter Panel Visible
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_shown}
    Unselect Frame

Confirm Reports Filter Panel Not Visible
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_hidden}
    Unselect Frame
