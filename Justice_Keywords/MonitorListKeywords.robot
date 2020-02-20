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
