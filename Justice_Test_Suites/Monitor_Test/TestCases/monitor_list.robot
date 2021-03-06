*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Monitor List page.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm List Page Loads
    Click Monitor
    Click List Slider
    Confirm List Page Loaded

Confirm End-Systems Tab Loads
    Click End-Systems Tab
    Confirm End-Systems Tab Selected

Confirm Alarms Tab Loads
    Click Alarms Tab
    Confirm Alarms Tab Selected

Confirm Events Tab Loads
    Click Events Tab
    Confirm Events Tab Selected

Confirm Devices Tab Loads
    Click Devices Tab
    Confirm Devices Tab Selected
