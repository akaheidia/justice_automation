*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-403: Reports - Port Utilization: operator does not exist: bigint = character varying.
...              This test assumes the devices have already been created which are collecting/reporting port statistics.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Variables ***
${device_ip}    10.54.142.32
${port_num}     ge.1.8
${site}         Port Test

*** Test Cases ***
Confirm Port Overview Loads Without Error
    ${device_present}=  Is Test Device Present  ${device_ip}
    Run Keyword If  ${device_present} == False  Fail  Test Device Is Not Present
    Navigate to Site Port Utilization Report
    Confirm Port Utilization Report Page Title
    Port Utilization Drill Into Site  ${site}
    Port Utilization Drill Into Port  ${port_num}
    Confirm Port Overview Report Page Title
