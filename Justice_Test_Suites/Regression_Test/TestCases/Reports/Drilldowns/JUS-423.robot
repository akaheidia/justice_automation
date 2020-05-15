*** Settings ***
Library   SeleniumLibrary
Resource  ../../../Resources/AllResources.robot

Documentation    Regression test for JUS-423: Reports: device drill down from Site Availability goes to wrong device.

Suite Setup      Open Browser and Log In  ${JUS_URL}  ${BROWSER}  ${JUS_USERNAME}  ${JUS_PASSWORD}
Suite Teardown   Log Out and Close Browser

Test Setup       Navigate to Site Report Page

*** Variables ***
${site}  ${site_device_down}
${ip1}   ${device_up_site_device_down}
${ip2}   ${device_down_site_device_down}

*** Test Cases ***
Confirm Site Availability Device Drill Down Loads Correct Data For First Device
    Confirm Device Availability Report Contains Value  ${ip1}
    Device Availability Drill Into Device  ${ip1}
    Confirm Device Overview Report Contains Value  ${ip1}

Confirm Site Availability Device Drill Down Loads Correct Data For Second Device
    Confirm Device Availability Report Contains Value  ${ip2}
    Device Availability Drill Into Device  ${ip2}
    Confirm Device Overview Report Contains Value  ${ip2}

*** Keywords ***
Navigate to Site Report Page
    Navigate to Site Availability Report
    Confirm Site Availability Reports Page Title
    sleep  2 seconds
    Change Report Time Range to Last Hour
    sleep  2 seconds
    Site Availability Drill Into Site  ${site}
