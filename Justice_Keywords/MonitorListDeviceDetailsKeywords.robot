*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Device Details page.

*** Keywords ***
Confirm Device Details Page Loaded
    [Arguments]  ${device_ip}
    Page Should Contain Element  ${device_details_ip_label}
    Page Should Contain Element  ${device_details_ip_label}/div[text()='${device_ip}']
    Page Should Contain Element  ${device_details_dashboard_link}
    Page Should Contain Element  ${device_details_ports_link}

Confirm Device Details Dahboard Page Loaded
    Page Should Contain Element  ${device_details_alarms_panel}
    Page Should Contain Element  ${device_details_events_panel}

Confirm Device Details Ports Page Loaded
    Page Should Contain Element  ${device_details_ports_list}

Device Details Click Back Arrow
    Page Should Contain Element  ${device_details_back_arrow}
    Click Element  ${device_details_back_arrow}

Device Details Click Dashboard Link
    Page Should Contain Element  ${device_details_dashboard_link}
    Click Element  ${device_details_dashboard_link}

Device Details Click Ports Link
    Page Should Contain Element  ${device_details_ports_link}
    Click Element  ${device_details_ports_link}

Select Port In Table
    [Arguments]  ${port_name}
    Wait Until Element Is Visible  xpath://div[text()='${port_name}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${port_name}']/../..//div[contains(@class,'center-checkboxes')]/mat-checkbox[not(contains(@class, 'checkbox-checked'))]
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${port_name}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${port_name} is already selected

Deselect Port In Table
    [Arguments]  ${port_name}
    Wait Until Element Is Visible  xpath://div[text()='${port_name}']
    ${need_to_click}=  Run Keyword And Return Status  Element Should Be Visible  xpath://div[text()='${port_name}']/../..//div[contains(@class,'center-checkboxes')]/mat-checkbox[contains(@class, 'checkbox-checked')]
    Run Keyword If  ${need_to_click} == True  Click Element  xpath://div[text()='${port_name}']/../..//div[contains(@class,'center-checkboxes')]
    ...       ELSE  Log  ${port_name} is already deselected


Confirm Port In Table
    [Arguments]  ${port_name}
    Refresh Devices Table
    Table Should Contain  ${device_details_ports_table}  ${port_name}

Confirm Port Not In Table
    [Arguments]  ${port_name}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Refresh Devices Table
    Element Should Not Contain  ${device_details_ports_table}  ${port_name}
    Set Selenium Implicit Wait  ${orig_wait}
