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
