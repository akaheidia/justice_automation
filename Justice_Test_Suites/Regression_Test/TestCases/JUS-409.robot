*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-409: Events: Event Type Filter does not work.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Set Event Type Filter And Confirm Events Present
    Clear All Filters
    Confirm Events Present
    Confirm Events Table Not Empty
    Show Filter Panel
    Confirm Filter Panel Visible
    Select Event Type Filter  Syslog
    Select Event Type Filter  Wireless
    sleep  2 seconds
    Confirm Events Present
    Confirm Events Table Not Empty
