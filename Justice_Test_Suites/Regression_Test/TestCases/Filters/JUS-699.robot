*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/AllResources.robot

Documentation    Regression test for JUS-699: Custom date range should be inclusive of end time.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm End-System Report Does Not Result In Error
    Navigate to Site Availability Report
    sleep  2 seconds
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
    Show Reports Filter Panel
    Set Reports Filter Time Range  Custom
    Apply Reports Filter
    sleep  2 seconds
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
