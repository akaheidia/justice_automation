*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-348: LOGI: Usability Network summary can't click on device/site.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

*** Test Cases ***
Confirm Device Label Allows Drilldown
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Confirm Device Availability Panel Has Data
    Click Device Availability Device Drilldown  ${device_down_site_device_down}
    Confirm Device Overview Report Page Title
    Confirm Device Overview Report Contains Value  ${device_down_site_device_down}

Confirm Site Label Allows Drilldown
    Navigate to Network Summary Report
    Confirm Network Summary Reports Page Title
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Confirm Site Availability Panel Has Data
    Click Site Availability Site Drilldown  ${site_device_down}
    Confirm Device Availability Report Page Title
    Confirm Device Availability Report Contains Value  ${device_down_site_device_down}
