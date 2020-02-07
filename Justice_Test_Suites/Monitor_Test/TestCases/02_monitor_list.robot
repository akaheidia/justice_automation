*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Tests the Monitoring List page.

Suite Setup      Open Browser and Log In  ${URL}  ${BROWSER}  ${USERNAME}  ${PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***

Confirm Page Loads
    Click Monitor
    Click List Slider
    Confirm List Page Loaded

Confirm Endpoints Tab Loads
    Click Endpoints Tab
    Confirm Endpoints Tab Selected

Confirm Alarms Tab Loads
    Click Alarms Tab
    Confirm Alarms Tab Selected

Confirm Events Tab Loads
    Click Events Tab
    Confirm Events Tab Selected

Confirm Devices Tab Loads
    Click Devices Tab
    Confirm Devices Tab Selected
