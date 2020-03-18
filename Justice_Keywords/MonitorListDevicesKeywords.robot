*** Settings ***
Library    SeleniumLibrary
Variables  ../Justice_Variables/PageLocators.py

Documentation    Keywords specific to the Devices tab on the Monitor List page.

*** Keywords ***

Refresh Devices Table
    Click Element  ${list_refresh_icon}

Is Test Device Present
    [Arguments]  ${ip}
    Click List Slider
    Show Filter Panel
    Confirm Filter Panel Visible
    Confirm Servers and Sites Filter Expanded
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Refresh Devices Table
    ${device_present}=  Run Keyword And Return Status  Confirm Device In Table  ${ip}
    [Return]  ${device_present}

Confirm Device In Table
    [Arguments]  ${device_ip}
    : FOR  ${index}  IN RANGE  1  10
    \    Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
    \    Exit For Loop If  ${found_device} == True
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Device Not In Table
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    : FOR  ${index}  IN RANGE  1  10
    \    Refresh Devices Table
    \    ${found_device}=  Run Keyword And Return Status  Table Should Contain  ${list_devices_table}  ${device_ip}
    \    Exit For Loop If  ${found_device} == False
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}

Confirm Device In Table No Wait
    [Arguments]  ${device_ip}
    Refresh Devices Table
    Table Should Contain  ${list_devices_table}  ${device_ip}

Confirm Device Not In Table No Wait
    [Arguments]  ${device_ip}
    ${orig_wait}=  Set Selenium Implicit Wait  1 second
    Refresh Devices Table
    Element Should Not Contain  ${list_devices_table}  ${device_ip}
    Set Selenium Implicit Wait  ${orig_wait}
