*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-398: Reports: Wireless Controller not showing up in Device Availability report.
...              This test assumes the Wireless Controller has already been created and is collecting/reporting statistics.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${wireless_device}    10.54.142.50

*** Test Cases ***
Confirm Wireless Controller is Present in Device Availability Report
    ${device_present}=  Is Wireless Controller Present  ${wireless_device}
    Run Keyword If  ${device_present} == True
    ...             Confirm Wireless Controller Present In Device Availability Report  ${wireless_device}
    ...       ELSE
    ...             Fail  Wireless Controller ${wireless_device} Has Not Been Created

*** Keywords ***
Is Wireless Controller Present
    [Arguments]  ${ip}
    Click List Slider
    Click Filter Icon
    Confirm Filters Panel Visible
    Confirm Servers and Sites Filter Expanded
    Select Servers and Sites Server Tree Node  ${XMC_HOSTNAME}
    Refresh Devices Table
    ${device_present}=  Run Keyword And Return Status  Confirm Device In Table  ${ip}
    [Return]  ${device_present}

Confirm Wireless Controller Present In Device Availability Report
    [Arguments]  ${ip}
    Navigate to Top N Device Availability Report
    Confirm Device Availability Report Contains Value  Wireless Controller
    Confirm Device Availability Report Contains Value  ${ip}
