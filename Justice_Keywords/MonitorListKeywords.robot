*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Monitor List page.

*** Keywords ***

Click List Slider
    Click Element  ${list_slider}

Click Devices Tab
    Click Element  ${devices_tab}

Click Endpoints Tab
    Click Element  ${endpoints_tab}

Click Alarms Tab
    Click Element  ${alarms_tab}

Click Events Tab
    Click Element  ${events_tab}

Confirm List Slider Selected
    ${selected_slider}=  Get Element Attribute  ${list_slider}  class
    Should Be Equal As Strings  ${selected_slider}  ${selected_slider_class}

Confirm List Page Loaded
    Page Should Contain Element  ${monitor_page_title}
    Page Should Contain Element  ${map_slider}
    Page Should Contain Element  ${list_slider}
    Confirm List Slider Selected

Confirm Devices Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${devices_page_url_suffix}

Confirm Endpoints Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${endpoints_page_url_suffix}

Confirm Alarms Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${alarms_page_url_suffix}

Confirm Events Tab Selected
    ${page_url}=  Get Location
    Location Should Contain  ${events_page_url_suffix}
