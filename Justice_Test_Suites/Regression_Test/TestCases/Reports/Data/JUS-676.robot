*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

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
    Apply Reports Filter
    sleep  2 seconds
    Confirm Device Availability Panel Has Data
    Click Device Availability Drilldown
    Confirm Reports Filter Time Range Value  Last Hour
    Confirm Top N Device Availability Report Contains Value  ${device_down_site_device_down}

Confirm Drilldown Correct For No Data
    Navigate to Network Summary Report
    sleep  2 seconds
    Confirm Network Summary Reports Page Title
    Show Reports Filter Panel
    Set Reports Filter Time Range  Custom
    Set Reports Filter Custom Start Date  03/01/2020
    Set Reports Filter Custom End Date    03/02/2020
    Apply Reports Filter
    sleep  2 seconds
    Confirm Device Availability Panel Has No Data
    Click Device Availability Drilldown
    Confirm Reports Filter Time Range Value  Custom
    Confirm Top N Device Availability Report Does Not Contain Value  ${device_down_site_device_down}
