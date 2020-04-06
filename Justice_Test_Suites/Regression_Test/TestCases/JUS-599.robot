*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-599: Reports: ERROR: invalid input syntax for type bigint: "".
...              This test assumes the devices have already been created which are collecting/reporting port statistics.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${device_ip}    10.54.142.32
${port_num}     ge.1.8
${site}         Port Test Site

*** Test Cases ***
Confirm Port Overview Loads Without Error
    ${device_present}=  Is Test Device Present  ${device_ip}
    Run Keyword If  ${device_present} == False  Fail  Test Device Is Not Present
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site}
    Device Availability Drill Into Device  ${device_ip}
    Device Overview Drill Into Metric  Port Utilization
    Port Utilization Drill Into Port  ${port_num}
    Confirm Port Overview Report Page Title
    Show Reports Filter Panel
    Confirm Port Overview Report Page Title
    Confirm Page Does Not Contain Text  ERROR: invalid input syntax for type bigint
