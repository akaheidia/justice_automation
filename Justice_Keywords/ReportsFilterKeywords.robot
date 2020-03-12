*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Filter Panel of the Reports page.

*** Keywords ***

Change Report Time Range to Last Hour
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    Confirm Reports Filter Time Range Value  Last Hour
    Hide Reports Filter Panel

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

Set Reports Filter Time Range
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_time_range_field}
    Select From List By Label  ${reports_filter_panel_time_range_field}  ${value}
    Unselect Frame

Confirm Reports Filter Time Range Value
    [Arguments]  ${value}
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_time_range_field}
    List Selection Should Be  ${reports_filter_panel_time_range_field}  ${value}
    Unselect Frame

Apply Reports Filter
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_apply_button}
    Click Element  ${reports_filter_panel_apply_button}
    Unselect Frame
