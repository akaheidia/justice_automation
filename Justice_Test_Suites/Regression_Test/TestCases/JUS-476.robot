*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-476: Reports: Server & Sites Filter is empty.

Suite Setup      Log In and Navigate to Reports
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Filter Panel Contains Servers
    Show Reports Filter Panel
    Confirm Reports Filter Panel Visible
    sleep  1 second
    Confirm Reports Filter Contains Server  ${XMC_HOSTNAME}
    Confirm Reports Filter Contains Server  ${XMC_2_HOSTNAME}

*** Keywords ***
Log In and Navigate to Reports
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Navigate to Reports
