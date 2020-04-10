*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
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

Set Reports Filter Custom Start Date
    [Arguments]  ${date}
    Select Frame  xpath://iframe
    Input Text  ${reports_filter_panel_custom_start_date}  ${date}
    Unselect Frame

Set Reports Filter Custom End Date
    [Arguments]  ${date}
    Select Frame  xpath://iframe
    Input Text  ${reports_filter_panel_custom_end_date}  ${date}
    Unselect Frame

Deselect Reports Filter Server
    [Arguments]  ${server}
#    "xpath://div[@class='server-site-filter']//li[1]//label[1]//input[1]"

Set Reports Filter Device Types
    [Arguments]  ${value}
    Select Frame  xpath://iframe

    # Open the Device Type selector
    ${closed}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_closed}
    Run Keyword If  '${closed}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Open

    # Deselect the "Check All" choice so the specified device types can be selected individually
    ${checked}=  Run Keyword And Return Status  Checkbox Should Be Selected  ${reports_filter_panel_device_type_check_all}
    Run Keyword If  '${checked}'  Click Element   ${reports_filter_panel_device_type_check_all}

    # Loop over the list of device types to select
    @{device_types}=  Split String  ${value}  ,
    :FOR  ${item}  IN  @{device_types}
    \    Page Should Contain Element  xpath://span[contains(text(),'${item}')]
    \    Click Element  xpath://span[contains(text(),'${item}')]

    # Close the Device Type selector
        ${open}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_open}
    Run Keyword If  '${open}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Closed

    Unselect Frame

Confirm Reports Filter Contains All Device Types
    Select Frame  xpath://iframe

    # Open the Device Type selector
    ${closed}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_closed}
    Run Keyword If  '${closed}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Open

    # Confirm the "Check All" choice is selected
    Checkbox Should Be Selected  ${reports_filter_panel_device_type_check_all}

    # Close the Device Type selector
    ${open}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_open}
    Run Keyword If  '${open}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Closed

    Unselect Frame

Confirm Reports Filter Does Not Contain All Device Types
    Select Frame  xpath://iframe

    # Open the Device Type selector
    ${closed}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_closed}
    Run Keyword If  '${closed}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Open

    # Confirm the "Check All" choice is selected
    Checkbox Should Not Be Selected  ${reports_filter_panel_device_type_check_all}

    # Close the Device Type selector
    ${open}=  Run Keyword And Return Status  Element Should Be Visible  ${reports_filter_panel_device_type_choice_list_open}
    Run Keyword If  '${open}'  Click Element  ${reports_filter_panel_device_type_field}
    ...      ELSE  Log To Console  Device Type Selector Already Closed

    Unselect Frame

Confirm Reports Filter Contains Server
    [Arguments]  ${server}
    Select Frame  xpath://iframe
    Page Should Contain Element  xpath://span[contains(text(), '${server}')]
    Unselect Frame

Apply Reports Filter
    Select Frame  xpath://iframe
    Page Should Contain Element  ${reports_filter_panel_apply_button}
    Click Element  ${reports_filter_panel_apply_button}
    Unselect Frame
