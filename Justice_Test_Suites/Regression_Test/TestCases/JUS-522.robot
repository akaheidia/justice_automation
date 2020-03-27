*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-522: Events: Filtering by both Server/Site and Event Type results in empty table.

Suite Setup      Log In and Navigate to Events Tab  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Set Both Server and Event Type Filter and Confirm Events Present
    Clear All Filters
    Confirm Events Present
    Confirm Events Table Not Empty
    Set Server Filter  ${XMC_HOSTNAME}
    sleep  2 seconds
    Confirm Events Present
    Confirm Events Table Not Empty
    Select Event Type Filter  Syslog
    Select Event Type Filter  Wireless
    sleep  2 seconds
    Confirm Events Present
    Confirm Events Table Not Empty
