*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-565: Reports: Last Hour filter not giving data; Last 24 Hours does give data.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Last Hour Time Range Provides Data
    Navigate to Site Availability Report
    sleep  1 second
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    Apply Reports Filter
    sleep  1 second
    Confirm Site Availability Report Table Contains Value  ${site_device_down}
