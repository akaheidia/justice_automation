*** Settings ***
Library   SeleniumLibrary
Resource  ../Resources/AllResources.robot

Documentation    Regression test for JUS-676: Reports: Inconsistent data between Network Summary and associated Drilldown contents.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Drilldown Correct For Last Hour
    Navigate to Network Summary Report
    sleep  2 seconds
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Hour
    sleep  2 seconds
    Click Device Availability Drilldown
    Confirm Reports Filter Time Range Value  Last Hour
    Confirm Top N Device Availability Report Contains Value  ${device_down_site_device_down}

Confirm Drilldown Correct For Last Month
    Navigate to Network Summary Report
    sleep  2 seconds
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Last Month
    sleep  2 seconds
    Click Device Availability Drilldown
    Confirm Reports Filter Time Range Value  Last Month
    Confirm Top N Device Availability Report Does Not Contain Value  ${device_down_site_device_down}
