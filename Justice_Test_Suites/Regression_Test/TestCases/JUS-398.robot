*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-398: Reports: Wireless Controller not showing up in Device Availability report.
...              This test assumes the Wireless Controller has already been created and is collecting/reporting statistics.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${wireless_device}    10.54.142.70
${site}               Wireless Site

*** Test Cases ***
Confirm Wireless Controller is Present in Device Availability Report
    ${device_present}=  Is Test Device Present  ${wireless_device}
    Run Keyword If  ${device_present} == True
    ...             Confirm Wireless Controller Present In Device Availability Report  ${wireless_device}
    ...       ELSE
    ...             Fail  Wireless Controller ${wireless_device} Has Not Been Created

*** Keywords ***
Confirm Wireless Controller Present In Device Availability Report
    [Arguments]  ${ip}
    Navigate to Site Availability Report
    sleep  1 second
    Change Report Time Range to Last Hour
    sleep  1 second
    Site Availability Drill Into Site  ${site}
    sleep  1 second
    Confirm Device Availability Report Contains Value  ${ip}
