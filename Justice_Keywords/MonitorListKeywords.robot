*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor List page.

*** Keywords ***

Click Devices Tab
    Click Element  ${list_devices_tab}

Click Endpoints Tab
    Click Element  ${list_endpoints_tab}

Click Alarms Tab
    Click Element  ${list_alarms_tab}

Click Events Tab
    Click Element  ${list_events_tab}

Refresh Devices Table
    Click Element  ${list_refresh_icon}

Confirm List Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${monitor_map_slider}
    Page Should Contain Element  ${monitor_list_slider}
    Confirm List Slider Selected

Confirm Devices Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_devices_page_url_suffix}

Confirm Endpoints Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_endpoints_page_url_suffix}

Confirm Alarms Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_alarms_page_url_suffix}

Confirm Events Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${list_events_page_url_suffix}

Confirm Table Contains Device
    [Arguments]  ${device_ip}
    : FOR  ${index}  IN RANGE  1  10
    \    Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
    \    Exit For Loop If  ${found_device} == True
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Table Does Not Contain Device
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}
