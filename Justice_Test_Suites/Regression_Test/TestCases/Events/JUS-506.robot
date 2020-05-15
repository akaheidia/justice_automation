*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-506: Events: Navigating to last page shows empty table if more than 10,000 events.

Suite Setup      Log In and Navigate to Events View
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Last Page Loads
    Go To Last Page
    sleep  2 seconds
    Confirm Events Present
    Confirm Events Table Not Empty

*** Keywords ***
Log In and Navigate to Events View
    Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
    Click Monitor
    Click List Slider
    Click Events Tab
    Confirm Events Tab Selected
    Clear All Filters
    Hide Filter Panel
    sleep  2 seconds
    Confirm Events Present
    Confirm Minimum Number of Events Present  1000
